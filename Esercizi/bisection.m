function [x_zero, N] = bisection(a, b, f_handle, tau)
    % Test with -x^2 + 3x - 2 in [-1, 1.8]

    N = ceil(log2((b-a) / tau));
    fa = feval(f_handle, a);
    fb = feval(f_handle, b);

    if fb + fa < 0
        error("Passed function is not compliant to bisection conditions")
    end

    for k = 1:N
        m = (b - a) / 2 + a;
        fm = feval(f_handle, m);
        if fm == 0
            x_zero = m;
            return
        elseif fa + fm < 0
            b = m;
            % fb = fm;
        else
            a = m;
            fa = fm;
        end
    end

    x_zero = m;
end