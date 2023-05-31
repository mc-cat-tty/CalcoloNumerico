function [out] = my_exp_moving_average(samples, alpha)
    n = length(samples);
    out = samples;

    for k = 2:n
        out(k) = out(k-1) + alpha * (samples(k) - out(k-1));
    end
end