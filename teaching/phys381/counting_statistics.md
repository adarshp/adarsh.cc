---
layout: page
title: Counting Statistics
---


## Steps for Geiger-Mueller counter

- Display the raw output from the GM tube on the oscilloscope. Make a
semi-log plot of pulse height vs applied voltage for a range of voltages.
Comment on the shape of the graph.
- Route the output of the GM tube into the amplifier, and display the
amplified signal as well as the GM output on the scope on different
channels. Then route the output of the amplifier into the SCA, and the
output of the SCA into the oscilloscope. The output of the SCA should be a
square pulse ~5V high. It converts the analog signal into a digital one.
Once you see this pulse, route the output of the SCA into the (positive)
input of the Counter. See if you can get it to display the number of
particles detected. Play around with the settings of the electronics and
figure out what the different settings do. Write a one- page "Users manual".
Make sure to note down what settings work best to display the signals on the
oscilloscope!
- Now, turn on the computer, press enter a few times until you see the
`C:\>`
prompt. This is advanced lab, so you will use an advanced operating system
called DOS. Type `dir` and hit enter to list the folders in the C drive.
Navigate to the Counts folder by typing `cd counts` (and pressing enter).
Then type `counts.exe` and hit enter to start up the counting program. Press
A to begin the first program, which counts the number of events in a fixed
time interval. Enter plateau.txt as the file name, set number of repetitions
to 10 Take a range of voltages (about 20 should be fine) from 900 - 1200 and
plot log(counts/min) vs voltage applied. Take at least 10 repetitions per
voltage setting. This should be easy with the program. Insert a floppy disk
into the computer, then enter `copy plateau.txt A:\` at the prompt. Once the
green light on the floppy drive turns off (meaning it has finished copying),
then eject the disk and put it into the USB floppy drive attached to one of
the computers on the central table. On that computer, navigate to the A dive
and copy the text file(s) onto that computer for further analysis.
- Calculate the detector efficiency based on the sample's creation date,
initial activity, and half-life, and the solid angle subtended by the
detector face at the center of the point source.
- Record the number of counts in a fixed time interval (at least 50
repetitions) and create a histogram from it. Does the distribution look
Gaussian? Now take the number of counts for a few different time intervals.
What is the standard deviation of each set? Plot the Log of the standard
deviation on the y-axis and the log of mean of the data set on the x-axis.
what is the slope? Hint: It should be about 0.5 based the statistics of
nuclear counting!
- For the part where you have to investigate the distribution of the time
between each count, time between every two counts, etc., I've written up
some Python code to help you create the required histograms. Don't just copy
it though, make sure to understand every line of the code thoroughly.

``` python
# Import the python data analysis module
import pandas as pd

# Read your data into a DataFrame construct, and assign names to
# the columns. The column t1 is the times between each count, and 
# t2 is just the same as t1, but shifted one row upwards

df = pd.read_csv('path_to_your_data.txt', delim_whitespace = True,
                  names = ['Index', 't1', 't2', index_col = 'index']

# Print the first five rows of the dataframe so we know what our
# data looks like!

print(df[0:5])

# Create a new column, 't3', which is simply the sum of t1 and t2 - 
# That is, t3 contains the times between every two counts.

df['t3'] = df['t1']+df['t2']
df.hist(column = 't1', bins = 100)
```
Your resulting histogram should look something like this:

![](/images/counting_stats_histo1.png)

However, don't stop here! You should make the histogram of the
distribution between every count as well, and compare it to the 
theoretical distribution that you would expect from your knowledge
of counting statistics. Plot the theoretical function and estimate
how good the experimental data matches the theory. If you see some 
discrepancies, try to reason about why they might arise.

Things I am looking for in particular - an intelligent discussion of why we see the distributions of 'time between counts' and 'time between every 2 counts' look the way they do.
