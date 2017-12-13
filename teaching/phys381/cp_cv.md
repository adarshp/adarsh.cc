---
layout: subpage
title: Ruchardt's method
---

Hints for deriving the gas flushing equation
============================================

The gas flushing equation (equation number 2 on your handout) is as follows:

$$F=\frac{\text{Volume of gas}}{\text{Volume of Jar}}=\frac{V_{gas}}{V_{jar}}$$

where the gas can be CO$_{2}$, Argon, etc. We can then write a small change in $F$ as follows.

\begin{align}F+dF = \frac{1}{V_{jar}}\left[V_{gas}+dV_{flush}-FdV_{flush}\right]\end{align}

\noindent where $V_{gas}$ is the original amount of gas in the jar, and $dV_{flush}$ is a small amount of gas pumped in to flush the jar. The third term on the right hand side, $-FdV_{flush}$ is motivated as follows. After $dV_{flush}$ has instantaneously mixed with the whole volume of the mixture, a small amount of the mixture, $dV_{mix}$ will escape. 

$$dV_{mix}=dV_{flush}$$ 

and the amount of gas in the expelled $dV_{mix}$ will be given by 

$$(F+dF)dV_{mix}\approx FdV_{mix}=FdV_{flush}.$$ 

We can write the equation (1) as an ODE and solve it\footnote{Show your work explicitly!} to get the final equation, 

$$F=1-e^{-\frac{V_{flush}}{V_{jar}}}.$$ 

Good luck!

