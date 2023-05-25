% Straight line
% x_original = [0; 1; 2; 2.5];
% y_original = [0.7; 3.2; 5.7; 6.95];

% x_distorted = [0; 1; 2; 2.5];
% y_distorted = [0.65; 3.1; 5.96; 7];

a = -10;
b = 10;
m = 7;
noise_amp = 1;  % noise amplification

% Exponential
x_original = rand(m, 1) .* (b - a) + a;
y_original = exp(x_original);

% Disturb data with normal distributed noise
x_distorted = x_original;
y_distorted = y_original + randn(m, 1) .* noise_amp;

n = length(x_distorted);
for i = 1:n
    alpha = polynomial_regression(x_distorted, y_distorted, i);
    alpha = flip(alpha);
    
    figure;
    hold on;
    plot(x_distorted, y_distorted, "o");
    
    x_int = linspace(min(x_distorted), max(x_distorted), 1000);
    y_int = polyval(alpha, x_int);
    plot(x_int, y_int);
    
    waitforbuttonpress
    alpha
end

close all;