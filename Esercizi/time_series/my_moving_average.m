function [out] = my_moving_average(samples, sample_window_size)
    n = length(samples);
    w = sample_window_size;
    out = samples;
    sma = mean(samples(1:w));
    out(1:w) = samples(1:w);

    for k = w+1:n-3
        sma = sma + (samples(k) - samples(k - w)) / w;
        out(k) = sma;
    end
end