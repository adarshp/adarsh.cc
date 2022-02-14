---
layout: post
title: "Simple 1D random walk animation in Python"
tags:
    - python
--- 

This is a demo I created as part of teaching Physics 105 (Scientific
Computation) at the University of Arizona in the Spring of 2017.


```python
""" 
A 1D randomwalk program - A. Pyarelal 
Usage:
    python 1d_randomwalk.py -h : Display help and options
    python 1d_randomwalk.py --animate : Run animation and make histogram
    python 1d_randomwalk.py : Make histogram without animation
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import argparse
import time
from tqdm import tqdm

# Set the number of walkers and number of steps
nwalkers = 5
nsteps = 200

"""
The subplots function in the pyplot module returns a figure and a set of axes.
Both the figure and the axes are 'objects' - that is, they are data structures
that have functions associated with them. We will return to this when we 
encounter object-oriented programming.
"""
fig, axes = plt.subplots()

# Set the x and y limits of the plot
axes.set_ylim(-20,20)
axes.set_xlim(0,nsteps)

"""
The line below is an instance of a 'list comprehension', which is a nice
feature in Python. axes.plot(0,0) creates a Line2D object (a collection of 
points joined by a line) with a single point, (0,0). The [0] returns the Line2D
object for us to use. Thus, the variable lines below is a list of Line2D objects.
"""
lines = [axes.plot(0,0)[0] for i in range(nwalkers)]

def update_lines(step_number):
    """ For each Line2D object in lines, add an (x,y) coordinate."""
    for line in lines:
        # append the new x-coordinate (always 1 for the 1D random walk)
        line.set_xdata(np.append(line.get_xdata(),[step_number]))
        y = line.get_ydata()[-1] # Get the last y-coordinate

        if np.random.rand() < 0.5: # Get a random number and test it
            # line.get_ydata()[-1] +=1
            line.set_ydata(np.append(line.get_ydata(),[y+1]))
        else:
            # line.get_ydata()[-1] -=1
            line.set_ydata(np.append(line.get_ydata(),[y-1]))

# Using the argparse module to handle command line options

# Create an instance of the ArgumentParser class
parser = argparse.ArgumentParser()

# Add an argument called 'animation'
parser.add_argument("--animate", help = "Show the 1D randomwalk animation",
                    action = "store_true")

# Call the parse_args() method and store the arguments as an object called args
args = parser.parse_args()

def show_animation():
    """ Function to perform the animation """
    ani = animation.FuncAnimation(fig, update_lines, nsteps,
                                  interval=1,repeat = False)
    plt.show()

def show_histogram():
    """ Function to show the histogram """
    histogram_figure = plt.figure()
    final_y_coordinates = [line.get_ydata()[-1] for line in lines]
    plt.hist(final_y_coordinates)
    plt.show()

if __name__ == '__main__':
    if args.animate:
        ani = animation.FuncAnimation(fig, update_lines, nsteps,
                interval=1,repeat = False)
        ani.save('1D_randomwalk.mp4', writer='ffmpeg', dpi = 150, fps = 2)
    else:
        for i in range(nsteps): update_lines(i)
```

You can check out an animation of the random walk below: 

<video width="600" height="400" controls>
  <source src="/assets/1D_randomwalk.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
