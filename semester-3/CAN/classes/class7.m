%Aula 7 - Método de Newton-Raphson para sistemas de equações não lineares

F=@(x,y) [x*x+y*y-4;x-y];
J=@(x,y) [2*x 2*y;1 -1];
x0=[1;1];
x1 = x0
x0 = x0-inv(J(x0(1),x0(2)))*F(x0(1),x0(2));
erro = max(abs(x1-x0));

while(erro > 0.0001)
    x1 = x0;
    x0 = x0-inv(J(x0(1),x0(2)))*F(x0(1),x0(2));
    erro = max(abs(x1-x0));
end