%%Aula 4 - Método do ponto Fixo | Método de Newton | Método da Secante

%1)Isolar o x

%modulo da derivada < 1 => |f'(x)| < 1 - garantia de convergencia
%pi(x) => função que rstou após isolar o x

%se após derivar pi(x) e verificar que o módulo é < 1  não é uma boa função

% Método do ponto fixo

phi= @(x) sqrt(x + 2);
x0 = -1.5;
x1 = phi(x0);
E = 0.0001;
while(abs(x1 - x0) > E)
    x0 = x1;
    x1 = phi(x0);
end
x1;
   
%Método de newton
%x n + 1 = x n - f(xn)/f'(xn)
f= @(x) x.^2 - x - 2;
dF = @ (x) 2*x - 1;
E2 = 0.0001;
x0 = 3;
x1 = x0 - f(x0)/dF(x0);

while(abs(x1 - x0) > E2)
   x0 = x1;
   x1 = x0 - f(x0)/dF(x0); 
    
end
x1;


% Método da Secante

f= @(x) x.^2 - x - 2;
E2 = 0.00000001;
x0 = -1.5;
x1 = 3;
dF = (f(x1) - f(x0))/(x1 - x0);
x2 = x1 - f(x1)/dF;

while(abs(x2 - x1) > E2)
   x0 = x1;
   x1 = x2;
   dF = (f(x1) - f(x0))/(x1 - x0);
   x2 = x1 - f(x1)/dF;
end

x2;