noise_magnitude = 0.5;

samples_n = 300;
x_samples = linspace(1, 100, samples_n);
y_samples = log(x_samples) + rand(1, samples_n) .* noise_magnitude;

figure;

subplot(2, 1, 1);
hold on
plot(x_samples, y_samples, 'b');
plot(x_samples, my_moving_average(y_samples, 5), 'r');

subplot(2, 1, 2);
hold on
plot(x_samples, y_samples, 'b');
plot(x_samples, my_exp_moving_average(y_samples, 0.1), 'r');