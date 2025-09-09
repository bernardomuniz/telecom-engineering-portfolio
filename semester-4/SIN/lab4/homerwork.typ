#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Transformações da variável independente",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz.",),
  date: "5 de Setembro de 2025",
  doc,
)


= Definindo o gráfico de x(t)
Para realizar as transformações pedidas, foi inicialmente feito a composição dos sinais do gráfico de $x(t)$. Como resultado, foi obtido o seguinte sinal:



O código abaixo mostra a descrição do sinal em matlab:
#sourcecode[```matlab
u=@(t) t >= 0; %Função degrau
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
axis([0 7 0 6])
```]

Plotagem do gráfico em tempo contínuo:
\
\
#figure(
  figure(
    image("xt.png", width: 89%),
    numbering: none,
    caption: [Gráfico de $x(t)$]
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)

= Questão A
Para a questão A, foi definida a seguinte transformação na variável independente:

$
x(-t)
$
Código no Matlab:
#sourcecode[```matlab
xa=@(t) x(-t)
figure(2)
plot(t, xa(t));grid;
title('x_a(t) = (-t)')
axis([-5 2 0 5])
```]
\
Plotagem do gráfico em tempo contínuo:
#figure(
  figure(
    image("xa.png"),
    numbering: none,
    caption: [Gráfico de $x(t)$]
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)
\
\

\
\
= Questão B
Para a questão B, foi definida a seguinte transformação na variável independente:

$
x(2t)
$

Código no Matlab:
#sourcecode[```matlab
xb=@(t) x(2*t);
figure(3)
plot(t, xb(t));grid;
title('x_b(t) = (2t)')
axis([0 5 0 6])

```]

\
Plotagem do gráfico em tempo contínuo:
\
\
#figure(
  figure(
    image("xb.png"),
    numbering: none,
    caption: [Gráfico de $x(t)$]
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)
\

= Questão C
Para a questão C, foi definida a seguinte transformação na variável independente:

$
x(-3t+2)
$

Código no Matlab:
#sourcecode[```matlab
xc=@(t) x(-3*t+2);
figure(4);
plot(t, xc(t));grid;
title('x_c(t) = (-3t+2)')
axis([-2 2 0 6])
```]

\
Plotagem do gráfico em tempo contínuo:
\
\
#figure(
  figure(
    image("xc.png"),
    numbering: none,
    caption: [Gráfico de $x(t)$]
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)