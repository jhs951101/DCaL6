function [Rx, tau] = autocorr(X,fs, LAG);
%----------------------------------------------------------------------
% This routine computes the autocorrelation of a sequence.
% AUTOCORR(X,LAG) displays the autocorrelation of input X for time 
% lags over the interval [-LAG, LAG].  
% Default value of LAG = 20.
% fs: sampling frequency
%----------------------------------------------------------------------

N_lag = 20;  % Default value of lag
x = X(:);
if (nargin == 3)
    N_lag = LAG;
end

N = length(x); % Number of data points
win_size = 2*N_lag; % Window size
K = fix((N)/win_size); % Number of windows

umin  = win_size/2; umax = 3*win_size/2;
t_lag0 = 1:(2*win_size-1);
t_lag = t_lag0 - win_size;
middle = t_lag0( (t_lag0 >= umin) & (t_lag0 <= umax) );
index = 1:win_size;
R_xx  = zeros(2*win_size-1,1);

%----------------------------------------------------------------------
% Compute R_xx 
%----------------------------------------------------------------------
for i=1:K
     temp = xcorr(x(index),'unbiased');
     index = index + (win_size);
     R_xx = R_xx + temp;
end

R_xx = R_xx/K;
power = R_xx(win_size);
sprintf('Power = %0.5g',power)

%------------------------------------------------------------------------
% Display or output computed correlation function 
%------------------------------------------------------------------------
if (nargout == 0)
     time_lag = t_lag / fs * 1000; % Time lag vector in msec
     plot(time_lag(middle), R_xx(middle));
     title('Autocorrelation');
     xlabel('Lag [msec]');
     ylabel('R_x(\tau)');
else
     Rx = R_xx(middle);
     if( nargout == 2), tau = x_lag(middle); end
end
