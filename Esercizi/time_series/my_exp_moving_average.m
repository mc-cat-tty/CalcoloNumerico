function [out] = my_exp_moving_average(samples, alpha)
    n = length(samples);
    out = samples;

    for k = 2:n
        out(k) = alpha *  samples(k) + (1-alpha) * out(k-1);
    end
end