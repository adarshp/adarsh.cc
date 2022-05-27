---
layout: post
title: "BibTeX Citation Tips"
date: "2022-04-27"
toc: true
---

# Introduction

This post contains miscellaneous tips for handling citations with BibTeX.

# My procedure

While Google Scholar does offer BibTeX entries for anything you can find on it,
they tend to be uneven (and often inferior) in quality to the ones you can find
in more official databases. Here is my own personal procedure for finding
BibTeX citations. The method varies by the field the paper is in:

- **High-energy physics**: Get the entry from https://inspirehep.net
- **Computer science**: Get the entry from [dblp.org][dblp.org]
- **PsyArXiv preprint/OSF preregistrations**: Scroll down to the 'Citation'
  section, and in the box that says 'Enter citation style (e.g., "APA")', enter
  'bibtex'. This will bring up an option called 'BibTeX generic citation
  style'. Click on it to bring up the BibTeX entry for the paper.

For all other papers, I do the following[^caveat]: I go to
[library.arizona.edu](library.arizona.edu), search for the paper, then click
'Export RIS' and select 'UTF-8', then click 'Download'.  I then run the
following command in my terminal: `latest_citation_to_bibtex`, which converts
the `.ris` file to BibTeX and copies it to my clipboard. Then I can simply
paste (Cmd-v) the BibTeX entry into my `.bib` file that I am using for the
document I am currently working on.

This assumes that you have my
`latest_citation_to_bibtex` script below with permissions that allow it to
function as an executable and somewhere in your `PATH`:

```bash
#!/usr/bin/env bash

set -euo pipefail

# Get the latest file from the ~/Downloads directory, and if it is a .ris file,
# convert it to BibTeX format, normalize it with bibtool, copy it to the
# clipboard, and delete the original file. This is useful for when websites
# don't have BibTeX exports.
latest_citation_to_bibtex() {
    local file=$(ls -td ~/Downloads/* | head -n1)
    if [[ $file = *.ris ]]; then
        ris2xml $file | xml2bib | bibtool -f "%1p(author):%4d(year)" | pbcopy
        rm $file
    elif [[ $file = *.bib ]]; then
        cat $file | bibtool -f "%1p(author):%4d(year)" | pbcopy
        rm $file
    fi
}

latest_citation_to_bibtex
```

The `latest_citation_to_bibtex` script assumes the availability of the
following tools on your computer: `ris2xml`, `xml2bib`, `bibtool`. You can
install `ris2xml` and `xml2bib` by running

```
sudo port install bibutils
```

You can install `bibtool` by running

```
sudo port install BibTool
````

[^caveat]: Caveat: This procedure assumes that you have a macOS computer -
[`pbcopy`](https://ss64.com/osx/pbcopy.html) is used to copy things to the
macOS clipboard, and the `port` command is used to manage packages using
[MacPorts](https://www.macports.org).
