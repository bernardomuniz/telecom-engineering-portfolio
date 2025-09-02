#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Programa de matrícula ",
  subtitle: "Arquitetura e organização de computadores",
  authors: ("Bernardo Souza Muniz",),
  date: "02 de Setembro de 2025",
  doc,
)

= Introdução
Este relatório tem o objetivo de demonstrar os resultados obtidos na utilização de uma calculadora rudimentar. O projeto do hardware tem o objetivo de calcular o resultado de uma determinada série de operações de adição e subtração e apresentar o resultado final no mostrador de uma placa *FPGA* (*_Field Programmable Gate Array_*) modelo *DE2-115*. Para demonstração, foi utilizado os 8 primeiros números de matrícula do SIGAA e utilizado um arquivo programável `.mif` para configuração das operações da calculadora.

= Tabela de valores
Para realizar o experimento da calculadora rudimentar, foi utilizada a seguinte matrícula como parâmetro de entrada:

$
202410004342
$
\
A tabela abaixo mostra a conversão dos números da matrícula em 8 bits, bem como a identificação de cada número:

#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Número*],[*Identificação*], [*Conversão*],  
      [2], [M0], [00000010], 
      [4], [M1], [00000100], 
      [3],[M2], [00000011],
      [4],[M3], [00000100],
      [0],[M4], [00000000],
      [0],[M5], [00000000],
      [0],[M6], [00000000],
      [1],[M7], [00000000],
      
     
    ),
    numbering: none,
    caption: [Tabela de identificação e conversão do número da matrícula]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

O esquema abaixo demonstra as operações que foram definidas para o experimento da calculadora rudimentar e os resultados esperados após cada operação. 

#sourcecode[```

ACC <- M7         (ACC <- 1)
ACC <- ACC + M3   (ACC <- 1 + 4 = 5 )
ACC <- ACC + M5   (ACC <- 5 + 0 = 5)
ACC <- ACC + M0   (ACC <- 5 + 2 = 7)
ACC <- ACC - M1   (ACC <- 7 - 4 = 3)
ACC <- ACC - M6   (ACC <- 3 - 0 = 3)
ACC <- ACC + M2   (ACC <- 3 + 3 = 6)
ACC <- ACC + M4   (ACC <- 3 + 0 = 6)
CPU_out <- ACC    (CPU_out <- 6)
```]

Nota-se que ao final das 8 operações, o valor esperado no acumulador deve ser 6 (seis).

= Resultados obtidos
Para fazer o cálculo das operações esquematizadas, foi configurado um arquivo `.mif` para a executar os cálculos após cada pulso de clock. O código abaixo mostra a configuração do arquivo.

#sourcecode[```txt 
CONTENT
  BEGIN
    0      : 0100000001; 
    1      : 1000000100; 
    2      : 1000000000;  
    3      : 1000000010; 
    4      : 1100000100;
    5      : 1100000000;
    6      : 1000000011;
    7	   : 1000000000;
    [8..FF]: 00XXXXXXXX;
    %[0..F] : 0;           Range--Every address from 0 to F = 0   %
    %6      : F;           Single address--Address 6 = F          %
    %8      : F E 5;	     Range starting from specific address-- %	
    %                      Addr[8] = F, Addr[9] = E, Addr[A] = 5  %
  END ;
```]

Os valores obtidos no acumulador (ACC) e na sáida (CPU_out) da calculadora são exemplificados pela tabela abaixo:
\
\
#figure(
  figure(
    table(
      align: auto,
      columns: 5,
      [*Operação*],[*Entrada*], [*ACC (binário)*], [*ACC (decimal)*], [*CPU_out*],
      [ACC $<-$ M7], [00000010], [00000001], [1], [XXXXXXXX],
      [ACC $<-$ ACC + M3], [1000000101], [00000101], [5], [XXXXXXXX],
      [ACC $<-$ ACC + M5],[1000000101], [00000101], [5],[XXXXXXXX],
      [ACC $<-$ ACC + M0],[1000000111], [00000111],[7],[XXXXXXXX],
      [ACC $<-$ ACC - M1],[1100000100], [00000011],[3],[XXXXXXXX],
      [ACC $<-$ ACC - M6],[1100000000], [00000011],[3],[XXXXXXXX],
      [ACC $<-$ ACC + M2],[1000000011], [00000110],[6],[XXXXXXXX],
      [ACC $<-$ ACC + M4],[1000000000], [00000110],[6],[XXXXXXXX],
      [CPU_out $<-$ ACC],[XXXXXXXX], [00000110],[6],[00000110],
      
    ),
    numbering: none,
    caption: [Tabela de resultados do acumulador]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão
Após a utilização da calculadora rudimentar, foi possível verificar que os resultados esperados no início do projeto foram plenamente satisfeitos, além do entendimento do processo de caminho dos dados e como eles operam em dispositivos lógicos programáveis. 