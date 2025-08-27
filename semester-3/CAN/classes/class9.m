%Aula 9 - Método de Euler


%Método de Euler - EDO
f = @(x,y) y
Dx=0.01;
xi=0;
xf=1;
x=[xi:Dx:xf];
y0 = 1;
y=[y0];

for i=1:size(x,2) - 1
    yn=Dx *f(x(i),y(i))+y(i);
    y=[y yn];
end 
y
plot(x,y,'.r',x,exp(x),'-b');


%Método de Euler Modificado

y2=[y0];

for i=1:size(x,2) - 1
    K1 = f(x(i), y2(i));
    K2= f(x(i) + Dx/2, y2(i) + (Dx * K1)/2);
    yn=Dx *K2+y2(i);
    y2=[y2 yn];
end 
y2 %2.71
plot(x,y2,'.r',x,exp(x),'-b');


%Método do Euler Melhorado

y3=[y0];

for i=1:size(x,2) - 1
    K1 = f(x(i), y3(i));
    K2= f(x(i) + Dx, y3(i) + Dx * K1);
    yn= (Dx/2)*(K1 +K2)+y3(i);
    y3=[y3 yn];
end 
y3
plot(x,y3,'.r',x,exp(x),'-b');