%Laboratório 3 - Transformação na Variável Independente

%Sinais em tempo contínuo


%1)

%Definindo a função u(t) em tempo contínuo 
u=@(t) (t>=0);

%Fazendo o plot do sinal e definindo as funções em secções

%Entre -2<=t<=-1
x1=@(t) (t+1)*(u(t+2)-u(t+1));

%Entre -1<=t<= 0 
x2=@(t) u(t+1) - u(t);

%Entre 0<=t<=1
x3=@(t) 2*(u(t)- u(t-1));

%Entre 1<=t<=2 
x4=@(t) (-t+2)*(u(t-1) - u(t-2));

%Somando os sinais, temos que:
x=@(t) x1(t) + x2(t) + x3(t) + x4(t);

%Definindo o intervalo de t para tempo contínuo
t=-10:0.01:20;

%Plot do gráfico em tempo contínuo
figure(1)
plot(t,x(t))
title('x(t)')

%a) x(t-1)
xa=@ (t) x(t-1)

%b) x(-t + 2)
xb_1 = @(t) x(t+2);
xb=@(t) xb_1(-t);

%c) x(2t+1)
xc_1 = @(t) x(t+1);
xc=@(t) xc_1(2*t);

%d) x(-t/2 + 4)
xd_1 = @(t) x(t+4);
xd=@(t) xd_1(-t/2);

%Plot de cada gráfica
figure(2)
plot(t,xa(t))
title('x_a(t)')
axis([-5 6 -2 3])

figure(3)
plot(t,xb(t))
title('x_b(t)')
axis([-2 6 -2 3])

figure(4)
plot(t,xc(t))
title('x_c(t)')
axis([-3 3 -2 3])

figure(5)
plot(t,xd(t))
title('x_d(t)')
axis([-2 16 -2 3])

%2)

%Definindo a função impulso unitário
imp=@(n) (n==0)



%Definindo o gráfico de x[n]
x=@(n) imp(n-1)+ 2*imp(n-2) + 3*imp(n-3) + 2*imp(n-4) + imp(n-5);
n=-10:20; %intervalo da variável n para tempo discreto
figure(6)
stem(n,x(n)) %o plot de funções em tempo discreto é feito com a função stem()
title('x[n]');

%a) x[-n]
xa=@(n) x(-n);
figure(7)
stem(n,xa(n))
title('x_a[-n]');

%b) x[n+6]
xb=@(n) x(n + 6);
figure(8)
stem(n,xb(n))
title('x_b[n+6]');

%c) x[n-6]
xc=@(n) x(n - 6);
figure(9)
stem(n,xc(n))
title('x_c[n-6]');

%d) x[3n]
xd=@(n) x(3*n);
figure(10)
stem(n,xd(n))
title('x_d[3n]');

%e) x[n/3]
xe=@(n) x(n/3);
figure(11)
stem(n,xe(n))
title('x_d[n/3]');

%f) x[-n+3]
xf=@(n) x(3-n);
figure(12)
stem(n,xf(n))
title('x_f[3-n]');

%3)

%a) x(t)
x=@(t) t*(u(t) - u(t-1));
figure(13)
plot(t,x(t))
title('x(t)')
axis([-1 3 -1 2])

%b) x1(t)
x1=@(t) (t+1)*(u(t+1) - u(t)) + (t-1)*(u(t-1)-u(t))
figure(14)
plot(t,x1(t))
title('x_1(t)')
axis([-3 3 -1 2])

%c) x2(t)
x2=@(t) (u(t+1) - u(t)) + (u(t) - u(t-1))
figure(15)
plot(t,x2(t))
title('x_2(t)')
axis([-3 3 -1 2])

%d) x3(t)
x3=@(t) ((-t/2) + 1)*(u(t+2) - u(t)) + ((t/2) + 1)*(u(t) - u(t-2)) 
figure(16)
plot(t,x3(t))
title('x_3(t)')
axis([-3 3 -1 2])

%e) x4(t)
x4=@(t) (4/3)*x1(t/2)-(1/3)*x2(t/2);
12
figure(17)
plot(t,x4(t))
axis([-3 3 -1 2]);


%f) x5(t)
x5=@(t) (t+1.5)[u(t+1.5)−u(t+0.5)]+1[u(t+0.5)−u(t−0.5)]+(1.5−t)[u(t−0.5)−u(t−1.5)] 
figure(18)
plot(t,x5(t))
title('x_5(t)')
axis([-3 3 -1 2])

%3)

%a) x(t)
x=@(t) t*(u(t) - u(t-1))+ (-t+2)*(u(t-1)-u(t-2));
figure(19)
subplot(4,1,1)
plot(t,x(t))
title('x(t)')
axis([-3 3 -1 2]);
subplot(4,1,2)
plot(t,x(-t))
title('x(-t)')
axis([-3 3 -1 2]);
xp=@(t) (x(t)+x(-t))/2; %Parte par
subplot(4,1,3)
plot(t,xp(t))
title('x_p(t)')
axis([-3 3 -1 2]);
xi=@(t) (x(t)-x(-t))/2; %Parte ímpar
subplot(4,1,4)
plot(t,xi(t))
title('x_i(t)')
axis([-3 3 -2 2]);