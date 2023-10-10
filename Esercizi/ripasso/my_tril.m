function [x] = my_tril(A, b)
    assert(all(all(triu(A, 1) == 0)));

    % Sostituzione in avanti
    n = length(b);
    x = zeros(n, 1);
    for i = 1 : n
        x(i) = (b(i) - A(i, :) * x) / A(i, i);
    end
end

