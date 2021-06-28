function X = uniform_noise(a,b,N)

%===========================================================================
% This function generates an Nx1 vector of random numbers 
%    uniformly distributed on (a, b) 
%===========================================================================

Y = rand(N,1); % Nx1 vector of random numbers with u(0,1)
X = (b-a)*Y + a;