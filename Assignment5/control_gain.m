% Plant definition
M = 2;
m = 0.1; 
L = 0.5;
g = 9.81;

A = [0 , 1, 0, 0; 
    (M+m)*g/(M*L), 0, 0, 0;
    0, 0, 0, 1;
    -m*g/M, 0, 0, 0];
B = [0; -1/(M*L); 0; 1/M];
%  ESTADOS: [teta; teta_p; xc; xc_p];
C = [0, 0, 1, 0];

Ahat = [A zeros(4,1); -C 0];
Bhat = [B; 0];
%% Controlabilidad
P = [A, B; -C 0];
sizeP = size(P);
controlMat = ctrb(Ahat, Bhat);
controlRank = rank(controlMat);

if controlRank >= sizeP(1)
    disp('La matriz P es completamente controlable')
%     >> La matriz P es completamente controlable
else
    disp('La matriz P no es controlable')
    return;
end
%% Ganancias del controlador
% Polos propuestos - Ogata
% Asentamiento 4-5 seg. y sobrelongacion máx. 15-16%
J = [-1+j*sqrt(3), -1-j*sqrt(3), -5, -5, -5];

Khat = acker(Ahat, Bhat, J);
K = Khat(1:4)
% >> -157.6336  -35.3733  -56.0652  -36.7466
% Ganancia integral
Ki = -Khat(5)
% >> -50.9684

%% Ganancias (Ke) del Observador
% Determinamos si el sistema es observable
obs = obsv(A, C);
obsRank = rank(obs);
a_size = size(A);
if obsRank == a_size(1)
    disp('El sistema es observable')
else
    disp('El sistema no es observable')
    return;
end
% Polos propuestos para el observador
Jo = [-3, -3, -15, -15];
Ke = acker(A', C', Jo)
% >>    1.0e+04 *
% >>   -0.4815   -2.2382    0.0036    0.0435
