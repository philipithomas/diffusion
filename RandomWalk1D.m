%This is a test of a 1D random walk

%% initialize
clear
clf
clc


%% Change these variables
for p = 0:.1:1
%Probability of a forward step
%p = .5;
%Number of steps
steps = 1000;

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
disp('<TRIAL>')
disp('Probability:')
disp(strcat('p = ', num2str(p), ' q = ', num2str(q) ))
disp('Trials:')
disp(num2str(trials))
disp('Steps:')
disp(num2str(steps))
disp('Average of trials:')
disp(num2str(mean(Results)))
disp('Standard Deviation of trials:')
disp(num2str(std(Results)))
disp('</TRIAL>')
disp('')
end
