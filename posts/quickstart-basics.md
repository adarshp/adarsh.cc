---
layout: post
title: "Quickstart: Basics"
date: "2022-02-18"
---

Introduction
------------

This post contains 'quickstart' instructions for setting up a software
development environment and learning basic skills such as working with the
command line and using the Vim text editor, all of which you will need to do if
you are working with me on research projects. Feel free to skip any material
that you are already familiar with.


(Windows users only) Operating system
-------------------------------------

If you already have macOS or Linux on your laptop, you can skip this section.

Since I am not familiar with programming on Windows, and have run into numerous
issues in the past while trying to help students develop software on their
Windows machines, I now ask students who don't have a macOS or Linux laptop to
install Ubuntu on their laptop in a dual-booting setup. Ubuntu is a popular,
relatively user-friendly flavor of Linux that I recommend for people who are
new to Linux. Follow the instructions
[here](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview) to
install Ubuntu.


Command Line
------------

Read the following sections of the [PDF
version](https://sourceforge.net/projects/linuxcommand/files/TLCL/19.01/TLCL-19.01.pdf/download)
of [*The Linux Command Line*](http://linuxcommand.org/index.php):

- Page xvi: Why use the command line?
- Pages 2-3: Terminal emulators, command history, cursor movement
- Chapter 2: Navigation
- Pages 25-33: Manipulating files and directories
- Chapter 6: Redirection
- Pages 68-70: Expansion
- Pages 73-78: Quoting
- Pages 128-134: Environment
- Pages 141-143: Motivation for learning `vi` and some background.

Make sure to try all the commands in the examples, in order to develop some
muscle memory for them. The goal is not to memorize all the commands
immediately, but to get a sense of what is possible when interacting with the
computer via the command line, and to be able to look up stuff later when you
need - that is, to create a mental index for quick information retrieval.

Text editor
-----------

In pages 141-143 of *The Linux Command Line* (see above), you briefly encountered
the Vim text editor. In my personal opinion, if you think you will spend a
substantial amount of time in your career writing documents and/or programs on
a computer, learning a bit of Vim will pay off handsomely. Here are my
recommended steps for doing so.

1. Run `vimtutor` at the command line and go through the tutorial.
2. Read through my [slides on Vim](/assets/vim.pdf) that I presented at the
   IVILab Summer 2020 Bootcamp, and practice the commands in them.

When we are going over your code together (either in person or via Zoom screen
sharing), it is useful for me to be able to reference line numbers. To enable
showing line numbers in Vim, add the following line to your Vim configuration
file (`~/.vimrc`):

```
set number
```

(macOS users only) Package manager
----------------------------------

You will need a package manager to install libraries and programs required for
software development.

The two most popular package managers for macOS are
[MacPorts](https://www.macports.org) and [Homebrew](https://brew.sh).

Having tried both, I vastly prefer MacPorts. Follow the instructions
[here](https://www.macports.org/install.php) to install it.
