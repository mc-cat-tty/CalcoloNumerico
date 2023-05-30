function [alpha] = polynomial_regression(x, y, f)
    %{
        x input column vector of x coordinates
        y input column vector of y coordinates
        f cell array of functions

        returns the coefficients vector from the lowest to the higher
        degree
    %}

    assert(length(x) == length(y));
    m = length(x);
    n = length(f);

    if (m < n)
        error("Not enough points");
    end

    A = zeros(m, n);
    
    for i = (1:n)
        A(:, i) = f{i}(x);
    end

    if (rank(A) ~= n)
        error("General case, invalid input")
    end

    [Q, R] = qr(A);
    R = R(1:n, 1:n);
    y_bar = Q' * y;
    y_bar = y_bar(1:n);
    alpha = R \ y_bar;
end