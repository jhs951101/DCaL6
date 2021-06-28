clear all;
close all;

N = 100000;
num_bin = 40;

sigma = sqrt(10);
x = sigma * randn(N,1);
y = sigma * randn(N,1);
z = sqrt(x.^2 + y.^2);
[bin, pos] = hist(z, num_bin);

bar(pos, bin);
v = axis;
hold on;

f = Rayleigh_Value(pos, sigma^2);
f1 = f*max(bin)/max(f);

plot(pos,f1);
title('The Rayleigh pdf with sigma^2 = 10');
axis([0 16 v(3) v(4)]);
hold off;