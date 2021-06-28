clear
close all;
M = 100000;  % M: data points�� ����
M_PLOT = 200;  % M_PLOT: plotted�� data points�� ����
fs = 10000; % fs: Sampling frequency

mu = 0;  % ��� ��: 0
sigma2 = 1;  % �л� ��: 1
X = gaussian_noise(mu,sigma2,M);
time = [1:M_PLOT]/fs*1000;  % Random Numbers�� ��ǥ�迡 ǥ���� �� �ֵ��� ��������
plot(time, X(1:M_PLOT));
title('AWGN Noise');
xlabel('Time [msec]');
ylabel('x(t)');
pause;

figure;
autocorr(X, fs);  % �־��� Random Numbers�� ���� Autocorrelation�� ������ �� ��ǥ�迡 ǥ����
pause;

figure;
psd_est(X, fs, 256, 'decibel');  % �־��� Random Numbers�� ���� PSD�� ����� �� ��ǥ�迡 ǥ����