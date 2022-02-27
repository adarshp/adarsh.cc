---
layout: post
title: "Building Kaldi with MacPorts"
date: 2022-02-27
---

Introduction
------------

This post contains instructions for building the Kaldi programs and libraries
on macOS[^linux] assuming you are using MacPorts as your package manager.
Currently, there are two methods for building Kaldi. The first one uses a set
of bash scripts and Makefiles, while the second, newer one is based on CMake.
While the Kaldi documentation states that the CMake method is not as well
tested and some features are missing currently, I chose this route for a couple
of reasons:

- The old build process is not robust enough to detect the presence of OpenBLAS
  installed using MacPorts, and suggests that the user download the Intel MKL
  library.
- The old build process builds the programs and libraries within the source
  tree, which makes it harder to generate different variants of the build, and
  also makes it harder to clean up build outputs. In contrast, CMake supports
  *out-of-source* builds, which overcome these limitations.


Steps
-----

First, clone the Kaldi repo and `cd` into it.

```bash
git clone https://github.com/kaldi-asr/kaldi
cd kaldi
```

If you don't already have CMake, install it by running:

```bash
sudo port install cmake
```

I followed the instructions in `cmake/INSTALL.md` to build with the
[Ninja](https://ninja-build.org) generator (since Ninja is faster than Make).
To install Ninja, you can run:

```bash
sudo port install ninja
```

Then, you can run the following commands to build the Kaldi programs and
libraries.

```bash
mkdir -p build
cd build
cmake -GNinja -DCMAKE_INSTALL_PREFIX=../dist ..
cmake --build . --target install
```

The default value for `CMAKE_INSTALL_PREFIX` is `/usr/local`, but we change it
by setting the option `-DCMAKE_INSTALL_PREFIX=../dist`, which tells CMake to
set the output directory for the compiled programs and libraries to the
`../dist` folder (i.e., `kaldi/dist`, if your current working directory is
`build`).

I then ran the `yesno` example to see if Kaldi was built successfully.

cd into the `kaldi/egs/yesno/s5` folder

In order to run the script, you will need the `wget` program. If you don't
already have it, you can install it by running:

```bash
sudo port install wget
```

At the bottom of the `kaldi/cmake/INSTALL.md` file, you'll see a note to modify
your `PATH` environment variable in order to run the test scripts. If you've
been following the instructions so far, you can run this command to append the
location of the Kaldi binaries to your `PATH`:

```bash
export PATH=$PATH:../../../dist/bin
```

This will tell your shell to look in the `kaldi/dist/bin` folder for the Kaldi
programs. If you want this setting to persist across terminal sessions, then
you should add a line to your `~/.bash_profile` to do so:

```bash
export PATH=$PATH:$KALDI_ROOT/dist/bin
```

where `KALDI_ROOT` is the location of your local clone of the `kaldi`
repository.

This next step took a little while to figure out. You will need to comment out
line 121 of the file `kaldi/egs/wsj/s5/utils/prepare_lang.sh`:

```bash
[ -f path.sh ] && . ./path.sh
```

The `path.sh` script sets environment variables assuming that you did the
old-style build rather than the CMake build, which results in a dynamic library
loading error.

Once you have commented out that line, you should be able to run the following
command to run the `yesno` example (this assumes you are in the
`kaldi/egs/yesno/s5` directory):

```bash
./run.sh
```

Here is the output I get, indicating the program has run successfully.

```bash
--2022-02-27 13:50:14--  http://www.openslr.org/resources/1/waves_yesno.tar.gz
Resolving www.openslr.org (www.openslr.org)... 46.101.158.64
Connecting to www.openslr.org (www.openslr.org)|46.101.158.64|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://us.openslr.org/resources/1/waves_yesno.tar.gz [following]
--2022-02-27 13:50:14--  https://us.openslr.org/resources/1/waves_yesno.tar.gz
Resolving us.openslr.org (us.openslr.org)... 46.101.158.64
Connecting to us.openslr.org (us.openslr.org)|46.101.158.64|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4703754 (4.5M) [application/x-gzip]
Saving to: 'waves_yesno.tar.gz'

waves_yesno.tar.gz                100%[============================================================>]   4.49M  2.48MB/s    in 1.8s

2022-02-27 13:50:17 (2.48 MB/s) - 'waves_yesno.tar.gz' saved [4703754/4703754]

x waves_yesno/
x waves_yesno/1_0_0_0_0_0_1_1.wav
x waves_yesno/1_1_0_0_1_0_1_0.wav
x waves_yesno/1_0_1_1_1_1_0_1.wav
x waves_yesno/1_1_1_1_0_1_0_0.wav
x waves_yesno/0_0_1_1_1_0_0_0.wav
x waves_yesno/0_1_1_1_1_1_1_1.wav
x waves_yesno/0_1_0_1_1_1_0_0.wav
x waves_yesno/1_0_1_1_1_0_1_0.wav
x waves_yesno/1_0_0_1_0_1_1_1.wav
x waves_yesno/0_0_1_0_1_0_0_0.wav
x waves_yesno/0_1_0_1_1_0_1_0.wav
x waves_yesno/0_0_1_1_0_1_1_0.wav
x waves_yesno/1_0_0_0_1_0_0_1.wav
x waves_yesno/1_1_0_1_1_1_1_0.wav
x waves_yesno/0_0_1_1_1_1_0_0.wav
x waves_yesno/1_1_0_0_1_1_1_0.wav
x waves_yesno/0_0_1_1_0_1_1_1.wav
x waves_yesno/1_1_0_1_0_1_1_0.wav
x waves_yesno/0_1_0_0_0_1_1_0.wav
x waves_yesno/0_0_0_1_0_0_0_1.wav
x waves_yesno/0_0_1_0_1_0_1_1.wav
x waves_yesno/0_0_1_0_0_0_1_0.wav
x waves_yesno/1_1_0_1_1_0_0_1.wav
x waves_yesno/0_1_1_1_0_1_0_1.wav
x waves_yesno/0_1_1_1_0_0_0_0.wav
x waves_yesno/README~
x waves_yesno/0_1_0_0_0_1_0_0.wav
x waves_yesno/1_0_0_0_0_0_0_1.wav
x waves_yesno/1_1_0_1_1_0_1_1.wav
x waves_yesno/1_1_0_0_0_0_0_1.wav
x waves_yesno/1_0_0_0_0_0_0_0.wav
x waves_yesno/0_1_1_1_1_0_1_0.wav
x waves_yesno/0_0_1_1_0_1_0_0.wav
x waves_yesno/1_1_1_0_0_0_0_1.wav
x waves_yesno/1_0_1_0_1_0_0_1.wav
x waves_yesno/0_1_0_0_1_0_1_1.wav
x waves_yesno/0_0_1_1_1_1_1_0.wav
x waves_yesno/1_1_0_0_0_1_1_1.wav
x waves_yesno/0_1_1_1_0_0_1_0.wav
x waves_yesno/1_1_0_1_0_1_0_0.wav
x waves_yesno/1_1_1_1_1_1_1_1.wav
x waves_yesno/0_0_1_0_1_0_0_1.wav
x waves_yesno/1_1_1_1_0_0_1_0.wav
x waves_yesno/0_0_1_1_1_0_0_1.wav
x waves_yesno/0_1_0_1_0_0_0_0.wav
x waves_yesno/1_1_1_1_1_0_0_0.wav
x waves_yesno/README
x waves_yesno/0_1_1_0_0_1_1_1.wav
x waves_yesno/0_0_1_0_0_1_1_0.wav
x waves_yesno/1_1_0_0_1_0_1_1.wav
x waves_yesno/1_1_1_0_0_1_0_1.wav
x waves_yesno/0_0_1_0_0_1_1_1.wav
x waves_yesno/0_0_1_1_0_0_0_1.wav
x waves_yesno/1_0_1_1_0_1_1_1.wav
x waves_yesno/1_1_1_0_1_0_1_0.wav
x waves_yesno/1_1_1_0_1_0_1_1.wav
x waves_yesno/0_1_0_0_1_0_1_0.wav
x waves_yesno/1_1_1_0_0_1_1_1.wav
x waves_yesno/0_1_1_0_0_1_1_0.wav
x waves_yesno/0_0_0_1_0_1_1_0.wav
x waves_yesno/1_1_1_1_1_1_0_0.wav
x waves_yesno/0_0_0_0_1_1_1_1.wav
Preparing train and test data
Dictionary preparation succeeded
utils/prepare_lang.sh --position-dependent-phones false data/local/dict <SIL> data/local/lang data/lang
Checking data/local/dict/silence_phones.txt ...
--> reading data/local/dict/silence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/silence_phones.txt is OK

Checking data/local/dict/optional_silence.txt ...
--> reading data/local/dict/optional_silence.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/optional_silence.txt is OK

Checking data/local/dict/nonsilence_phones.txt ...
--> reading data/local/dict/nonsilence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/nonsilence_phones.txt is OK

Checking disjoint: silence_phones.txt, nonsilence_phones.txt
--> disjoint property is OK.

Checking data/local/dict/lexicon.txt
--> reading data/local/dict/lexicon.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/lexicon.txt is OK

Checking data/local/dict/extra_questions.txt ...
--> data/local/dict/extra_questions.txt is empty (this is OK)
--> SUCCESS [validating dictionary directory data/local/dict]

**Creating data/local/dict/lexiconp.txt from data/local/dict/lexicon.txt
```


Note that these instructions are accurate as of the date of writing this post
(2022-02-27). These hacks may not be needed for future versions of Kaldi.

[^linux]: Though I have not tried this out, I think the instructions here will
transfer pretty well to a Linux distro (e.g., Ubuntu), with the `port install` commands replaced by
calls to the distro's package manager (e.g., `apt`).
