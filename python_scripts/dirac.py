import matplotlib as mpl

params = {
    "font.family": "serif", # use serif/main font for text elements
    "text.usetex": True,    # use inline math for ticks
    "font.serif": 'Palatino',
    "figure.figsize": [5.5,4],
}
mpl.rcParams.update(params)

import numpy as np

from matplotlib import pyplot as plt

# Define a function to calculate E(Z) given j and n

def E(Z,j,n):
    
    # Defining some constants 
    
    c = 3*(10**8) # Speed of light
    m = 9.1*(10**(-31)) # Mass of the electron
    alpha = 137**-1 # Fine structure constant 
    
    # Defining our binding energy function, E(Z) derived from the Dirac equation.
    
    denom = n - (j + .5) + np.sqrt((j + 0.5)**2 - (alpha*Z)**2)
    frac = alpha*Z/denom
    return m*(c**2)*((1+frac**2)**(-0.5) - 1)  

# Now defining a function to plot E(Z)

def binding_energy_plot(j,n):
    
    # Create an even spaced array of numbers in the range 0 - 137, in steps of 0.1.
    Z = np.arange(0.0, 137.0, 0.1)  
    
    # Setting a nice plot style
    plt.style.use('ggplot')
    
    # Plot the function
    plt.plot(Z, E(Z,j,n))
    
    # Label the x and y axies
    plt.xlabel("Z")
    plt.ylabel("Binding Energy (Joules)")
    
binding_energy_plot(0.5,1)     
plt.tight_layout()
plt.savefig('dirac.png')
