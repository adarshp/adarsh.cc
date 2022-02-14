---
layout: post
title: Kill all PBS jobs on the UA cluster
date: "2016-11-01"
---

Just realized that you had a typo in your program but you've already submitted
hundreds of jobs to the University of Arizona cluster? I feel you, man. Try
this:

```
qstat -u $USER | grep $USER | cut -d " " -f1 | xargs qdel
```

Enjoy :)

p.s. if you put this in a script, say `killjobs.sh` - make sure to run it as `source killjobs.sh`.
