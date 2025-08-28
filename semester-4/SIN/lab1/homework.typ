#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Análise de sinais em tempo contínuo e discreto",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz",),
  date: "14 de Agosto de 2025",
  doc,
)


= Questão A
Para a questão A foi definida a seguinte função para ser analisada em tempo *discreto*:

$
x[n] = (-0,5)^n
$

Código no Matlab:

#sourcecode[```matlab
f =@(n) (-0.5).^n;
n = -30:30;
f(n)
figure(1);
stem(f(n));
title('Questão A - Plot do sinal discreto')
```]
\
Plotagem do gráfico em tempo discreto:
\
\
#figure(
  figure(
    rect(image("plot1.png")),
    numbering: none,
    caption: [Plot do gráfico da Questão A]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
\
\
\
\
= Questão B
Para a questão B foi definida a seguinte função para ser analisada em tempo *discreto*:

$
x[n] = (2)^-n
$

Código no Matlab:

#sourcecode[```matlab
g = @(n) (2).^(-n);
n = -30:30;
g(n)
figure(3)
stem(g(n));
title('Questão B - Plot do sinal discreto')
```]
\
Plotagem do gráfico em tempo discreto:
\
\
#figure(
  figure(
    rect(image("plot2.png")),
    numbering: none,
    caption: [Plot do gráfico da Questão B]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
\
\
\
\
= Questão C
Para a questão C foi definida a seguinte função para ser analisada em tempo *discreto*:

$
x[n] = (-2)^n
$

Código no Matlab:

#sourcecode[```matlab
h =@(n) (-2).^n;
n = -30:30;
h(n)
figure(5)
stem(h(n));
title('Questão C - Plot do sinal discreto')

```]
\
Plotagem do gráfico em tempo **discreto*:*
\
\
#figure(
  figure(
    rect(image("plot3.png")),
    numbering: none,
    caption: [Plot do gráfico da Questão C]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
\
\
\
\
= Questão D
Para a questão D foi definida a seguinte função para ser analisada em tempo *contínuo*:

$
x(t) = e^(-2t)
$

Código no Matlab:

#sourcecode[```matlab
y = @(t) exp(-2 * t);
t = -3:0.01:3;
y(t)
figure(7)
plot(t,y(t))
title('Questão D - Plot do sinal em tempo contínuo')
xlabel('t');
ylabel('y(t)');grid;
```]
\
Plotagem do gráfico em tempo contínuo:
\
\
#figure(
  figure(
    rect(image("plot4.png")),
    numbering: none,
    caption: [Plot do gráfico da Questão D]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
\
\
\
= Questão E
Para a questão E foi definida a seguinte função para ser analisada em tempo *contínuo*:

$
x(t) = 2 cos(2 pi 50 t)
$

Código no Matlab:

#sourcecode[```matlab
S = @(t) 2*cos(2*pi*50*t);
t = -3:0.01:3;
S(t)
figure(8)
plot(t,S(t))
title('Questão E - Plot do sinal em tempo contínuo')
xlabel('t');
ylabel('S(t)');grid;
```]
\
Plotagem do gráfico em tempo contínuo:
\
\
#figure(
  figure(
    rect(image("plot5.png")),
    numbering: none,
    caption: [Plot do gráfico da Questão E]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)