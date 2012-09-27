# Diffusion Experiments
These files were created in Matlab for the Biophysics Laboratory course at Washington University in St. Louis during the Fall 2012 semester.

## Authors

Philip Thomas, github.com/philipthomas, philipithomas.com

Mohammad Hashim, github.com/mohashim

## Course Information
Source: http://physics.wustl.edu/classinfo/360/Docs/intro.php

Physics 360

Department of Physics, Washington University in St. Louis

## Diffusion Laboratory Description

> Diffusion plays an important role in many processes in biology.  The physical mechanism underlying diffusion is random displacement due to collisions occurring on a molecular scale, also known as Brownian motion or random walk.  In this lab you will explore the mathematics of random walks using simple models and Matlab-based computer simulations.

**Source:** http://physics.wustl.edu/classinfo/360/Pdf/expDescription.pdf


# Random Walk

The experiment began with quantitation of a standard random walk. One and two-dimensional simulations were coded, and data was visualized as a histogram and, in the case of the 2-dimensional simulation, additionally as a path graph.

# DLA

## Background
> Diffusion-limited aggregation (DLA) is the process whereby particles undergoing a random walk due to Brownian motion cluster together to form aggregates of such particles. This theory, proposed by Witten and Sander in 1981,[1] is applicable to aggregation in any system where diffusion is the primary means of transport in the system. DLA can be observed in many systems such as electrodeposition, Hele-Shaw flow, mineral deposits, and dielectric breakdown.
> The clusters formed in DLA processes are referred to as Brownian trees. These clusters are an example of a fractal. In 2-D these fractals exhibit a dimension of approximately 1.71 for free particles that are unrestricted by a lattice, however computer simulation of DLA on a lattice will change the fractal dimension slightly for a DLA in the same embedding dimension. Some variations are also observed depending on the geometry of the growth, whether it be from a single point radially outward or from a plane or line for example. Two examples of aggregates generated using a microcomputer by allowing random walkers to adhere to an aggregate (originally (i) a straight line consisting 1300 particles and (ii) one particle at center) are shown on the right.

**Source:** http://en.wikipedia.org/wiki/Diffusion-limited_aggregation

## Stick Probability
In a basic DLA simulation, when a 'floating' particle becomes adjacent to a 'stuck' particle, the floating particle ceases its random walk and becomes stuck. This creates the classic Brownian tree clusters. However, we wrote simulations that allowed for a variable probability that a floating particle would stick should it become adjacent to a 'stuck' particle. We refer to this as the **stick probability**.

## Mass Density

We use the mass density to compare the accuracy and precision of our DLA results with literature values. The mass density is a measure of how many particles aggregate in a given area relative to the seed particle. The equation n=r^d is used for two and three-dimensional quantitation of mass density. n is the number of particles within r units of the seed particle, and with d as the mass density. Thus, the mass density can be solved as d=log(n)/log(r). 

## Matlab Method

### Zeros
Our DLA experiments were created as matrices. Values of zero in the matrix signified that no particle was stuck, while a value of 1 singified that a particle was stuck. Our simulations begin with creating a *map* in the form of a zeros matrix, then initializing a seed by changing one of the matrix values to 1. 

### "add" Factor
Matlab does not allow for negative indeces in matrices. Some of our files contain a constant called **add** - this factor is used for *translating the quadrants of a cartesian plane to a matrix with no negative indeces*. In larger simulations, we chose to simplify calculations by having the seed particle be at the origin, then having the creation and kill radii be radial with respect to the origin. However, to quantitate the sticking of a particle outside the first quadrant, we use the add factor to shift the whole plane into the first quadrant, thus allowing it to be saved in a matrix. 

**Example: In a 2-D simulation with boundaries 4 units from the origin, we initialize a matrix of 9 units by 9 units to represent the integral points in the plane. To input the point (0,0) in the matrix, we use an "add" factor of (1 + radius) = 5, therefore the cartesian point (0,0) becomes the indeces [0+add,0+add]=[5,5] in the matrix. Similarly, for the point (-4,-4) become [1,1] in the matrix.**

### Visualization

We found the matlab function *imshow* to be the best way of visualizing a matrix in two dimensions in matlab, per our above procedure (see DLAr200.jpg). We have neither found nor yet created a function for the display of a matrix map of a 3-D DLA, so dlathreed.matlab does not have a way of displaying its 
# Underlying Assumptions

## Kill Zone Method

When considering particles undergoing a random walk, it is important to determine what happens when a particle reaches a boundary. 

Choices include:
 * "Bouncing" the particle back onto the simulation, effectively reversing its velocity
 * Killing the particle and moving onto another one
 * Having the particle re-enter the simulation from the other side
 
For our DLA simulations, we chose to have kill boundaries on all of our planes, so that a particle that moves out of dimensions is immediately terminated and another particle is created on the creation radius.
s
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

