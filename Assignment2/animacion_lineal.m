function salida = animacion_lineal(u)

% Entrada
teta = u(1);

% ParametrosMATLAB Drive
L = 1;

% Coordenadas de posicion
x = L * sin(teta);
y = L * cos(teta);

% Graficar
figure(1)
plot([0 x], [0, y], '-bo');
axis([-2 2 -2 2]);
grid;

% Salida
salida = 0;