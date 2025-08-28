
clear all
clc

%A
f =@(n) (-0.5).^n;
n = -30:30;
f(n)
figure(1);
stem(f(n));
title('Questão A - Plot do sinal discreto')

figure(2);
plot(n,f(n))
title('Questão A')
xlabel('n');
ylabel('f(n)');grid;

%B
g = @(n) (2).^(-n);
n = -30:30;
g(n)
figure(3)
stem(g(n));
title('Questão B - Plot do sinal discreto')

figure(4)
plot(n,g(n))
title('Questão B')
xlabel('n')
ylabel('f(n)');grid;

%C
h =@(n) (-2).^n;
n = -30:30;
h(n)
figure(5)
stem(h(n));
title('Questão C - Plot do sinal discreto')

figure(6)
plot(n,h(n))
title('Questão C')
xlabel('n');
ylabel('h(n)');grid;

%D
y = @(t) exp(-2 * t);
t = -3:0.01:3;
y(t)
figure(7)
plot(t,y(t))
title('Questão D - Plot do sinal em tempo contínuo')
xlabel('t');
ylabel('y(t)');grid;

%F
S = @(t) 2*cos(2*pi*50*t);
t = -3:0.01:3;
S(t)
figure(8)
plot(t,S(t))
title('Questão F - Plot do sinal em tempo contínuo')
xlabel('t');
ylabel('S(t)');grid;







