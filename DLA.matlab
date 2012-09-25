

%% Diffusion Limited Aggregation in 2 Dimensions with a Rectangular Creation Radius
% Authors: 
% Philip Thomas, http://philipithomas.com
% Mohammed Hashim
%
% Two-dimensional diffusion limited aggregation simulation. Particles are initialized on an 
% outer rectangular boundary with a corresponding rectangular kill zone. This simulation was 
% a starting point for our DLA simulations, but was found to produce a mass density inconsistent 
% with literature values for 2-dimensional DLA. Due to the rectanular creation radius, the 
% simulation showed a bias away from the creation rectangular's corners. 
% 
% * Dimensions: 2
% * Boundaries: X and Y may be different lengths
% * Creation Zone: Rectangular
% * Stick Probability: Always 1

%%  initialize
clear
clf
clc

%% Set bounds
%xmin always 1
%ymin always 1

%% Variables
%Change these!

%Bounds of the box - a grid, essentially
xmax = 100;
ymax = 100;

% Also set the number of particles we want to enter. 
numparticles = 1000000;

%% Map Creation

map = zeros(xmax,ymax);

% If value zero -> blank
% if value one -> Aggregated (“stuck”) particle

%% Set Seed
% We need a first particle to “stick” the other ones to

% Initialize it in the middle
% -> Set middle of map to “1”

% If xmax or ymax is odd, there will be a half value, so add round function to make sure it’s an integer

map(floor(xmax/2),floor(ymax/2))=1; 

% Now we have a blank map with a seed in the middle

%% Particle Loop

% We’ll just initialize these variables outside the loop
x=0; % int
y=0; % int
stuck=0; % boolean
particle=0; % int
escape=0; % boolean
die=0; % boolean
walk=0; % Double - be a random number

% Now we start randomly entering particles from the edge of the map, and move them around until they are next to a current “stuck” particle, at which point we “stick” them to the map. The escape parameter is a true/false variable that allows us to exit the simulation early incase parameters are exceeded. Specifically, if the next “stuck” particle could be off the map, we end the simulation to avoid errors. 

while (( particle <numparticles) + (escape~=0))~=0 
	particle=particle+1; %increase the particle count.
	% note that we initialize before running the rest because the starting
	% value of particle is 0, and it becomes 1 at the beginning of the loop.


% First initialize particle on an edge 
pickSide=rand; %get a number

% We initialize all the x coordinates so that they do NOT start on an “edge” row
if pickSide < .25
    % start on top
    x = 2;
    y=2;
   % y=1+floor(rand*(ymax-2));
elseif pickSide < .5
    % start on right
    x=2;
    y = ymax-1;
	%x=1+floor(rand*(xmax-2));

elseif pickSide <.75
% start on bottom
x= xmax-1;
y=2;
%y=1+floor(rand *(ymax-2));

else
% start on the left 
	y=ymax-1;
    x=xmax-1;
%	x=1+floor(rand*(xmax-2));
end



% Now we have a starting coordinate on the edge of the map


% Set “stuck” equal to false so we can loop (initiated outside, but
% overwrite any previous runs)

% This works by essentially stating that this is held to be untrue until 
stuck = 0; % note that this is boolean 


% Now, until the particle is next to another particle, we keep moving it around in a random walk

die = 0;
	% We kill the particle, or set “die” == true if the particle reaches the edge row. 
	% We have the option of “bouncing” the particle off the edge, but it is easier
	% to just kill the particle and move onto another one.
	% Note then with the particle count -> this does not necessarily equal the number of
	% particles that are successfully stuck, because some of them could be kicked out 
	% of the simulation

while (stuck == 0)&&(die == 0)

% Random walk -> Move it
walk=rand;
if walk<.25 
	%up
	y=y-1;
elseif walk<.5
	% right
	x=x+1;
elseif walk<.75
	%down
	y=y+1;
else
	% left
	x=x-1;
end
		% The particle is now walked. 

	

% Check bounds (is it less than 1 or larger than x/y max?)
% if out of bounds - DIE

if ((x==1) + (y==1) + (x==xmax) + (y==ymax))~=0 
	% The particle is out of bounds. 
	% KILL IT!!!!
die=1;
else
	% If we don’t kill it, we check for whether to stick it 
% Check adjacent squares
stuck=0;
		if (map(x+1,y) + map(x-1,y) + map(x,y-1) + map(x,y+1))~=0 
			% Then there is an adjacent particle, so we
			% need to stick it
			stuck=1;
		end % end adjacent check
		
		% If there isn’t an adjacent particle ->
		% Keep random walking and move it

end % end bound check (note that the “else” is where we stick the particle to themap)
	
	

% This concludes this “turn” of this particle

end %end the stuck criteria

%So now the particle is next to a current particle, so mark it on the map
if stuck 
    
    map(x,y)=1; % By setting it to “1”, we now have a stuck particle there!

% Now we see if we need to abort the program because the particles are 
% sticking too close to the edge. 

% If the particle sticks within 2 units of the edge of the board, we end the simulation
% so that particles don’t start overlapping and stuff. 
% note that, at this point, the variables x and y represent a stuck particle already
if (x==2 + x==(xmax-1) + y==(ymax-1) + y==2)~=0 
	escape = 1;
	% Set the escape parameter equal to true to stop the loop
end % end escape check


end % end stuck check
	% Now it moves onto the next particle entering the map if there are more particles to go

end % end looping of particles

%Tell why escaped, if true
if (escape==1) 
	%print that it was escaped
	Disp ('The simulation ended before all particle could be tried because boundaries were exceeded');

end

imshow(map)
%% Plot
%bar3(map, 'b')
% We’ll save this for later, but it should be a simple x,y plot - if the value is zero on the map at x,y, then there is no particle ->keep it blank
% During testing, we can do small matrices and just show them by typing in ‘map’;

% if x,y is 1 -> there is a stuck particle -> mark it with a dot. 

