function [Sx] = psd_est(x,fs,M,y_scale)
%----------------------------------------------------------------------
% This routine computes PSD estimate of x using the Welch method.
% Input x of N points is divided into K sections of N_FFT points each.  
% Each section is windowed and FFT computed, then accumulated.  
% Estimated power spectrum is plotted over the frequency range [0,fs/2],  
%    where fs is the sampling frequency.  
% Input Parameters
%    fs = sampling frequency
%    M = FFT data points
%    y_scale = 'linear' or 'semilog'
%----------------------------------------------------------------------

x = x(:);         
N = length(x);    
freq_range = [0  fs/2];  % Frequency range for plotting

%------------------------------------------------------
% Numbet of FFT data points
%------------------------------------------------------
if (nargin == 3) 
   N_FFT = 1024; % Default value
end
M1 = log2(M);
M2 = ceil(M1);
N_FFT = 2^M2;  % FFT point

%------------------------------------------------------
% Number of windows and normalizing factor 
%------------------------------------------------------
K = fix(N/N_FFT); % Number of windows

index = 1:N_FFT;
w = ones(N_FFT,1);             % Rectangular window in this example
scale = K*N_FFT*norm(w)^2/2;   % Normalizing scale factor
Px = zeros(N_FFT,1); 

%--------------------------------------------------------
% Compute the psd estimate
%--------------------------------------------------------
for i=1:K  
     xw = w.*[detrend(x(index)); zeros(N_FFT-M,1)];
     index = index + N_FFT;
     temp = abs(fft(xw,N_FFT)).^2;
     Px = Px + temp;            % Accumulate FFT spectra
end

P = Px([2:(N_FFT/2+1)])/scale; % Select first half and eliminate DC value

if( nargout == 0)  % Plot PSD function
    N1 = N_FFT/2;
    df = (fs/2 )/N1;  % Frequency resolution
    f1 = max(1,round(freq_range(1)/df )); 
    f2 = min(N1,round(freq_range(2)/df)); 
    frequency = (f1:f2)*df/1000;  % Frequency vector in KHz
    P = P(f1:f2);
    Y_max = max(P);
    if strcmp(y_scale, 'linear')
        plot(frequency, P);
        axis([0 5 0 Y_max*1.2]);
        ylabel('S_x(f)');
    elseif strcmp(y_scale, 'decibel')
        P_dB = 10*log10(P);
        plot(frequency,P_dB);
       ylabel('S_x(f)  [dB]');
    end
    xlabel('Frequency [KHz]');
    title('Power Spectral Density');
    grid on;
end
if( nargout == 1)
    Sx = P;     
end
