function [y] = f_wrong(x)
    % this is a wrong function for bisection because f(a)*f(b) > 0
    y = 2.^x;
end

