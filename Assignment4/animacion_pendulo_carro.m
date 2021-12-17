function salida = animacion_pendulo_carro(u)
%entradas
x=u(1);
teta=u(2);
L=1;
xp=L*sin(teta);
yp=L*cos(teta);

hold off;
plot([0+x xp+x],[0 yp],'-o', 'LineWidth', 3)
hold on;
plot([0+x -0.5+x],[0 0],'-o',... % top
     [0+x 0.5+x],[0 0],'r-o',...
     [0+x -0.5+x],[-0.5 -0.5],'r',... %bottom
     [0+x 0.5+x],[-0.5 -0.5],'r',... 
     [-0.5+x -0.5+x],[0 -0.5],'r-o',... % left
     [0.5+x 0.5+x],[0 -0.5],'r-o', 'LineWidth',5); %right
axis([-5 5 -1 1]);
grid
salida=[];