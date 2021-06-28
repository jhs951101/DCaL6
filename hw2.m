clear
close all;

M = 100000;  % M: data points의 갯수
num_bin = 40;  % num_bin: 히스토그램을 그릴 때 사용되는 막대기의 수
X = randn(M,1);  % X: Random Numbers

[bin, pos] = hist(X, num_bin);  % 히스토그램으로 표현했을 때에 대한 정보를 받음
subplot(211);
bar(pos, bin);  % 히스토그램을 막대기의 형태로 표현
v = axis;
hold on;

f = exp(-0.5*pos.^2)/(sqrt(2)*pi);  % f: 평균이 0이고 분산이 1일 때의 Gaussian pdf
f1 = f*max(bin)/max(f);  % f1: Gaussian pdf를 제대로 정리해서 표현한 값
plot(pos,f1);
title('Gaussian Distribution {\it{N}}(0,1)');
axis([-50 50 v(3) v(4)]);
hold off;
disp('Hit any key to see distribution of N(mean, variance)');
pause

mu = 20;  % mu: 평균(mean) 값을 의미
sigma2 = 30;  % sigma2: 분산(variance) 값을 의미 (sigma에 제곱을 씌운 형태)
X = gaussian_noise(mu,sigma2,M);  % Gaussian pdf 기반의 Random Numbers를 생성하기 위해 gaussian_noise() 함수를 따로 호출

[bin, pos] = hist(X, num_bin);
subplot(212), bar(pos, bin);
hold on;

f = exp(-(pos-mu).^2/(2*sigma2))/(sqrt(2*sigma2)*pi);  % f: 평균 값과 분산 값이 주어졌을 때의 Gaussian pdf
f1 = f*max(bin)/max(f);
plot(pos,f1);
title(strcat('Gaussian pdf {\it{N}}(', num2str(mu), ', ', num2str(sigma2), ')'));
axis([-50 50 v(3) v(4)]);
hold off;