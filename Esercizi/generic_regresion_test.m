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
y_original = regression_function(x_original);

% Disturb data with normal distributed noise
x_distorted = x_original;
y_distorted = y_original + randn(m, 1) .* noise_amp;

f = cell(2, 1);
f{1} = @(t) t .^ 0;
f{2} = @(t) t .^ 1;

alpha = generic_regression(x_distorted, y_distorted, f);
alpha

n = length(f);
M = zeros(m, n);
for i = 1:n
    M(:, i) = f{i}(x_distorted);
end

figure;
hold on;
plot(x_distorted, y_distorted, "o");

y_int = M * alpha;
plot(x_distorted, y_int);

waitforbuttonpress;
close all;