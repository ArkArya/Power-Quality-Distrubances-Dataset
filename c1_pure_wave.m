function [  ] = c1_pure_wave( )

t = 0:0.0001:0.2;
x = @(t) sin(2*pi*50*t); % Generated Signal

subplot(2,1,1);
plot(t, x(t));
title("Sine Wave");

% Sampling
num_repetitions = 200;
fs = 16000 - 1;
ts = 0:1/fs:0.2;
xs_all = zeros(num_repetitions, length(ts));

for i = 1:num_repetitions
    xs = x(ts);
    xs_all(i, :) = xs;
end

% Just for visualization, plotting a single sampled signal
subplot(2,1,2);
stem(ts, xs_all(1, :)); % Plotting the first sampled signal
title("Sampled Signal (One of 200 Repetitions)");