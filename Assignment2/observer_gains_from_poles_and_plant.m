% Plant
m = 1;
L = 1 / 2;
g = 9.81;

A = [0 , 1; g/L, 0];
B = [0; 1/(m*L^2)];
C = [1, 0];

% Poles
% Natural Frequency
wn = 100;
% Damping factor
dp = 0.8;
% % Characteristic polynomium p = s^2 + 2(wn - natural freq)(damping factor)*s^1 + (wn^2)*s^0
p = [1, 2*wn*dp, wn*wn]
r = roots(p)
J = [r(1), r(2)];

% J = [-8 + j*6, -8 - j*6];

% Control gains
ki = acker(A, B, J)
% Observer Gains
ke = acker(A, C', J)