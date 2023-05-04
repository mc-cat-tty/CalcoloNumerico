function [alpha] = vandermonde(x, y)
    % suggestion: try with vandermonde(randi(100, 5, 1), randi(100, 5, 1))
    [rx, cx] = size(x);
    [ry, cy] = size(y);
    assert(cx == 1);
    assert(cy == 1);
    assert(rx == ry);

    n = length(x);
    V = zeros(n);
    V(:, 1) = ones(n, 1);
    for j=2:n
        V(:, j) = V(:, j-1) .* x;
    end

    alpha = V \ y;

    % plotting
    x_min = min(x) - min(x) / 4;
    x_max = max(x) + max(x) / 4;
    x_samples = linspace(x_min, x_max);
    y_samples = polyval(flip(alpha), x_samples);

    figure();
    hold on;
    plot(x, y, 'o');
    plot(x_samples, y_samples);
end