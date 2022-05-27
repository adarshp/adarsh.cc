---
layout: post
title: "Quickstart: ToMCAT Rule-based Information Extraction System"
date: "2022-02-21"
toc: true
---

# Introduction

This post contains 'quickstart' instructions for getting familiar with the
[ToMCAT](https://ml4ai.github.io/tomcat) rule-based system for extracting
entities and events from natural language dialogue.

**Prerequisite**: Complete the steps in [Quickstart: Odin](/posts/quickstart-odin.html).

# Prerequisite software

Install OpenJDK 8 and SBT. If you are using MacPorts, you can do this by running the
following command:

```bash
sudo port install openjdk8 sbt
```

# Run test suite

Next, run the following commands in your terminal to clone the repository and
run the test suite.

```bash
git clone git@github.com:clulab/tomcat-text
cd tomcat-text
sbt test
```

# Reading

Next, read [this markdown
file](https://github.com/clulab/tomcat-text/blob/master/docs/Doc_for_ASIST_Odin.md)
that describes salient files in the codebase, and their purposes.

Let me know if you run into any issues.
