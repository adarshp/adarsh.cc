---
layout: post
title: "Working with MacPorts and Python"
date: 2022-02-12
---

For a number of reasons, I prefer [MacPorts](https://www.macports.org) over
[Homebrew](https://brew.sh) to manage packages on my macOS machines.

Working with multiple versions of Python can be a
[headache](https://xkcd.com/1987/). In this post, I'll describe how I use
MacPorts to manage Python versions for development purposes.

For context, I've tried a number of different ways to manage Python on my macOS
computers over the years: Anaconda, Homebrew-provided Python packages, pyenv,
etc., and this is what I found works best for me.

Unlike Homebrew, MacPorts does not clutter up your `/usr/local` directory, by
default installing packages to `/opt/local` instead. And unlike Anaconda,
MacPorts Python packages work harmoniously with other packages on your system,
and does not try to [supplant your system
compiler](https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html).

With that said, let's move on to a few practical tips on using MacPorts to
manage Python versions. In the following instructions, I assume that you have
already installed MacPorts on your system[^1].

Managing multiple versions of Python and pip
--------------------------------------------

To install a specific version of of Python along with the corresponding version of
`pip`, do

```bash
sudo port install py<major><minor>-pip
````

where `<major>` and `<minor>` are the major and minor version number of Python
that you are trying to install[^2]. For example, if you wanted to install Python
3.10 (the latest version at the time of writing this (2022-02-12)), you would
run the following command.

```bash
sudo port install py310-pip
```

To activate a particular version of Python and pip, you would use the `port select`
command. You can put the following snippet in your `~/.bash_profile`[^3] to
simplify the process.

```bash
# Usage: activate_py <major_version><minor_version>
# Example:
#
#    activate_py 310
#
# will activate Python 3.10
activate_py() {
    local major_version=$(echo $1 | cut -c 1)
    local minor_version=$(echo $1 | cut -d "$major_version" -f2)
    sudo port select --set python python"$1"
    sudo port select --set python"$major_version" python"$1"
    sudo port select --set pip pip"$1"
    sudo port select --set pip"$major_version" pip"$1"
}
```

The above snippet defines a function named `activate_py` that can be invoked to
switch between Python versions. For example:

```bash
activate_py 310
```

will activate Python 3.10 and the corresponding version of `pip`.

Managing packages
-----------------

Python packages can either be installed within a [virtual
environment](https://docs.python.org/3/tutorial/venv.html) or system-wide.
I'll describe both methods and when to use them below.

### Installing packages in virtual environments

In general, it is best to have a distinct Python virtual environment for each
Python project you are working on that may have conflicting dependencies. I
have the following snippet in my `~/.bash_profile` to create a virtual
environment in a directory called `~/.venvs` (the directory will be created if
it does not yet exist).

```bash
# Create a new Python virtual environment
#
# Usage:
#
#    make_venv <project_name>
#
make_venv() {
    mkdir -p ~/.venvs
    
    # We redirect stderr to stdout for the command 'python --version' since
    # for Python 2.x, the version is output to stderr instead of stdout.
    local major_version=$(python --version 2>&1 | cut -c 8)

    if [[ $major_version == "3" ]]; then
        python -m venv ~/.venvs/$1
    elif [[ $major_version == "2" ]]; then
        python -m virtualenv ~/.venvs/$1
    else
        echo "Error: Python major version was not determined to be either 2 or 3."
        return 1
    fi
}
```

For example, if you invoke the following command:

```bash
make_venv myproject
```

a virtual environment named `myproject` will be created at
`~/.venvs/myproject`.

Note that if you are using Python 2[^py2warning], you will also need to install
the appropriate version of the `virtualenv` package separately in order for the
above snippet to function. For example, if you are using Python 2.7, you will
also need to run the following command to enable the creation of Python 2.7
virtual environments:

```bash
sudo port install py27-virtualenv
````

I also have the following companion snippet in my `~/.bash_profile` to quickly
activate virtual environments that have been created with `make_venv`.

```bash
# Activate a Python virtual environment
#
# Usage:
#
#    activate <virtual environment name>
#
activate() {
    source ~/.venvs/$1/bin/activate
}
```


For example, invoking `activate myproject` at the command line will activate
the `myproject` virtual environment, automatically pointing your `python` and
`pip` invocations to the correct binaries, and bringing the packages installed
within the virtual environment into scope for usage in Python scripts. Note
that you must activate the virtual environment before installing packages in
order to correctly isolate the package installations.


### Installing packages system-wide (advanced)

If you do not anticipate working on multiple Python projects with potentially
conflicting dependencies, this route might be the one for you, since you would
not need to activate virtual environments every time you wanted to do anything
Python-related that goes beyond Python's standard library. However, if you are
still new to juggling multiple versions of Python, I would recommend simply
sticking with the virtual environment approach outlined above. It is easier to
go from virtual environments to system-wide package installations than the
other way around[^system-site-packages].

Popular packages such as `numpy` and `matplotlib` have dedicated ports and can
be installed system-wide by invoking:

```bash
sudo port install py-<packagename>
```

For example, running the following command

```bash
sudo port install py-numpy
```

will install `numpy` system-wide for the version of Python that you currently
have active. If you want to check whether a port exists for a given Python
package, you can use the `port search` command:

```bash
port search py-<packagename>`
```

If you want to install a package system-wide that does not have an existing
port, you can simply use `pip`:

```bash
sudo pip install <packagename>
```

[^1]: Ideally, you would also have removed other Python distributions that you
installed yourself (e.g. the one from Python.org, Anaconda, etc.), unless you
are a bit more advanced and thus adept at managing your `PATH` environment
variable appropriately to work with multiple Python distributions.

[^2]: The `sudo` in the invocation is required if you install MacPorts to the
default location (`/opt/local`). However, if the MacPorts root directory is
somewhere else, e.g., in your home directory (e.g., `~/macports`), then you may not need to
prefix your invocation with `sudo`.

[^3]: If you are using `zsh`, put the snippet in `~/.zprofile` instead.

[^py2warning]: Python 2 support [ended on January 1,
2020](https://www.python.org/doc/sunset-python-2/), so you really should not be
using it unless you are working with legacy code that is completely unfeasible
to port to Python 3.

[^system-site-packages]: The two methods can also co-exist if you pass the
command line flag `--system-site-packages` to the `python -m venv` invocation,
but that is beyond the scope of this post, since it is unlikely that you will
need to do this.
