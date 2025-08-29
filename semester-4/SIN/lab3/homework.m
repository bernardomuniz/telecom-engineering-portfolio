clear all
clc

%Definindo u(t)
u=@(t) t >= 0;

%1)
%Questão A - u(t-5)-u(t-7)
xa=@(t) u(t-5) - u(t-7);

%Questão B - u(t-5)+u(t-7)
xb=@(t) u(t-5) + u(t-7);


%Questão C - t²[u(t-1)-u(t-2)]
xc=@(t) (t.^2).*(u(t-1)-u(t-2));


%Questão D - (t-4)[u(t-2)-u(t-4)]
xd=@(t) (t-4).*(u(t-2) - u(t-4));

%Definindo o intervalo de variação da variavel t em tempo contínuo
t=-10:0.01:20;

%Plot dos sinais
figure(1)
plot(t, xa(t));grid;
title('x_a(t) = u(t-5)-u(t-7)')
axis([0 10 -3 3])

figure(2)
plot(t, xb(t));grid;
title('x_b(t)= u(t-5)+u(t-7)')
axis([0 10 -3 3])

figure(3)
plot(t,xc(t));grid;
title('x_c(t)=t²[u(t-1)-u(t-2)]')
axis([0 10 -1 6])

figure(4)
plot(t,xd(t));grid;
title('x_d(t)=(t-4)[u(t-2)-u(t-4)]')
axis([0 10 -3 3]) %0 a 10 - eixo x | -3 3 - eixo y

%2)

%a)
x1a=@(t) (4*t+4).*(u(t+1)-u(t));
x1b=@(t) (-2*t+4).*(u(t)-u(t-2));

x1=@(t) x1a(t) + x1b(t);

%b) 
x2=@(t) (t.^2).*(u(t) - u(t-2)) + (2*t-8).^(u(t-2)-u(t-4));

figure(5)
subplot(3,1,1)
plot(t, x1a(t));grid;
axis([-5 5 -1 5])
title('x_a(t)')
subplot(3,1,2)
plot(t, x1b(t));grid;
axis([-5 5 -1 5])
title('x_b(t)')
subplot(3,1,3)
plot(t, x1(t));grid;
axis([-5 5 -1 5])
title('x_1(t)')

figure(6)
plot(t,x2(t));grid;
title('x_2(t)')
axis([0 10 -5 5])

%Sinais em tempo discreto

%Definindo u[n]
u=@(n) (n>=0);

%5)

%a) u[n-2]-u[n-6]
xa=@(n) u(n-2) - u(n-6);

%b) n {u[n] - u[n-7]}
xb=@(n) n.*(u(n) - u(n-7));

%c) (n-2) {u[n-2] - u[n-6]}
xc=@(n) (n-2).*(u(n-2) - u(n-6));

%d) (-n+8) {u[n-6]-u[n-9]}
xd=@(n) (-n+8).*(u(n-6) - u(n-9));

%e) (n - 2) * (u(n - 2) - u(n - 6)) + (-n + 8) * (u(n - 6) - u(n - 9))
xe=@(n) (n - 2).* (u(n - 2) - u(n - 6)) + (-n + 8).*(u(n - 6) - u(n - 9));

%Definindo o intervalo de variação da variavel n em tempo discreto
n=-15:20; 

%Plot dos gráficos u[n]
figure(7)
stem(n,xa(n));grid;
title('x_a(n)')
axis([-5 10 -2 2])

figure(8)
stem(n,xb(n));grid;
title('x_b(n)')
axis([-5 10 -2 7])

figure(9)
stem(n,xc(n));grid;
title('x_c(n)')
axis([-5 10 -2 4])

figure(10)
stem(n,xd(n));grid;
title('x_d(n)')
axis([-2 15 -2 6])

figure(11)
stem(n,xe(n));grid;
title('x_e(n)')
axis([-2 15 -2 6])

