#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Avaliação de Sinais e Sistemas - Sistemas LIT",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz",),
  date: "18 de Outubro de 2025",
  doc,
)

= Questões

*1)* Determinar a *resposta total a uma entrada degrau unitário* para o sistema descrito pela seguinte equação diferença:

$
y[n + 2] + 3y[n+1] + 2y[n] = x[n+1]
$

*Condições iniciais:* $y[-1]=0 " e " y[-2] = 1$
\
\
*\
2) *Determinar a *resposta total a uma entrada $x(t) = delta(t-1) + 2delta(t-3)$* para o sistema descrito pela seguinte equação diferencial:

$
(D²+6D+5)y(t) = x(t)
$

*Condições iniciais: *$y_0(0) = 2, (d y_0(0))/(d t) = -2$

= Questão 1

#figure(
  figure(
    rect(image("q1.1.jpeg", width: 100%)),
    numbering: none,
    caption: [Questão 1 - parte 1] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("q1.2.jpeg", width: 100%)),
    numbering: none,
    caption: [Questão 1 - parte 2] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)

#pagebreak()

= Questão 2

#figure(
  figure(
    rect(image("q2.1.jpeg", width: 100%)),
    numbering: none,
    caption: [Questão 2 - parte 1] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("q2.2.jpeg", width: 100%)),
    numbering: none,
    caption: [Questão 2 - parte 2] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)