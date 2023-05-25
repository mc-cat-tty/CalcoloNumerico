function [alpha] = polynomial_regression(x, y, n)
    %{
        x input column vector of x coordinates
        y input column vector of y coordinates
        n polynomial degree

        returns the coefficients vector from the lowest to the higher
        degree
    %}

    assert(length(x) == length(y));
    m = length(x);

    if (m < n)
        error("Not enough points");
    end

    A = ones(m, n);
    
    for i = (2:n)
        A(:, i) = A(:, i-1) .* x;
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