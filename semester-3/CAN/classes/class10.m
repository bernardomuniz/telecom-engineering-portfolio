%Aula 10 - Método de Runge Kutta

%Método de Runge Kutta
y4 = [y0];

for i=1:size(x,2) - 1
    K1 = f(x(i), y4(i));
    K2= f(x(i) + (Dx/2), y4(i) + ((Dx/2) * K1));
    K3 = f(x(i) + Dx/2, y4(i) + Dx/2*K2);
    K4 = f(x(i) + Dx, y4(i) + Dx*K3);
    yn= y(i) + Dx/6*(K1+ 2*K2+ 2*K3 + K4);
    y4=[y4 yn];
end 
y4

%ERROS
DELTAS = [];
ERROS = [];
for j=1:10
    y=[y0]
    Dx = Dx/2;
    x=[xi:Dx:xf];
    
    for i=1:size(x,2) - 1
        yn=Dx *f(x(i),y(i))+y(i);
        y=[y yn];
    end 
erro = max(abs(exp(x)-y));
ERROS = [ERROS erro];
DELTAS = [DELTAS Dx];
end

plot(DELTAS,ERROS, '-*r');
(ERROS(1) - ERROS(end))/(DELTAS(1)-DELTAS(end));



%ERROS PARA RUNGE KUTTA
Dx=1;
for j=1:10
    y4=[y0]
    Dx = Dx/2;
    x=[xi:Dx:xf];
    
    for i=1:size(x,2) - 1
          K1 = f(x(i), y4(i));
          K2= f(x(i) + (Dx/2), y4(i) + ((Dx/2) * K1));
          K3 = f(x(i) + Dx/2, y4(i) + Dx/2*K2);
          K4 = f(x(i) + Dx, y4(i) + Dx*K3);
          yn= y(i) + Dx/6*(K1+ 2*K2+ 2*K3 + K4);
          y4=[y4 yn];
    end 
erro = max(abs(exp(x)-y4));
ERROS = [ERROS erro];
DELTAS = [DELTAS Dx];
end
plot(DELTAS,ERROS, '-*g');
(ERROS(1) - ERROS(end))/(DELTAS(1)-DELTAS(end));

