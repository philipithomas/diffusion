%% Diffusion Limited Aggregation in 2 Dimensions with a Radial Creation Radius and Variable Stick Probability
% Authors: 
% Philip Thomas, github.com/philipithomas
% Mohammad Hashim, github.com/mohashim
%
% Two-dimensional diffusion limited aggregation simulation with stick probability. Particles
% are intialized on a circular boundary with a corresponding circular kill zone. This file 
% improved on the DLAradial.matlab file and produced mass densities consistent with literature 
% values for 2-dimensional DLA. In addition, the stick probability may be modified.
% 
% * Dimensions: 2
% * Boundaries: Radial
% * Creation Zone: Radial
% * Stick Probability: Variable
% * Data Output: massDimensionStickCoeffData.csv, massDimensionStickCoeff.png
% * Image Output: DLAcoef.jpg, DLAcoef1percent.jpg,DLAcoef10percent.jpg

%%  initialize
clear
clf
clc

%% Set bounds

% creation distance from origin
radiusCreation= 100;

% fraction greater than creation radius for kill zone
frac=.5;


% Also set the number of particles we want to enter. 
numparticles = 100000;

% Set probability of sticking
stickProbability = .01;

%% Map Creation
radiusKill=radiusCreation*(frac+1);

add=radiusKill+2;

map = zeros((radiusKill*2+3));

% If value zero -> blank
% if value one -> Aggregated (“stuck”) particle

%% Set Seed
% We need a first particle to “stick” the other ones to

% Initialize it in the middle
% -> Set middle of map to “1”

map(add,add)=1; 

% Now we have a blank map with a seed in the middle

%% Particle Loop

% We'll just initialize these variables outside the loop
X=0; % int
x=0;
y=0;
Y=0; % int
stuck=0; % boolean
particle=0; % int
escape=0; % boolean
die=0; % boolean
walk=0; % Double - be a random number

% Now we start randomly entering particles from the edge of the map, and move them around until they are next to a current “stuck” particle, at which point we “stick” them to the map. The escape parameter is a true/false variable that allows us to exit the simulation early incase parameters are exceeded. Specifically, if the next “stuck” particle could be off the map, we end the simulation to avoid errors. 

while (( particle >= numparticles) + (escape))==0 
	particle=particle+1; %increase the particle count.
    %disp('new particle');
	% Print some progress markers

	% note that we initialize before running the rest because the starting
	% value of particle is 0, and it becomes 1 at the beginning of the loop.


% First initialize a random angle
phi=rand*2*3.14159265359; %radians

% We initialize coordinates with radius =radiusCreation based on phi

X=radiusCreation*cos(phi);
Y=radiusCreation*sin(phi);

x=round(X);
y=round(Y);
%disp(strcat('particle initialized at (',num2str(x),',',num2str(y),')',' with radius ',num2str(hypot(x,y))))
% Now we have a starting coordinate on the perimeter of the map


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

while ((stuck+die+escape) == 0)

% Random walk -> Move it
walk=rand;
%disp('.');
if walk<.25 
	%up
	if map(add+x,add+y+1)==0 
	y=y+1;
	end
elseif walk<.5
	% right
if map(add+x+1,add+y)==0 
	x=x+1;
	end
	
elseif walk<.75
	%down
if map(add+x,add+y-1)==0 
	y=y-1;
	end

else
	% left
if map(add+x-1,add+y)==0 
	x=x-1;
	end

end
		% The particle is now walked. 

	

% Check bounds (is it less than 1 or larger than x/y max?)
% if out of bounds - DIE

if (hypot(x,y)>=radiusKill) 
	% The particle is out of bounds. 
	% KILL IT!!!!
die=1;
%disp('splat');
else
	% If we don't kill it, we check for whether to stick it 
% Check adjacent squares
stuck=0;
		if (map(add+x+1,add+y) + map(add+x-1,add+y) + map(add+x,add+y-1) + map(add+x,add+y+1))~=0 
			% Then there is an adjacent particle, so we
			% need to stick it
			if (rand<stickProbability) 
				stuck=1;
			end
            %disp('stuck')
		end % end adjacent check
		
		% If there isn't an adjacent particle ->
		% Keep random walking and move it

end % end bound check (note that the “else” is where we stick the particle to themap)
	
	

% This concludes this “turn” of this particle

end %end the stuck criteria

%So now the particle is next to a current particle, so mark it on the map
if stuck 
    
    map(add+x,add+y)=1; % By setting it to “1”, we now have a stuck particle there!
    stuck=0;
    clf
    imshow(imresize(map,1));
    pause(.001);
    
% Now we see if we need to abort the program because the particles are 
% sticking too close to the edge. 

% If the particle sticks within 2 units of the edge of the board, we end the simulation
% so that particles don't start overlapping and stuff. 
% note that, at this point, the variables x and y represent a stuck particle already
if ((hypot(x,y)*1.2)>=radiusCreation)
	escape = 1;
	% Set the escape parameter equal to true to stop the loop
end % end escape check


end % end stuck check
	% Now it moves onto the next particle entering the map if there are more particles to go

end% end looping of particles

%Tell why escaped, if true
if (escape==1) 
	%print that it was escaped
	disp('The simulation ended before all particle could be tried because boundaries were exceeded');

end
%% radiusCreation
n=sum(sum(map)) % give the number of particles

%Now we find the radius

r=0; % initialize
i=0;
j=0;
for i=1:(radiusKill*2+3)
    for j=1:(radiusKill*2+3)
        if map(i,j)==1
            % if particle is there
            if (hypot(i-add,j-add)>r)
                r=hypot(i-add,j-add);
            end
        end
    end
end

r

d=log(n)/log(r)

