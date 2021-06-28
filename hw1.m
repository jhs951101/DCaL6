clear all;
close all;
M = 100000;
num_bin = 40;
X = randn(M,1);
[bin, pos] = hist(X, num_bin);
subplot(211), bar(pos, bin);
v = axis;
hold on;
f = exp(-0.5*pos.^2)/(sqrt(2)*pi);
f1 = f*max(bin)/max(f);

plot(pos,f1);
title('Gaussian Distribution {\it{N}}(0,1)');
axis([-50 50 v(3) v(4)]);
hold off;
strcat('mean : ', num2str( mean(X) ))  % 평균 값 출력
strcat('variance : ', num2str( var(X) ))  % 분산 값 출력
disp('Hit any key to see distribution of N(mean, variance)');
pause

mu = 20; % mean
sigma2 = 30; %variance
X = gaussian_noise(mu,sigma2,M);
[bin, pos] = hist(X, num_bin);
subplot(212), bar(pos, bin);
hold on;
f = exp(-(pos-mu).^2/(2*sigma2))/(sqrt(2*sigma2)*pi);
f1 = f*max(bin)/max(f);
plot(pos,f1);
title(strcat('Gaussian pdf {\it{N}}(', num2str(mu), ', ', num2str(sigma2), ')'));
axis([-50 50 v(3) v(4)]);
hold off;
strcat('mean : ', num2str( mean(X) ))  % 평균 값 출력
strcat('variance : ', num2str( var(X) ))  % 분산 값 출력