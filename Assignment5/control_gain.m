% Plant
M = 2;
m = 0.1; 
L = 0.5;
g = 9.81;

A = [0 , 1, 0, 0; 
    (M+m)*g/(M*L), 0, 0, 0;
    0, 0, 0, 1;
    -m*g/M, 0, 0, 0];
B = [0; -1/(M*L); 0; 1/M];
C = [0, 0, 1, 0];

Ahat = [A zeros(4,1); -C 0];
Bhat = [B; 0];


%% Controlabilidad
P = [A, B; -C 0];
% Rango de la matriz = 5
detP = det(P);
if detP == 0
    disp('La matriz P no es controlable')
    return;
else
    disp('La matriz P es completamente controlable')
end
%% Ganancias
% Polos propuestos - Ogata
% Asentamiento 4-5 seg. y sobrelongacion máx. 15-16%
J = [-1+j*sqrt(3), -1-j*sqrt(3), -5, -5, -5];

Khat = acker(Ahat, Bhat, J)
K = Khat(1:4)
% Ganancia integral
Ki = -Khat(5)