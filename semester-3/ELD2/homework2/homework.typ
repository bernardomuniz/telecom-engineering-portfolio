#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Contador BCD genérico",
  subtitle: "Eletrônica Digital II",
  authors: ("Bernardo Souza Muniz",),
  date: "18 de Maio de 2025",
  doc,
)

= Introdução

O objetivo deste documento é apresentar um código em *_VHDL (VHSIC Hardware Description Language)_* que realiza a contagem genérica, permitindo definir qualquer número de dígitos BCD de 1 até N. O código foi estruturado estruturado em dois segmentos: um de lógica sequencial e outro de lógica combinacional. Além do desenvolvimento do código, são apresentados dados de verificação de desempenho, como a frequência máxima (Fmax), número de pinos utilizados e quantidade de elementos lógicos consumidos. A plataforma de desenvolvimento utilizada foi o Quartus Prime, e a simulação foi realizada com o ModelSim.

= Código BCD
O código de contagem genérica é dividido em dois blocos principais: um responsável pela lógica sequencial (State Register) e outro pela lógica combinacional (Next State Logic). A parte sequencial tem o objetivo de atualizar todas as mudanças feitas nas casas de unidade, dezena, centena, unidade de milhar e etc. Já a parte combinacional tem objetivo de calcular as mudanças em cada casa de contagem, fazendo incrementos a partir de um condicionais. O objetivo final é que o contador realize a contagem de acordo com a quantidade de casas arbitrada pelo usuário na variável genérica.


== Parte Sequencial
O primeiro segmento do código se trata do State register, que é sensível ao clock e ao reset. O objetivo do State Register é resetar todas as unidades do vetor de contagem para "0" através de um loop quando a variável *_enable_* for igual a "1". Caso não estiver ativo, o processo só executa durante uma borda de subida (rising edge) do clock. Durante o clock os valores do próximo estado são armazenados nos registradores. 

#sourcecode[```tcl SEQ: process(clk, reset)
    begin
        if reset = '1' then
            for i in estado_atual'range loop
                estado_atual(i) <= 0;
            end loop;
        elsif rising_edge(clk) then
            if enable = '1' then
                estado_atual <= proximo_estado;
            end if;
        end if;
    end process SEQ;```]

== Parte Combinacional 
O segundo segmento se baseia no cálculo do próximo estado. Dentro desete processo, a a variável *_proximo estado_* é atualizada quando o enable estiver ativo. A atualização de variáveis utiliza uma função descrita no arquivo _*package*_.

#sourcecode[```tcl COMB: process(estado_atual, enable)
begin
    proximo_estado <= estado_atual;

    if enable = '1' then
        proximo_estado <= incrementa_bcd(estado_atual);
    end if;

    bcd_out <= estado_atual;
end process COMB;
```]

= Contador BCD genérico

== Contador para 3 dígitos
Para fazer a contagem de um número de 3 dígitos, basta alterar a variável genérica NUM_DIGITOS  para 3. Dessa forma o contador irá fazer a contagem de 000 até 999.

O código abaixo exemplifica as alterações feitas no arquivo principal.

#sourcecode[```tcl entity bcd_generico is
    generic (
        NUM_DIGITOS : positive := 3
    );```]
    
Ao fazer a análise de síntese, observar a quantidade de elementos lógicos, o tempo de FMAX e o diagrama do RTL Viewer, foi obtido os seguintes resultados:

#figure(
  figure(
    image("sumary3digitos.png", width: 90%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Relatório de compilação para 3 dígitos], position: top)
)

#figure(
  figure(
    image("fmax3digitos.png", width: 90%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Tempo de Fmax para 3 dígitos], position: top)
)

#figure(
  figure(
    image("RTL3digitos.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viewer do contador de 3 dígitos], position: top)
)

== Contador para 6 dígitos
Para fazer a contagem de um número de 6 dígitos, basta alterar a variável genérica NUM_DIGITOS  para 6. Dessa forma o contador irá fazer a contagem de 000000 até 999999.

O código abaixo exemplifica as alterações feitas no arquivo principal.

#sourcecode[```tcl entity bcd_generico is
    generic (
        NUM_DIGITOS : positive := 6
    );```]


#figure(
  figure(
    image("sumary6digitos.png", width: 80%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Relatório de compilação para 6 dígitos], position: top)
)

#figure(
  figure(
    image("fmax6digitos.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Tempo de Fmax para 6 dígitos], position: top)
)

#figure(
  figure(
    image("RTL6digitos.png", width: 90%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viewer do contador de 6 dígitos], position: top)
)



== Tabela de comparação entre BCD de 3 e 6 dígitos

A Tabela 1 apresenta um resumo das principais características obtidas após a compilação dos dois circuitos BCD desenvolvidos. Esses dados foram extraídos diretamente do relatório de compilação do Quartus, com o objetivo de facilitar a análise comparativa quanto à utilização de recursos lógicos e temporização.

#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Parâmetros*],[*Circuito 1 (BCD com 3 dígitos)*], [*Circuito 2 (BCD com 6 dígitos)*],
      [Elementos lógicos], [16], [34],
      [Pinos], [15], [24],
      [Registers],[12], [27],
      [Fmax], [353,48 MHz], [284,01 MHz] 
    
    ),
    numbering: none,
    caption: [Tabela de resultados de compilação para o contador de 6 dígitos]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Nota-se que houve uma grande diferença principalmente na quantidade de flip-flops (registers) , elementos lógicos e no tempo de Fmax de ambos os projetos.


= Simulação funcional do circuito do contador BCD genérico
Para fazer a simulação funcional do circuito, foi utilizado um contador para N = 3 dígitos BCD. Além disso, foi feito a verificação de Overflow após 999. 

O código a seguir demonstra os comandos utilizados para a configuração do circuito:

#sourcecode[```cmd force clk 0
force reset 1
force enable 0
run 10 ns
force reset 0
force enable 1
force clk 0, 1 5 ns -repeat 10 ns
run 10000 ns```]

Uma vez configurado o compilador, foi feito a captura dos resultados obtidos. As figuras abaixo demonstram os detalhes da simulação que mostram as contagem das Unidades, Dezenas, Centenas e também o Overflow.


#figure(
  figure(
    image("contador3digitosinicial.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Varíaveis iniciais para a contagem de dígitos], position: top)
)

#figure(
  figure(
    image("contador3digitosresultados.png", width: 90%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Varíaveis finais para a contagem de dígitos], position: top)
)

#figure(
  figure(
    image("overflow3digitos.png", width: 80%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Overflow ], position: top)
)

Como nota-se na figura 9, a mudança de 999 para 000 novamente ocorreu exatamente em 10005 ns na linha de tempo do simulador. Além disso as figuras 7 e 8 mostram que o contador iniciou sua contagem em 000 e terminou em 999, o que confirma os resultados esperados para o contador.

=  Implemente o contador com o divisor de clock no kit
Para a implementação do circuito feito no Kit DE2-115 foi utilizado a família *Cyclone IV E* e Filter *EP4CE115F29C7*. 

#figure(
  figure(
    image("summarydevice.png", width: 82%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Device Family ], position: top)
)

Foi observado no que a família escolhida possui uma tensão de 1.2V de Core Voltage e 114480 de LEs.




== Restringindo a frequência máxima de Clock
Para restringir a frequência máxima de clock, foi utilizado um arquivo *.sdc* contendo o seguinte comando:

#sourcecode[```tcl create_clock -name CLK50MHz -period 50MHz [get_ports -no_case {clk*}]```]

Após fazer a compilação do código, foi obtido os seguintes resultados:

#figure(
  figure(
    image("sumario.png", width:100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário de compilação], position: top)
)

Uma vez verificado a quantidade de pinos e elementos lógicos do circuito, foi observado a frequência do Fmax do projeto:
#figure(
  figure(
    image("fmax.png", width:80%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Fmax do projeto], position: top)
)

A tabela abaixo faz uma relação com as principais informações presentes no circuito:


#figure(
  figure(
    table(
      align: auto,
      columns: 5,
      [*Compilação*],[*Fmax (MHz)*], [*Elementos lógicos*], [*Pinos*], [*Registers*],
      [Primeira compilação], [219,83], [30], [23], [20]
     
    ),
    numbering: none,
    caption: [Tabela de resultados de compilação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão
Conclui-se que a utilização de uma estrutura de projeto segmentada proporcionou resultados significativamente mais consistentes em comparação à abordagem com apenas um segmento. Os objetivos definidos no início do projeto foram plenamente alcançados, resultando na implementação bem-sucedida de um contador BCD genérico de 1 até N.