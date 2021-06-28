clear all;
close all;

N = 100000;
num_bin = 40;

sigma = sqrt(10);
A = 5 * sqrt(10);
K = 13;  % K factors

x = sigma * randn(N,1) + sqrt(K) * sigma;
y = sigma * randn(N,1) + sqrt(K) * sigma;

z = sqrt(x.^2 + y.^2);
[bin, pos] = hist(z, num_bin);

bar(pos, bin);
v = axis;
hold on;

f = pos / sigma^2 .* exp( -1 * (pos.^2 + A^2) / (2 * sigma^2) ) .* besseli(0, A .* pos / sigma^2);
f1 = f*max(bin)/max(f);

plot(pos,f1);
title('The Ricean pdf with A/sigma = 5');
axis([0 30 v(3) v(4)]);
hold off;