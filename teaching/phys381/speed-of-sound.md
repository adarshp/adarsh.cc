---
layout: page
title: Speed of Sound
---

Suggested pace of experiment:

* Week 1: Familiarize yourself with the equipment, try to get the waveform from the oscilloscope and its FFT on the program on the computer. Test the different options for filters, sampling rate, and slice length, and note down what they do. Answer the questions from the lab packet in your notebook.
* Week 2: Use the tuning fork in conjunction with the microphone (connect the mic to the same port you connected the oscilloscope to) - note down what you see in the FFT program. Collect data for the speed of sound:
  * Blow gently across the end of a pipe (not *into* it) and collect this data with the program. Then do a slice, and then the FFT. For the rest of this experiment, a slice length of 4096 works best, along with the highest sampling rate, denoted by the radio button next to the number. You should see a series of regularly-spaced peaks in the FFT spectrum. If you plot the peak frequency versus the mode number that the peak corresponds to, you should get the fundamental frequency of the pipe, i.e. the frequency corresponding to when the wavelength is twice the length of the pipe. Once you get this fundamental frequency, plug it into the equation $$v =\lambda f$$ to find the speed of sound.
  * Note that there is an 'end correction' that you must consider. This is because the antinodes at the end of the pipe are formed slightly outside the pipe itself. This end correction should be about 0.6*D* i.e., $$L_{\text{eff}} = L + 0.6D$$
* Between week 2 and 3 - analyze the data (including error analysis) from week 2, see if you can find the speed of sound from your data. How does it compare to the accepted value?
* Week 3: Take more data, think of ways to improve your data collection (how can you improve signal to noise ratio? Try different methods of blowing across the pipe, etc.) And make sure to shut the door when you are taking data to reduce the background noise!
* Error estimation - the error in the frequencies of the different modes can be estimated by taking multiple trials and taking the standard deviation.
