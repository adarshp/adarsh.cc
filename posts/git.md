---
layout: post
title: "Git shallow clone"
---

While `git` does not allow you to clone a specific subdirectory like `svn`
does, you can get kind of close to the desired effect by following this
procedure:


```bash
mkdir <repository>
cd <repository>
git init
git remote add origin <url>
git config core.sparsecheckout true
echo "<subdirectory>/*" >> .git/info/sparse-checkout
git pull --depth=1 origin master
```
[(Source)](https://stackoverflow.com/a/28039894)
