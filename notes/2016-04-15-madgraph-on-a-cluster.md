---
layout: post
title: "MadGraph on a PBS cluster"
date: "2016-04-15"
tags: howto
---

It took me a while to get MadGraph up and running on the University of Arizona's high performance/high throughput cluster. There is some pretty helpful documentation at the [official site][], but of course, it cannot cover how to handle all the different clusters. Plus the GridPack method is designed for sending jobs to clusters where there can be a chance of failure (such as if we send to the `htc_windfall` queue on the UA cluster). The scheduler we use for our cluster is PBS, and here's how to set it up for event generation.

First, login to the HPC login node:

```bash
login your-username@hpc.arizona.edu
```

(I recommend setting up ssh access, otherwise you will have to enter a passcode every single time you log in)

Create a PBS submission script file with the extension `.pbs`, for example, `submit.pbs`. Put the following lines into that file.

```bash
#!/bin/bash
#PBS -N tt_fully_leptonic
#PBS -M adarsh@email.arizona.edu
#PBS -W group_list=shufang
#PBS -q standard
#PBS -l select=1:ncpus=5:mem=23gb:localscratch=1
#PBS -l cput=17:0:0
#PBS -l walltime=7:0:0

cd /xdisk/adarsh/Dark_Matter/Events/Backgrounds/tt_fully_leptonic
module load python
date
./generation_script.py 70
date
echo "DONE"
exit 0
```

In the above lines, substitute your own process name, your own email, and your group name for the first three PBS directives. The first line of the script after the PBS allocation directives is a command to change the directory to the one in which my MadGraph process folder is. The process I generated was $$t\overline{t}$$ with a fully leptonic decay chain, and I generated it with the following input to MadGraph:

```
generate p p > t t~, (t > w+ b, w+ > l+ vl), (t~ > w- b~, w- > l- vl~)
output tt_fully_leptonic
```

I placed this directory in my xdisk allocation. You can set up an xdisk allocation as described [here][].

Let's now unpack the line 

`#PBS select=1:ncpus=5:mem=23gb:localscratch=1`. 

This requests one node, with five cores and 23 GB of RAM on the node. Now, why not all twelve cores on the node? I'm not sure, but it just doesn't seem to work, I think it is a memory management issue in Python, where it requests memory than is available when we select too many cores. five cores seems to be the maximum we can select.  

I've opted for doing a large number of calls of `./bin/generate_events` instead of `./bin/multi_run` since it is easier to remove the intermediate Pythia and Delphes files that are produced (I'm only interested in the LHCO files, which are considerably smaller in size and provide sufficient information for my analyses. Of course, you can keep the Delphes ROOT files if you prefer to work with them)

The script `generation_script.py` takes one argument, the number of runs you would like to perform. Within a directory, Madevent automatically updates the random seed for Monte Carlo generation, so you don't have to worry about that aspect.

The file `generation_script.py` is reproduced below:

```python
#!/usr/bin/env python

import sys, subprocess

# Get the number of runs from the command-line argument
number_of_runs = int(sys.argv[1])

for i in range(0, number_of_runs):
  # Remove previous instance of RunWeb
  subprocess.call(['rm', 'RunWeb'])

  # Generate events and run them through Pythia and Delphes
  subprocess.call(['./bin/generate_events', '-f', '--laststep=delphes'])
  print 'INFO: Events generated.'

  # Remove parton-level files
  subprocess.call(['./bin/madevent', 'remove', 'all', 'parton', '-f'])

  # Remove Pythia-level files
  subprocess.call(['./bin/madevent', 'remove', 'all', 'pythia', '-f'])
  print 'INFO: Pythia-level files removed'

  # Remove Delphes ROOT files
  subprocess.call('find . -name "*.root" -type f | xargs rm -f', shell = True)
  print 'INFO: Delphes ROOT files removed, only LHCO files remain.'

  print 'Done.'
```

I also did `chmod +x generation_script.py` to make it executable.

Once the steps above have been set up, you can just do `qsub submit.pbs`, sit back and let the event generation run on the cluster!

The reason I did not go with the gridpack method is because there is a pretty high rate of success for the jobs on the UA cluster's `standard` queue, and running the Pythia-Delphes chain is much easier this way (we don't have to manually merge the LHE files, etc.)

Generating events with five cores doesn't seem like much, until you realize that you can scale this up to speed up event generation by making multiple directories such as `tt_fully_leptonic_1`, `tt_fully_leptonic_2`, etc. and generating events in those directories separately on multiple nodes on the cluster (unless you create many thousands of directories - which is not usually necessary, between 1-10 will probably suffice for most cases - you don't have to worry about the Madevent random seeds coinciding (you should delete them before the first time you generate events - they will be in SubProcesses/randinit)- the random seed is an integer chosen between 1 and 30107.). This will make event generation *way* faster than on your own multi-core computer.

[official site]: https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/IntroGrid

[here]: http://rc.arizona.edu/hpc-htc/using-systems/xdisk-examples

[^1]: 
