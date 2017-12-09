---
layout: post
title: "Keeping research notes: my Markdown-LaTeX-Zotero-Pandoc workflow"
date: "2015-11-20"
tags: howto
---

After creating a nice [writing environment](/posts/2015-11-17-my-writing-environment-in-vim.html), my next objective was to be able to take quick research notes, with the following conditions:

  * I should be able to enter mathematical expressions with LaTeX syntax - a must for a theoretical physicist.

  * I wanted to be able to take my notes in Markdown[^1] to eliminate the heavy baggage of LaTeX markup. As in, I would rather type this:

```markdown

Section 1
=========

This is some example text to display the differences between Markdown and LaTeX markup - here is some **bold** text, some *italic* text, and  a citation: [@pyarelal2015].

Here is an ordered list:
    1. Item 1
    2. Item 2
    3. Item 3

Here is an unordered list:
    * Item
    * Another item
    * Yet another item

Here is a table:

| Heading 1 | Heading 2 |
|-----------|-----------|
| Entry 1.1 | Entry 1.2 |
| Entry 2.1 | Entry 2.2 |


```

Than this: 

```tex
\section{Section 1}

This is some example text to display the differences between Markdown and LaTeX markup - here is some \textbf{bold} text, some \emph{italic} text, and  a citation: \cite{pyarelal2015}.

Here is an ordered list:
    \begin{enumerate}
      \item Item 1
      \item Item 2
      \item Item 3
    \end{enumerate}

Here is an unordered list:
  \begin{itemize}
    \item Item
    \item Another item
    \item Yet another item
  \end{itemize}

Here is a table:
\begin{table}[]
\centering
\caption{My caption}
\label{my-label}
\begin{tabular}{|l|l|}
Heading 1 & Heading 2 \\ \hline
Entry 1.1 & Entry 1.2 \\
Entry 2.1 & Entry 2.2 
\end{tabular}
\end{table}
```

* I should be able to export my notes to other formats - .tex source files for easy collaborative editing (and meeting journal formatting specifications), and to PDFs for easier reading.

* I should be able to quickly and easily insert citations (cite as I write) from a reference manager.

So, here is the solution I've come up with and the things you need to do to have a similar setup.

1. Install [Zotero](http://zotero.org) with [Better BibTeX](https://zotplus.github.io/better-bibtex/index.html). Import references from the web as you stumble across them with the Zotero extension for your browser.
2. Set your Better BibTeX preferences to enable automatic export of your citations ![better-bibtex-preferences-screenshot](/images/zotero-better-bibtex-prefpane-screenshot.png)
3. Create a folder in Zotero for your notes, drag and drop the papers you want to cite into the folder, then right click the folder name and click 'Export Collection', making sure the 'Keep updated' box is checked. Then save the `.bib` file in the same folder as you want to write your notes.
4. Set Zotero to export Pandoc citation keys ![pandoc-citekey-screenshot](/images/pandoc-citekey-screenshot.png)
5. For easier citing, change the default citekey format ![easier-citing-screenshot](/images/easier-citing-screenshot.png)
6. Write your notes in markdown format - basically just create a text file with the extension `.md` instead of `.txt`. You can do this from the terminal with `touch notes.md`. (Or just use Vim :))
7. When you want to cite a paper in your notes, type in the citekey like this follows: blah blah [@pyarelal2015]. You can also grab the citekey from Zotero by clicking on the paper name, and pressing `Cmd+Shift+C` (on Mac, shortcut will vary on other systems).
8. Install [Pandoc](http://pandoc.org) - a 'swiss army knife' application that can convert between a number of document formats. If you have a Mac and [Homebrew](http://brew.sh) installed, this is as easy as typing in `brew install pandoc-citeproc` at the terminal prompt.
9. At the top of your `notes.md` file, insert a [YAML](https://www.yaml.org) header that contains information for Pandoc. In the example below:
```yaml
---
title: Research Notes
author: Adarsh Pyarelal
bibliography: Notes.bib
csl: my-csl-template.csl
template: my-latex-template.latex
---
```
'CSL' stands for 'custom style language'. Basically, it sets the citation style for the document. The default citation style follows the Chicago Style Manual, but you can download a custom citation style from [here](https://www.zotero.org/styles) and modify it to your heart's desire. Similarly, you can use a modified copy of the default LaTeX template that Pandoc provides (Located at `/usr/local/Cellar/pandoc/1.15.2.1/share/x86_64-osx-ghc-7.10.2/pandoc-1.15.2.1/data/templates/default.latex`, for example) if you want to use certain packages, styles, etc.
10. In the terminal, change to the directory that contains `notes.md` and `notes.bib`, then type in at the prompt: `pandoc -s --filter pandoc-citeproc --latex-engine=pdflatex notes.md -o notes.pdf` for a PDF file. You can convert to other formats too, with the [appropriate commands](http://pandoc.org/demos.html). 

Here is an example screenshot comparing the markdown and TeX versions of the same document:
![markdown-vs-tex-screenshot](/images/markdown-vs-tex-screenshot.png)

And here is the typeset PDF version:
![notes-blog-pdf](/images/notes-blog-pdf.png)

Enjoy :)

[^1]: A lightweight markup language that was originally created to produce websites without the overhead of HTML and CSS tags, but is now widely adopted in many other contexts, including [academia](https://github.com/scholmd/scholmd/wiki).
