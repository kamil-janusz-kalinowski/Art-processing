% Parameters
N = 100; % number of points
iterations = 100; % number of iterations
shift_range = 0.01; % shift range for each point (change in coordinates)

% Initialize points
points = rand(N, 2); % random point coordinates in the range [0, 1]
figure
% Plot
scatter(points(:, 1), points(:, 2), 'filled');
title('Point distribution before running the algorithm');
xlabel('X Coordinate');
ylabel('Y Coordinate');


% Main loop
for iter = 1:iterations
    % Evaluate point density
    density = zeros(N, 1);
    for i = 1:N
        distances = sqrt(sum((points - points(i, :)).^2, 2)); % calculate distances to other points
        distances(i) = []; % remove distance to itself
        density(i) = 1/mean(distances); % mean distance to nearest neighbors
    end
    
    % Choose point to shift
    [~, index] = max(density); % choose point with highest density
    
    % Shift point
    points(index, :) = points(index, :) + shift_range * randn(1, 2);
    
    % Display progress
    fprintf('Iteration %d/%d\n', iter, iterations);
end

% Plot
figure
scatter(points(:, 1), points(:, 2), 'filled');
title('Point distribution after running the algorithm');
xlabel('X Coordinate');
ylabel('Y Coordinate');
