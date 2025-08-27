#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Laboratório 3 - Espelhos Esféricos Côncavos",
  subtitle: "Física III",
  authors: ("Arthur Oliveira dos Reis, Bernardo Souza Muniz, Eduardo Gerber Filho, Ygor Vinicius Martins.",),
  date: "16 de Julho de 2025",
  doc,
)

= Introdução

Este relatório tem como objetivo descrever o experimento realizado em laboratório proposto pelo docente. A aula experimental tinha como foco de estudo o comportamento de um espelho esférico côncavo, e como este se comportava de acordo com as situações em que este era imposto.
\
\
A figura abaixo demonstra uma ilustração teórica do experimento, com um cavaleiro portando dois suportes com uma lupa e uma fonte de luz de vela.

#figure(
  figure(
    rect(image("introducao/experimento_desenhado.jpeg", width: 90%)),
    numbering: none,
    caption: [Foto teórica do experimento]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Os objetivos principais ao realizar o experimento são:

- Determinar a distância focal ($f$) de um espelho côncavo.
- Determinar o raio de curvatura ($R$) de um espelho côncavo.
- Observar as características (natureza, orientação e tamanho relativo) das imagens formadas em 5 pontos distintos do espelho côncavo
- Comprovar a equação de Gauss ($1/f = 1/p + 1/p'$), e a equação de aumento linear transversal ($A = -p'/p$) através de valores teóricos e os obtidos em laboratório.
- Analisar as fontes de erro e incertezas no que se dizem aos processos de medição de um experimento ótico.

Os materiais que foram utilizados para realizar o experimento foram:
- Banco óptico com escala milimetrada.
- Espelho esférico côncavo com suporte.
- Fonte de luz (vela) com suporte.
- Folha de papel branca.
- Régua.

= Equações

Ao decorrer deste relatório, utilizaremos as seguintes equações para obter os valores solicitados e cumprir com os demais requisitos exigidos.
\
\
Os seguintes referenciais serão adotados:
- $p > 0$ para objetos reais.
- $p' > 0$ para imagem real (projetável, na frente do espelho).
- $p' < 0$ para imagem virtual  (não projetável, atrás do espelho).
- $f > 0$ para espelho côncavo.
- $A < 0$ para imagem invertida.
- $A > 0$ para imagem direita.

== Equação de Gauss
A relação entre a posição do objeto $(p)$, a posição da imagem $(p')$ e a distância focal $(f)$ é dada pela equação de Gauss:

  $
  1/f = 1/p + 1/p'
  $

- $f: $ Distância focal.\
- $p:$ Posição do objeto.\
- $p':$ Posição da imagem.
  
== Aumento Linear Transversal
A relação do tamanho da imagem $(i)$ com o do objeto $(o)$ é dada pela equação do Aumento Linear Transversal:
  $
  A = i/o = -p'/p
  $

- $A:$ Aumento Linear Transversal.\
- $i:$ Tamanho da imagem.\
- $o:$ Tamanho do objeto.\
- $p:$ Posição do objeto.\
- $p':$ Posição da imagem.

== $p'$ teórico

$
p'_"teórico" = (p_exp * f_exp)/(p_exp - f_exp)
$

- $p'_"teórico":$ Posição teórica da imagem.\
- $p_exp :$ Posição do objeto obtido em laboratório.\
- $f_exp :$ Posição do foco obtido em laboratório.

== Erro Percentual de $p'$ Teórico

$
"Erro %" = |(p'_exp - p'_"teórico") / p'_"teórico"| * 100
$

- $"Erro %":$ Erro percentual de $p'$ teórico.\
- $p'_"teórico":$ Posição teórica da imagem.\
- $p_exp:$ Posição do objeto obtido em laboratório.

= Experimental

O experimento baseava-se em posicionar a vela, que se tratava do nosso objeto, em um determinado ponto do banco óptico a fim de encontrar os diferentes tipos de imagem. Como precisamos do valor da distância focal ($f$) para realizar as equações utilizando a Equação de Gauss (Equação 1), determinamos este ponto inicialmente. Ponto este que se localiza a uma distância de 50mm do espelho côncavo, logo, $f = 50"mm"$.
\
\
A seguir, vamos observar os efeitos obtidos em cada um dos 5 casos.

== Caso 1 - Objeto além do Centro de Curvatura ($p > R$)

Como o valor de $p$ neste caso deveria ser consideravelmente maior que o centro de curvatura do espelho côncavo. O valor de $p$ determinado foi de 200mm em relação ao espelho, ou seja, $p = 200"mm"$.

#figure(
  figure(
    rect(image("caso1.jpg", width: 90%)),
    numbering: none,
    caption: [Imagem de experimento do caso 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
Utilizando os valores inicialmente adquiridos para obtermos a posição da imagem ($p'$), através da equação de Gauss temos:

$
1/50 = 1/200 + 1/p' => 1/50 = (200 + p')/(200p') => 200p' = 10000 + 50 p' => p' = 10000/150\
therefore p' = 66,67"mm" = 0,06667 "m"
$

Portanto, a distância da imagem ao espelho é equivalente a 0,06667m.
\
\
Por fim, podemos calcular o valor do aumento linear transversal substituindo os valores de $p$ e $p'$ na equação $(2)$:

 $
  A = -p'/p = -(0,06667)/ (0,2) = -0.3335
 $

A partir dos resultados obtidos, a imagem observada no primeiro caso tem as seguintes características:

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [#strong("Natureza")], [#strong("Orientação")], [#strong("Tamanho Relativo")],
  [Real], [Invertida], [Objeto Menor]
)

== Caso 2 - Objeto no Centro de Curvatura ($p = R$) 

#figure(
  figure(
    rect(image("caso2.jpg", width: 90%)),
    numbering: none,
    caption: [Imagem de experimento do caso 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

A posição do centro de curvatura é equivalente ao dobro da distância do foco, ou seja:

$
R_exp = f_exp * 2 => R_exp = 50 * 2 therefore R_exp = 100"mm"
$

Assim, a posição do centro de curvatura do espelho se localiza a 100mm do espelhou, ou, a 0,1m do espelho. Agora, tendo $p = R_exp$, e aplicando na equação de Gauss temos:

$
1/50 = 1/100 + 1/p' => 1/50 = (100+p')/(100p') => 100p' = 5000 + 50p' => p' = 5000/50\
therefore p' = 100"mm" " = " p' = 0,1m
$

Assim, a distância da imagem ao espelho é de 0,1m. Curiosamente, se trata do mesmo valor de $p$, isso implica pra gente que o objeto possui o mesmo tamanho quando comparado em relação ao objeto projetado pelo espelho. O que evidencia a veracidade do que observamos no espelho.
\
\
Por fim, podemos calcular o valor do aumento linear transversal substituindo os valores de $p$ e $p'$ na equação $(2)$:

 $
  A = -p'/p = -(0,1)/ (0,1) = -1
  $

A partir dos resultados obtidos, a imagem observada no primeiro caso tem as seguintes características:
#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [#strong("Natureza")], [#strong("Orientação")], [#strong("Tamanho Relativo")],
  [Real], [Invertida], [Tamanho igual do Objeto]
)

== Caso 3 - Objeto entre o Centro de Curvatura e o Foco ($f < p < R$)

Como agora o valor de $p$ precisa estar dentro do intervalo $f < p < R$, ou seja, $50"mm" < p < 100"mm"$, definimos o valor de $p$ como $p = 80"mm"$.

#figure(
  figure(
    rect(image("caso3.jpg", width: 45%)),
    numbering: none,
    caption: [Foto do experimento do caso 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
Utilizando os valores inicialmente adquiridos para obtermos a posição da imagem ($p'$), através da equação de Gauss temos:
$
1/50 = 1/80 + 1/p' => (80+p')/(80p') = 1/50 => 80p' = 4000 + 50p' => p' = 4000/(30)\
therefore p' = 133"mm" = 0,133m
$

Assim, a distância da imagem ao espelho é de 0,133m.
\
\
Por fim, podemos calcular o valor do aumento linear transversal substituindo os valores de $p$ e $p'$ na equação $(2)$:

 $
  A = -p'/p = -(0,133)/ (0.08) = -1,67
  $

A partir dos resultados obtidos, a imagem observada no primeiro caso tem as seguintes características:

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [#strong("Natureza")], [#strong("Orientação")], [#strong("Tamanho Relativo")],
  [Real], [Invertida], [Maior que o Objeto]
)

== Caso 4 -  Objeto no Foco ($p = f$)

O foco, como apresentado no começo desta seção, já foi obtido ($f = 50"mm"$). O foco foi facilmente obtido por conta de uma grande peculiaridade que este carrega consigo. Em resumo, no ponto de foco, o espelho não produz uma imagem, isso faz com que apareça apenas uma espécie de borrão.
\
\
Inclusive, se tentarmos obter o valor de $p'$ através da Equação de Gauss encontramos um resultado um tanto intrigante:

$
1/50 = 1/50 + 1/p' => 1/50 = (50 + p')/(50p') => 50p' = 2500 + 50p'\
0 = 2500  "(F)"
$

Como podemos observar, o resultado obtido é um completo absurdo, esse resultado incongruente nos mostra que de fato não há imagem quando o objeto com relação ao espelho côncavo se localiza no ponto focal.
\
\
A partir dos resultados obtidos, a imagem observada no primeiro caso tem as seguintes características:
#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [#strong("Natureza")], [#strong("Orientação")], [#strong("Tamanho Relativo")],
  [Indeterminada], [Indeterminada], [Indeterminado]
)

== Caso 5 - Objeto entre o Foco e o Vértice ($p < f$)

Agora, nosso ponto $p$ está extremamente próximo do espelho côncavo, para ser mais preciso, $p < 50"mm"$.

#figure(
  figure(
    rect(image("caso5.jpg", width: 90%)),
    numbering: none,
    caption: [Foto do experimento do caso 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Assim, quando temos $p = 30"mm"$, e aplicamos a Equação de Gauss, somos capazes de obter o seguinte valor de $p'$:

$
1/50 = 1/30 + 1/p' => 1/50 = (30+p')/(30p') => 30p' = 1500 + 50p' => p' = -(1500)/200 =>\
p' = -75"mm"  "   ou   " p' = -0,075m
$

O valor da distância de imagem ao espelho é de -75mm, ou, -0,075mm. Um valor um tanto curioso, tendo em vista que agora obteve-se um valor negativo de $p'$. O valor negativo nos indica uma mudança no que o espelho reflete. Agora, em vez de imagens reais, estamos trabalhando com imagens virtuais.
\
\
Por fim, podemos calcular o valor do aumento linear transversal substituindo os valores de $p$ e $p'$ na equação $(2)$:

 $
  A = -p'/p = -((-0,075))/ (0.03) = 2,5 
  $

A partir dos resultados obtidos, a imagem observada no primeiro caso tem as seguintes características:
#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [#strong("Natureza")], [#strong("Orientação")], [#strong("Tamanho Relativo")],
  [Virtual], [Direita], [Maior que o Objeto]
)

= Análise de Dados e Resultados

== Tabela de Resultados

Observação importante. Como a equipe já possuía a distância focal, e adquiria a medida de p através do banco óptico. Os valores da coluna $p_"exp"$ representam os valores deduzidos através da aplicação da Equação de Gauss com o fim de prover o menor erro possível.
\
\
#strong[Observação]: Como a tabela requerida pelo docente pede os valores em centímetros, vale evidenciar que para os cálculos o valor de $f$ será transformado para centímetros, ou seja , $f = 5"cm"$

#figure(
  figure(
    table(
      align: auto,
      columns: 6,
        [#strong[\ Caso]], [#strong[\ $p_exp \ ("cm")$]], [#strong[\ $p'_exp \ ("cm")$]],  [#strong[\ Natureza]], [#strong[\ Imagem]], [#strong[\ Tamanho Relativo]], 
  
  [$p > 2f$], [6,667],[-0.3335], [Real], [Invertida], [Menor], 
  
  [$p = 2f$], [10],[-1], [Real], [Invertida], [Igual], 
  
  [$f < p < 2f$], [13,3],[-1,67], [Real], [Invertida], [Maior], 
  
  [$p = f$], [Indeterminada], [Indeterminada], [Indeterminada], [Indeterminada], [Indeterminada], 
  
  [$p < f$], [-7,5], [2,5], [Virtual], [Direita], [Maior],    
    ),
    numbering: none,
    caption: [Tabela de valores encontrados nos exercícios]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Análise dos dados

Agora, vamos utilizar este tópico para responder as perguntas elaboradas pelo docente ao fim do relatório. Logo:


- Os resultados experimentais confirmaram as previsões teóricas para cada um dos cinco casos? Compare suas observações na última coluna da tabela com o que é esperado pela teoria.

#strong[Resposta:] Sim, principalmente quando observamos os valores de p', conforme o o espelho se aproxima do nosso objeto, seu tamanho projetado aumenta. E o sinal de $p'$ evidencia sua natureza e imagem, quando positivos, a imagem é real e invertida, já quando é negativo, a imagem se trata de uma virtual e direita. 

- Quais foram as principais fontes de erro neste experimento?

#strong[Resposta:] Pelo contrário, os erros desse experimento foram tão reduzidos, por conta que ao decorrer deste os valores já estavam sendo calculados. Assim, a equipe já sabia para onde levar o espelho pra obter o determinado resultado.

- Para o caso 5, por que a imagem não pôde ser projetada no anteparo? Relacione sua resposta com o sinal de p' que seria obtido na Equação de Gauss.

#strong[Resposta:]  Justamente pois a natureza de uma imagem real é que esta não pode ser projetada. Isso ocorre pois é como se os raios de luz se cruzassem apenas dentro do espelho, assim, os raios nunca convergem de fato. Inclusive, o sinal nos evidencia esta mudança de imagem real para virtual, enquanto os outros valores de $p'$ são positivos, ao chegarmos na imagem virtual, o valor é trocado para negativo, mostrando também que agora a imagem formulada está se formando "dentro" do espelho.

- Com base nas características da imagem no caso 5, cite uma aplicação prática para um espelho côncavo utilizado dessa maneira.

#strong[Resposta:] Geralmente são as aplicações que giram em torno do próprio conceito de espelho no cotidiano. Ou seja, são utilizados em espelhos com fins de estética, retrovisores de carros, etc.

- Com base nas características do caso 1, cite uma aplicação prática.

#strong[Resposta:] Um bom exemplo são os projetores, tendo em vista que estes são colocados em uma distância consideravelmente maior com o fim de aumentar a área de imagem gerada.

\

= Conclusão

Como visto anteriormente, sabe-se que a imagem projetada em um espelho côncavo está diretamente relacionada aos valores de aumento linear transversal ($A$) e à posição do objeto em relação ao espelho, conforme resumido na tabela abaixo:

- $A > 0:$ A imagem é direita (virtual).
- $A < 0:$ A imagem é invertida (real).
- $|A| > 1:$ A imagem é maior que o objeto.
- $|A| = 1:$ A imagem tem o mesmo tamanho do objeto.
- $|A| < 1:$ A imagem é menor que o objeto.

Dessa forma, pôde-se observar durante a realização do experimento que, ao variar a posição do objeto em relação ao espelho côncavo, diferentes tipos de imagens foram formadas, cada uma com características próprias de natureza, orientação e tamanho relativo.

Os resultados experimentais obtidos estavam de acordo com as previsões teóricas, comprovando as leis da óptica geométrica para espelhos esféricos. Também foi possível verificar na prática como a equação de Gauss e a equação do aumento linear transversal prevem com precisão a posição e o tamanho da imagem formada, reforçando a importância desses conceitos para a compreensão dos fenômenos ópticos.


