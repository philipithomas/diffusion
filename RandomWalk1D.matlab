%% Random Walk in 1 Dimension
% Authors: 
% Philip Thomas, github.com/philipithomas
% Mohammad Hashim, github.com/mohashim
%
% Simulates a 1-dimensional random walk with a variable number of steps. Data 
% is displayed as a histogram. Probability of a forward (p) vs. backward 
% (q) step may be varied. 

* Dimensions: 2
* Step Probability: Variable
* Visualization: Histogram
%% initialize
clear
clf
clc

disp('<tr><th>p</th><th>q</th><th>Trials</th><th>Steps</th><th>Average of trials</th><th>Standard Dev</th></tr>');

%% Change these variables
for p = 0:.1:1
%Probability of a forward step
%p = .5;
%Number of steps
steps = 100000;

%Number of trials
trials=1000;

%% Dont' change below here for general trials
% Probility of stepping back
q = 1-p;
% Make a large matrix with columns of each trial and rows representing
% steps within a trial
% We get an independent trial for each step with the rand function, which
% gives a value between 0 and 1.
M = rand(steps,trials);

% We then loop through each trial and determine whether it qualifies as a
% 'step forward' (i.e. p ) or a step backward (i.e. q) and then replace the
% random value with the value of the step - either forward, +1, or
% backward, -1
for i=1:steps
    for j=1:trials
        if M(i,j) < p
            % Step forward
            M(i,j)=1;
        else
            % Step backward
            M(i,j)= -1;
        end
    end
end
% Summing across the first dimension, we get the cumulative displacement of
% a single random walk of the number of steps specified:
Results= sum(M,1);

%% Plot results
% Display the results as a histogram:
hist(Results)
title(strcat('Random walk in 1 d with probability p = ', num2str(p), ' with ',num2str(trials),' trials and ',num2str(steps),' steps') );
xlabel('Displacement from origin')
ylabel('Number of trials')

%% Display results
disp('<tr><td>')
disp('')
disp(strcat('', num2str(p), '</td><td>', num2str(q) ))
disp('</td><td>')
disp(num2str(trials))
disp('</td><td>')
disp(num2str(steps))
disp('</td><td>')
disp(num2str(mean(Results)))
disp('</td><td>')
disp(num2str(std(Results)))
disp('</td></tr>')
disp('')
end
