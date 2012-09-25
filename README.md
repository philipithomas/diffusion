# Diffusion Experiments
These files were created in Matlab for the Biophysics Laboratory course at Washington University in St. Louis during the Fall 2012 semester.

## Authors

Philip Thomas, github.com/philipthomas

Mohammad Hashim, github.com/mohashim

## Course Information
Source: http://physics.wustl.edu/classinfo/360/Docs/intro.php

Physics 360

Department of Physics, Washington University in St. Louis

## Diffusion Laboratory Description

Source: http://physics.wustl.edu/classinfo/360/Pdf/expDescription.pdf

> Diffusion plays an important role in many processes in biology.  The physical mechanism underlying diffusion is random displacement due to collisions occurring on a molecular scale, also known as Brownian motion or random walk.  In this lab you will explore the mathematics of random walks using simple models and Matlab-based computer simulations.

# Random Walk

# DLA

## Background

## Stick Probability

## Mass Density

## Matlab Method

### Zeros
### "add" Factor
### Visualization

# Underlying Assumptions

## Kill Zone

# Files

## DLA.matlab	

Two-dimensional diffusion limited aggregation simulation. Particles are initialized on an outer rectangular boundary with a corresponding rectangular kill zone. This simulation was a starting point for our DLA simulations, but was found to produce a mass density inconsistent with literature values for 2-dimensional DLA. Due to the rectanular creation radius, the simulation showed a bias away from the creation rectangular's corners. 

* Dimensions: 2
* Boundaries: X and Y may be different lengths
* Creation Zone: Rectangular
* Stick Probability: Always 1

## DLAradial.matlab
Two-dimensional diffusion limited aggregation slimulation. Particles are intialized on a circular boundary with a corresponding circular kill zone. This file iterated on the DLA.matlab file and produced mass densities consistent with literature values for 2-dimensional DLA. 

* Dimensions: 2
* Boundaries: Radial
* Creation Zone: Radial
* Stick Probability: Always 1
* Image Output: DLAr200.jpg


## DLAstickcoef.matlab	
Two-dimensional diffusion limited aggregation simulation with stick probability. Particles are intialized on a circular boundary with a corresponding circular kill zone. This file iterated on the DLAradial.matlab file and produced mass densities consistent with literature values for 2-dimensional DLA. In addition, the stick probability may be modified.

* Dimensions: 2
* Boundaries: Radial
* Creation Zone: Radial
* Stick Probability: Variable
* Data Output: massDimensionStickCoeffData.csv, massDimensionStickCoeff.png
* Image Output: DLAcoef.jpg, DLAcoef1percent.jpg,DLAcoef10percent.jpg


## RandomWalk1D.matlab	
Simulates a 1-dimensional random walk with a variable number of steps. Data is displayed as a histogram. Probability of a forward (p) vs. backward (q) step may be varied. 

* Dimensions: 2
* Step Probability: Variable
* Visualization: 

## RandomWalk2D.matlab	
Simulates a 2-dimensional random walk with a variable number of steps. Data is displayed as a 2-D histogram. There is a fixed equal probability of a step in each direction. 

* Dimensions: 2
* Step Probability: Fixed
* Visualization: Histogram
* Data Output: randomwalk2d.asv

## RandomWalk2D2.matlab
Simulates a 2-dimensional random walk with a variable number of steps. Data is displayed as the path of the walk, rather than as the displacement in the other random walk files. There is a fixed equal probability of a step in each direction. This file is best for visualizing a low number (~3) of trials, whereas the histograms are best for understanding the distribution from a large number of trials. 

* Dimensions: 2
* Step Probability: Fixed
* Visualization: Path

## dlathreed.matlab	
Three-dimensional diffusion limited aggregation simulation with stick probability. Particles are intialized on a spherical boundary with a corresponding spherical kill zone. This file iterated on the DLAstickcoef.matlab file and produced mass densities consistent with literature values for 3-dimensional DLA. In addition, the stick probability may be modified.

* Dimensions: 3
* Boundaries: Radial
* Creation Zone: Radial
* Stick Probability: Variable
* Data Output: Histogram

## hist2d.matlab

2-Dimensional Histogram function created by Sisi Ma (sisima[at]rci.rutgers.edu ). We used this to visualize the data in randomwalk2d.matlab.

