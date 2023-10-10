function [x] = my_triu(A, b)
    assert(all(all(tril(A, -1) == 0)));
    
    % Sostituzione all'indietro
    n = length(b);
    x = zeros(n, 1);
    for i = n : -1 : 1
        x(i) = (b(i) - A(i, :) * x) / A(i, i);
    end
end

