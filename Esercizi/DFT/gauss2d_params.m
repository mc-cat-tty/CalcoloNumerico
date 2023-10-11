function F = gauss2d_params(x, xdata)  % params are the variables
 F = gauss2d(x(1), x(2), x(3), x(4), x(5), xdata(:, :, 1), xdata(:, :, 2));