clear
close all;

M = 100000;  % M: data points�� ����
num_bin = 40;  % num_bin: ������׷��� �׸� �� ���Ǵ� ������� ��
X = randn(M,1);  % X: Random Numbers

[bin, pos] = hist(X, num_bin);  % ������׷����� ǥ������ ���� ���� ������ ����
subplot(211);
bar(pos, bin);  % ������׷��� ������� ���·� ǥ��
v = axis;
hold on;

f = exp(-0.5*pos.^2)/(sqrt(2)*pi);  % f: ����� 0�̰� �л��� 1�� ���� Gaussian pdf
f1 = f*max(bin)/max(f);  % f1: Gaussian pdf�� ����� �����ؼ� ǥ���� ��
plot(pos,f1);
title('Gaussian Distribution {\it{N}}(0,1)');
axis([-50 50 v(3) v(4)]);
hold off;
disp('Hit any key to see distribution of N(mean, variance)');
pause

mu = 20;  % mu: ���(mean) ���� �ǹ�
sigma2 = 30;  % sigma2: �л�(variance) ���� �ǹ� (sigma�� ������ ���� ����)
X = gaussian_noise(mu,sigma2,M);  % Gaussian pdf ����� Random Numbers�� �����ϱ� ���� gaussian_noise() �Լ��� ���� ȣ��

[bin, pos] = hist(X, num_bin);
subplot(212), bar(pos, bin);
hold on;

f = exp(-(pos-mu).^2/(2*sigma2))/(sqrt(2*sigma2)*pi);  % f: ��� ���� �л� ���� �־����� ���� Gaussian pdf
f1 = f*max(bin)/max(f);
plot(pos,f1);
title(strcat('Gaussian pdf {\it{N}}(', num2str(mu), ', ', num2str(sigma2), ')'));
axis([-50 50 v(3) v(4)]);
hold off;