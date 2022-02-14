---
layout: post
title: "Working with MacPorts and Python"
date: "February 12, 2022"
---

For a number of reasons, I prefer [MacPorts](https://www.macports.org) over
[Homebrew](https://brew.sh) to manage packages on my macOS machines.

Working with multiple versions of Python can be a
[headache](https://xkcd.com/1987/). In this post, I'll describe how I use
MacPorts to manage Python versions for development purposes.

For context, I've tried a number of different ways to manage Python on my
computer: Anaconda, Homebrew-provided Python, pyenv, etc., and this is what
I found works best for me.

Unlike Homebrew, MacPorts does not clutter up your `/usr/local` directory, by
default installing packages to `/opt/local` instead. And unlike Anaconda,
MacPorts Python packages work harmoniously with other packages on your system,
and does not try to [supplant your system
compiler](https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html).

With that said, let's move on to a few practical tips on using MacPorts to
manage Python versions.

To install the latest version of Python along with the corresponding version of
`pip`, do

```bash
sudo port install py<major><minor>-pip
````

where `<major>` and `<minor>` are the major and minor version number of Python
that you are trying to install[^1]. For example, if you wanted to install Python
3.10 (the latest version at the time of writing this (2022-02-12)), you would
run the following command.

```bash
sudo port install py310-pip
```

To activate a particular version of Python and pip, you would use the `port select`
command. You can put the following snippet in your `~/.bash_profile`[^2] to
simplify the process.

```bash
# Usage: activate_py <major_version><minor_version>
# Example:
#
#    activate_py 310
#
# will activate Python 3.10
activate_py() {
    major_version=$(echo $1 | cut -c 1)
    minor_version=$(echo $1 | cut -d "$major_version" -f2)
    sudo port select --set python python"$1"
    sudo port select --set python"$major_version" python"$1"
    sudo port select --set pip pip"$1"
}
```

The snippet above defines a function `activate_py` that can be invoked to
switch between Python versions. For example:

```bash
activate_py 310
```

will activate Python 3.10 and the corresponding version of `pip`.

[^1]: The `sudo` in the invocation is required if you install MacPorts to the
default location (`/opt/local`). However, if the MacPorts root directory is
somewhere else, e.g., in your home directory (`~`), then you may not need to
prefix your invocation with `sudo`.

[^2]: If you are using `zsh`, put the snippet in `~/.zprofile` instead.
