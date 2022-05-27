---
layout: post
title: "Quickstart: Odin"
date: "2022-02-21"
toc: true
---

# Introduction

This post contains 'quickstart' instructions for getting familiar with the Odin
system for extracting information from natural language. We use Odin in a
number of projects in the [ML4AI Lab](https://ml4ai.github.io).

**Prerequisite**: Complete the steps in [Quickstart: Basics](/posts/quickstart-basics.html).


# Reading

Read the [Odin manual](https://arxiv.org/pdf/1509.07513.pdf) to get an overview
of the Odin framework.

# Tutorial

Try out the [interactive Odin tutorial](https://github.com/clu-ling/odin-tutorial).

The quickest way to launch the tutorial is via Docker. If you have not already
installed Docker on your computer, do so.  Instructions are available
[here](https://docs.docker.com/get-docker/).

You can then run the following commands to clone the repository and launch the
tutorial:

```bash
git clone git@github.com:clu-ling/odin-tutorial
cd odin-tutorial
docker-compose up
```

Then, navigate to `localhost:8880` in your web browser to access the tutorial.
