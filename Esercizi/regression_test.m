x_original = [0, 1, 2, 2.5];
y_original = [0.7, 3.2, 5.7, 6.95];

% x_distorted = [0, 1, 2, 2.5];
% y_distorted = [0.65, 3.1, 5.96, 7];

x_distorted = [-4, -1, 0, 1, 2, 3, 5];
y_distorted = [0, 0.4, 1, 4, 7, 23, 150];

n = length(x_distorted);
for i = 1:n
    alpha = polynomial_regression(x_distorted', y_distorted', i);
    alpha = flip(alpha);
    
    figure;
    hold on;
    plot(x, y, "o");
    
    x_int = linspace(min(x_distorted), max(x_distorted), 1000);
    y_int = polyval(alpha, x_int);
    plot(x_int, y_int);
    
    waitforbuttonpress
    alpha
end

close all;