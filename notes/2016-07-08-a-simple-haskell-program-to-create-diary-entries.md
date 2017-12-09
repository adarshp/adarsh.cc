---
layout: post
title: "A simple Haskell program to create diary entries"
date: "2016-07-08"
tags: haskell
---

I've been wanting to explore functional programming for a while, and in particular, Haskell. Also, I've been thinking about the best way to keep a research diary, a sort of 'theorist's lab notebook'. In the past, I had combined my research diary with my research notes (the notes that were to eventually get compiled into papers), but this seemed like too messy of an approach - I realized that I needed to separate the content from the process. I needed to keep track of what approaches had tried and failed - being a particle phenomenologist, I work with large software packages for Monte Carlo simulation of particle collisions and their subsequent analysis, there are frequent issues with program compilation, debugging, etc. Additionally, running programs with different input parameters can produce dramatically different results, and these need to be documented.

In the light of these issues, I decided to write a small Haskell program (with the filename `newentry.hs`) that gets the current date, and creates a new markdown file with the date in the YAML header. Here it is:

```haskell
#!/usr/bin/env runhaskell

import System.IO
import Data.Char
import Data.Time.Clock
import Data.Time.Calendar
import Data.String.Utils
import Formatting

main = do
  (year, month, day) <- getCurrentTime >>= return . toGregorian . utctDay
  let datestring = join "-" [show year, show month, show day]
  let YAMLHeader = unlines [
    "---",
    "date: " ++ datestring,
    "---"
  ]
  writefile (datestring ++ ".md") YAMLHeader
```

You can run it either as a script with `runhaskell newentry.hs`, or compile it with `ghc --make newentry.hs`, and run the compiled version with `./newentry`.

The output file will be named something like `2016-7-8.md`, and will have the following contents:

```markdown
---
date: 2016-7-8
---
```
You can subsequently process this file (along with others) with Pandoc to create a research diary with LaTeX, or whatever other output you prefer.

