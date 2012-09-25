%% Random Walk in 2 Dimensions with Histogram Output
% Authors: 
% Philip Thomas, github.com/philipithomas
% Mohammad Hashim, github.com/mohashim
%
% Simulates a 2-dimensional random walk with a variable number of steps. 
% Data is displayed as the path of the walk, rather than as the displacement 
% in the other random walk files. There is a fixed equal probability of a 
% step in each direction. This file is best for visualizing a low number 
% (roughly 3) of trials, whereas the histograms are best for understanding 
% the distribution from a large number of trials. 
%
% * Dimensions: 2
% * Step Probability: Fixed
% * Visualization: Path

% Based on code from 
% http://matlabnewbie.blogspot.com/2010/02/2d-random-walk-program.html

% This code is built for one trial to better visualize a path. The original random walk 2d program is written for a data-based analysis of multiple steps and trials; this is built for better visualization of a 2d random walk

% Based on setup from http://en.wikipedia.org/wiki/Random_walk#Variants_of_random_walks
% Emulates coming to a 4-way intersection in a city and having to pick a direction, with all directions being of equal probability


%% initialize
clear
clf
clc
hold on; % Allows multiple plots


%% Change these variables
% Probability: Equal for all 4 directions

%Number of steps
steps = 100000;

%Number of trials
trials=6; 

%% Code - don’t edit below here for trials

% We can improve code speed by initializing the whole matrix rather than growing it with each loop

% Coordinate pairs
%Note that each pair is a final displacement, not the change since the last move
% Rows are equivalent to multiple trials
x=zeros(trials, steps);
y=zeros(trials, steps); 

% initialize an index i for looping through the coordinates
% First coordinate will be 0,0 -> origin

%We initialize this out of the loop to optimize memory use.
J=0;
 % Steps-1 because the loop sets the value of the NEXT (i.e. i+1) coordinate pair, so when you get to the last value, setting the “next” value would be out of the matrix.

% Loop through trails
for t = 1:trials 
for i=1:(steps-1)
	%Generate a random number for each move. 
J=rand; % Value will be from 0 to 1

if J<0.25
	%Move to right, i.e. x+1
x(t,i+1)=x(t,i)+1;
y(t,i+1)=y(t,i);
elseif J<0.5
	%Move to the left, i.e. x-1
x(t,i+1)=x(t,i)-1;
y(t,i+1)=y(t,i);
elseif J<0.75
	%Move up, i.e. y+1
x(t,i+1)=x(t,i);
y(t,i+1)=y(t,i)+1;
else 
	% (if J <=1)
	% move down, i.e. y-1
x(t,i+1)=x(t,i);
y(t,i+1)=y(t,i)-1;
end % End probability loop
end %end all steps

%Hold is already on
% Set random color in RGB format with 3 random numbers
plot(x(t,:),y(t,:),'Color', [rand rand rand]) 


end %end trials
title('Random Walk in 2 Dimensions');
xlabel('X Displacement');
ylabel('Y Displacement');
plot(0,0, 'r*')