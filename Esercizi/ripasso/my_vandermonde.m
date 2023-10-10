function [alpha] = my_vandermonde(x, y)
    % suggestion: try with vandermonde(rand(10, 1), rand(10, 1))
    [rx, cx] = size(x);
    [ry, cy] = size(y);
    assert(cx == 1);
    assert(cy == 1);
    assert(rx == ry);

    n = length(x);
    V = ones(n);
    for j=2:n
        V(:, j) = V(:, j-1) .* x;
    end

    alpha = V \ y;
    % Dal grado più basso a quello più alto
end