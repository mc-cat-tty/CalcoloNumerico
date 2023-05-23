% Sampling Runge function and reconstructing it with a cubic spline

clear;
a = -1;
b = 1;
x_runge = linspace(a, b, 1000);
y_runge = 1 ./ (1 + 25 .* x_runge .^ 2);

x_int = linspace(a, b, 10);
y_int = 1 ./ (1 + 25 .* x_int .^ 2);
y_out = spline(x_int, y_int, x_runge);

figure;
hold on;
plot(x_runge, y_runge, "b");
plot(x_runge, y_out, "g");