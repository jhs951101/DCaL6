clear
close all;
M = 100000;  % M: data points의 갯수
M_PLOT = 200;  % M_PLOT: plotted된 data points의 갯수
fs = 10000; % fs: Sampling frequency

mu = 0;  % 평균 값: 0
sigma2 = 1;  % 분산 값: 1
X = gaussian_noise(mu,sigma2,M);
time = [1:M_PLOT]/fs*1000;  % Random Numbers를 좌표계에 표현할 수 있도록 정리해줌
plot(time, X(1:M_PLOT));
title('AWGN Noise');
xlabel('Time [msec]');
ylabel('x(t)');
pause;

figure;
autocorr(X, fs);  % 주어진 Random Numbers에 대해 Autocorrelation을 진행한 후 좌표계에 표현함
pause;

figure;
psd_est(X, fs, 256, 'decibel');  % 주어진 Random Numbers에 대해 PSD를 계산한 후 좌표계에 표현함