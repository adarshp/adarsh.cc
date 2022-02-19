---
layout: post
title: "Quickstart: Basics"
date: "2022-02-18"
---

Introduction
------------

This post contains 'quickstart' instructions for learning the basics of the
command line and the Vim text editor for getting started working with me on
research projects. You can skip any material that you are already familiar
with.

Getting comfortable with the command line
-----------------------------------------

Read the following sections of the [PDF
version](https://sourceforge.net/projects/linuxcommand/files/TLCL/19.01/TLCL-19.01.pdf/download)
of [The Linux Command Line](http://linuxcommand.org/index.php):

- Page xvi
- Pages 2-3
- Chapter 2
- Pages 25-33
- Chapter 6
- Pages 68-70
- Pages 73-78
- Pages 128-134
- Pages 141-143

Make sure to try all the commands in the examples, in order to develop some
muscle memory for them. The goal is not to memorize all the commands
immediately, but to get a sense of what is possible when interacting with the
computer via the command line, and to be able to look up stuff later when you
need - that is, to create a mental index for quick information retrieval.

Getting comfortable with Vim
----------------------------

In pages 141-143 of the Linux Command Line (see above), you briefly encountered
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
