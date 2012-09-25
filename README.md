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
Two-dimensional diffusion limited aggregation simulation. Particles are intialized on a circular boundary with a corresponding circular kill zone. This file improved on the DLA.matlab file and produced mass densities consistent with literature values for 2-dimensional DLA

* Dimensions: 2
* Boundaries: Radial
* Creation Zone: Radial
* Stick Probability: Always 1
* Image Output: DLAr200.jpg


## DLAstickcoef.matlab	
## RandomWalk1D.matlab	
## RandomWalk2D.matlab	
## RandomWalk2D2.matlab
## dlathreed.matlab	
## hist2d.matlab
## massDimensionStickCoeff.png	
## massDimensionStickCoeffData.csv
