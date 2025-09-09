clear all
clc

u=@(t) t >= 0;

x1=@(t) u(t) - u(t-1);
x2=@(t) (t.^2).*(u(t-1)-u(t-2));
x3=@(t) 4*u(t-2) - 4*u(t-3);
x4=@(t) u(t-3) - u(t-4);
x5=@(t) (-t+5).*(u(t-4) - u(t-5));
x=@(t)   x1(t) + x2(t) + x3(t) + x4(t) + x5(t);
t=-10:0.01:20;
figure(1)
plot(t,x(t));grid;
title('x(t)')
axis([-1 7 -1 6])

%Questão A
xa=@(t) x(-t)
figure(2)
plot(t, xa(t));grid;
title('x_a(t) = (-t)')
axis([-5 2 -2 5])

%Questão B
xb=@(t) x(2*t);
figure(3)
plot(t, xb(t));grid;
title('x_b(t) = (2t)')
axis([0 5 -2 6])

%Questão C
xc=@(t) x(-3*t+2);
figure(4);
plot(t, xc(t));grid;
title('x_c(t) = (-3t+2)')
axis([-2 2 -2 6])












