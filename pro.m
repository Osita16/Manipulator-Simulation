% Load map from .mat file
load('map1.mat');  % Make sure this contains a variable 'b'

% Convert to binary map if needed
b = imbinarize(b);  % Optional: use only if 'b' is grayscale or not binary

% Create a binary occupancy map
resolution = 1;  % 1 cell = 1 meter
map = binaryOccupancyMap(b, resolution);

% Display the map
figure;
show(map);
title('Original Map');
xlabel('X [m]');
ylabel('Y [m]');

% Create PRM object
prm = mobileRobotPRM;
prm.Map = map;
prm.NumNodes = 200;              % Number of sampled nodes
prm.ConnectionDistance = 15;     % Max distance to connect nodes

% Define start and goal locations (choose free space coordinates)
startLocation = [5, 5];
endLocation   = [size(b,2)-5, size(b,1)-5];  % Near bottom right corner

% Check if start and goal are valid (not in obstacle)
if getOccupancy(map, startLocation) == 1 || getOccupancy(map, endLocation) == 1
    error('Start or Goal is in an obstacle! Choose different coordinates.');
end

% Find a path
path = findpath(prm, startLocation, endLocation);

% Rebuild roadmap if no path is found
maxTries = 5;
tries = 1;
while isempty(path) && tries <= maxTries
    prm.NumNodes = prm.NumNodes + 100;
    prm.ConnectionDistance = prm.ConnectionDistance + 5;
    path = findpath(prm, startLocation, endLocation);
    tries = tries + 1;
end

% Show the roadmap and path
figure;
show(prm);
hold on;
if ~isempty(path)
    plot(path(:,1), path(:,2), 'r-', 'LineWidth', 2);
    title('PRM Roadmap and Path');
else
    title('No path found. Try adjusting start/goal or map.');
end
xlabel('X [m]');
ylabel('Y [m]');
