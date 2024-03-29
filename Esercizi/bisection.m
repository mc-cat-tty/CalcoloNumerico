function [x_zero, N] = bisection(a, b, f_handle, tau)
    % Test with -x^2 + 3x - 2 in [-1, 1.8]

    N = ceil(log2((b-a) / tau));
    fa = feval(f_handle, a);
    fb = feval(f_handle, b);

    figure(1);
    hold on;
    x_vector = linspace(a, b, 1000);
    asse_x_imgs = zeros(1000);
    plot(x_vector, asse_x_imgs, '_');
    plot(x_vector, f_handle(x_vector), ':');
    plot([0, 1, 2], [0, -1, 0.5], 'x');  % x line per (0, 0), (1, -1), (2, 0.5
    % close(1);

    if fb + fa >= 0
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