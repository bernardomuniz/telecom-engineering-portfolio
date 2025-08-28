#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Contadores Genéricos para 18 bits",
  subtitle: "Eletrônica Digital II",
  authors: ("Bernardo Souza Muniz",),
  date: "9 de Junho de 2025",
  doc,
)

= Introdução

O objetivo deste documento é apresentar 5 versões de contadores em *_VHDL (VHSIC Hardware Description Language)_* que realiza a contagem genérica para 18 bits. Todos os códigos foram estruturados em dois segmentos: um de lógica sequencial e outro de lógica combinacional. Além do desenvolvimento do código, são apresentados dados de verificação de desempenho, como a frequência máxima (Fmax), número de pinos utilizados e quantidade de elementos lógicos consumidos. A plataforma de desenvolvimento utilizada foi o Quartus Prime e a simulação foi realizada com o ModelSim.

= Configurações do projeto
Os 5 contadores binários foram implementados contendo uma variável genérica presente na entidade do projeto que controla as variáveis de saída para terem 18 bits. Dessa forma, é possível contar de 0 zero até 262144 seguindo a seguinte lógica:

$
2^18 - 1 = 262144
$

Todos os contadores foram projetos em dois segmentos, contendo a parte sequencial (State Register) e a parte combinacional (Next State). Além disso, foi implementado em cada contador um sinal de enable para iniciar a contagem de bits.

\

As configurações relacionadas a família de FPGA's e código são semelhantes para todos os contadores. Foi utilizado o dispositivo FPGA da família *Cyclone IV E* com código *EP4CE6E22A7*. A figura 1 mostra alguns parâmetros relacionados ao dispositivo escolhido.

#figure(
  figure(
    image("devicefamily.png", width: 107%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Device Family], position: top)
)

Nota-se que o dispositivo em questão possui um *Core Voltage de 1.2V* e *6272 elementos lógicos configuráveis (LEs)*.



Além disso, com o objetivo de melhorar a frequência do Fmax para cada contador, foi utilizado um arquivo *.sdc* contendo a seguinte configuração:

#sourcecode[```sdc   create_clock -name CLK50MHz -period 50MHz [get_ports -no_case {clk*}]```]

O comando busca restringir a frequência máxima de clock, melhorando o desempenho do circuito.
\
\
A simulação para todos os contadores possui um arquivo com a extensão *.do* que tem o mesmo nome da entidade de cada circuito.
\



= Contador binário sequencial
O contador binário sequencial genérico faz a contagem binária usual para 18 bits, fazendo o incremento do valor binário automaticamente a cada pulso de clock. 
\

O código abaixo demonstra a declaração da entidade contendo a variável natural N que controla a quantidade de bits da saída para 18.

#sourcecode[```tcl entity contador_binario is
  generic(
  		N : natural := 18
  		);
  port(
  	clk,rst,enable: std_logic;
  	c_out: out std_logic_vector(N-1 downto 0)
  );
  end entity;```]

Foi utilizado um código de dois segmentos, contendo a parte combinacional e a parte sequencial, além de um sinal de enable para início da contagem. Os dois códigos abaixo contém a State Register e o Next State, respectivamente.


#sourcecode[```tcl l1: process(clk, rst)
  	begin
  		if(rst = '1') then
  			c_reg <= (others => '0');
  		elsif rising_edge(clk) then
  			c_reg <= c_next;
  		end if;
  	end process;```]

 #sourcecode[```tcl l2: process(c_reg, enable)
		  begin
			c_next <= c_reg;
			
			if (enable = '1') then
				  c_next <= c_reg + 1;
			  end if;
		   end process;```]

\
O funcionamento do contador ocorre em duas etapas: o registrador de estado (State Register) atualiza o valor da contagem com base no próximo estado (`c_next`) a cada borda de subida do clock, desde que o sinal de `rst` esteja desativado. A lógica combinacional, por sua vez, define o valor de `c_next` com base no valor atual (`c_reg`) e no sinal `enable`, que permite o incremento apenas quando estiver em nível lógico alto. Dessa forma, o contador permanece estático enquanto `enable = '0'` e só conta quando `enable = '1'`.
\
\

Uma vez compilado o projeto, foram feitas as devidas simulações no ModelSim com o intuito de verificar os resultados obtidos pelo contador. Foi feita a contagem até 1000 para demonstrar a eficiência do contador e a quantidade de bits de saída.

#figure(
  figure(
    image("contadorbinario/RTLsimucb.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação inicial do contador binário], position: top)
)

#figure(
  figure(
    image("contadorbinario/RTLcb1000.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem até o número 1000], position: top)
)

Nota-se que na figura 3 o contador chegou até o número 1111101000, 1000 em binário, comprovando o que se esperava do circuito.
\
\

As próximas figuras registram a análise feita dos parâmetros característicos do circuito, contendo tempo de Fmax, diagrama do RTL Viwer e número de elementos lógicos.
\
\
#figure(
  figure(
    image("contadorbinario/RTLviwercb.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viwer contador binário], position: top)
)

#figure(
  figure(
    image("contadorbinario/Sumariocb.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário contendo a quantidade de elementos lógicos do contador binário], position: top)
)
\
#figure(
  figure(
    image("contadorbinario/FMAXcb.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([FMAX do contador binário], position: top)
)
= Contador Gray
De maneira análoga ao contador binário sequencial, o contador gray faz a contagem genérica para 18 bits, porém em código Gray. Desta forma, ao fazer a contagem, a cada incremento apenas um bit é modificado, diferentemente da contagem binária aonde vários bits podem alterar com o incremento de um.

No contador, foi utilizada a lógica de conversão de binário pra gray, onde se utiliza uma operação lógica *_xor_* para calcular o próximo bit. Tal relação é dada abaixo:

$
  b_3 = g_3 ⊕ 0\
  b_2 = g_2 ⊕ b_3\
  b_3 = g_1 ⊕ b_2\
  b_3 = g_0 ⊕ b_1\
$


O código abaixo demonstra a declaração da entidade contendo a variável natural N que controla a quantidade de bits da saída para 18.
\
\
 
#sourcecode[```tcl entity contador_gray is
generic(
		N : natural := 18
	);
   port(
      clk, reset, enable: in std_logic;
      gray_out: out std_logic_vector(N - 1 downto 0)
   );
end entity;
```]

Foi utilizado um código de dois segmentos, contendo a parte combinacional e a parte sequencial, além de um sinal de enable para início da contagem. Os dois códigos abaixo contém a State Register e o Next State, respectivamente.

#sourcecode[```tcl process(clk,reset)
   begin
      if (reset='1') then
         g_reg <= (others=>'0');
      elsif rising_edge(clk) then
         g_reg <= g_next;
      end if;
   end process;```]

#sourcecode[```tcl process(enable, g_reg)
		variable b, b1: unsigned(N-1 downto 0);
	begin
		g_next <= g_reg;
		if enable = '1' then
			b := g_reg xor ('0' & g_reg(N-1 downto 1));
			b1 := b+1;
			g_next <= b1 xor ('0' & b1(N-1 downto 1));
		end if;
	end process;```]


 
O State Register atualiza o valor da contagem com base no próximo estado (`g_next`) a cada borda de subida do clock desde que o sinal de `reset` esteja desativado. Na lógica combinacional, foram utilizadas duas variáveis dentro do process do Next State `b` e `b1` para auxiliar na contagem do próximo bit apenas quando o sinal `enable` estiver em nível lógico alto, caso contrário, as variável `g_next` apenas recebe `g_reg`.

Uma vez compilado o projeto, foram feitas as devidas simulações no ModelSim com o intuito de verificar os resultados obtidos pelo contador. 

#figure(
  figure(
    image("contadorgray/RTLcg.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação inicial do contador gray], position: top)
)

#figure(
  figure(
    image("contadorgray/RTL1000cg.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem até o número 1000], position: top)
)

As próximas figuras registram a análise feita dos parâmetros característicos do circuito, contendo tempo de Fmax, diagrama do RTL Viwer e número de elementos lógicos.

\

#figure(
  figure(
    image("contadorgray/RTLVIWERcg.png", width: 90%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viwer do contador gray], position: top)
)
#figure(
  figure(
    image("contadorgray/Sumariocg.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário contendo a quantidade de elementos lógicos do contador gray ], position: top)
)
#figure(
  figure(
    image("contadorgray/FMAXcg.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([FMAX do contador gray], position: top)
)

= Contador em anel
O contador em anel genérico para 18 bits faz o deslocamento de bits a cada pulso de clock. 

O código abaixo demonstra a declaração da entidade contendo a variável natural N que controla a quantidade de bits da saída para 18.

#sourcecode[```tcl entity contador_anel is
generic(
		N : natural := 18
		);
port(
	clk,rst,enable: std_logic;
	ring_out: out std_logic_vector(N-1 downto 0)
);
end entity;```]

Foi utilizado um código de dois segmentos, contendo a parte combinacional e a parte sequencial, além de um sinal de enable para início da contagem. Os dois códigos abaixo contém a State Register e o Next State, respectivamente.
\
\
\
Nota-se que quando o sinal de reset está alto, apenas o último bit fica com sinal 1 e o resto fica zero, para que assim seja iniciado a contagem.
#sourcecode[```tcl l1: process(clk, rst)
	begin
		if(rst = '1') then
			ring_reg <= (0 => '1', others => '0');
		elsif rising_edge(clk) then
			ring_reg <= ring_next;
		end if;
	end process;```]


#sourcecode[```tcl l2: process(enable, ring_reg)
		begin
			ring_next <= ring_reg;
			if enable = '1' then
				 ring_next <= ring_reg(0) & ring_reg(N-1 downto 1);
			end if;
		end process;```]

O State Register atualiza o valor da contagem com base no próximo estado (`ring_next`) a cada borda de subida do clock desde que o sinal de `rst` esteja desativado. Na lógica combinacional, foram utilizadas dois sinais que fazem a mudança de bits apenas quando o sinal `enable` estiver em nível lógico alto, caso contrário, as variável `ring_next` apenas recebe `ring_reg`.

Uma vez compilado o projeto, foram feitas as devidas simulações no ModelSim com o intuito de verificar os resultados obtidos pelo contador. 

#figure(
  figure(
    image("contadoranel/RTLring.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do contador em anel], position: top)
)

Nota-se que o contador com 18 bits segue a mesma lógica de sequência que um contador com 4 bits, por exemplo:
#sourcecode[```0001 -> 1000 -> 0100 -> 0010 -> 0001 -> 1000 -> 0100 -> ... -> (repete)```]

#figure(
  figure(
    image("contadoranel/RTL1000ring.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do contador em anel com repetição], position: top)
)

Na figura 13 foi registrado a repetição do contador em anel para 18 bits, onde o contador naturalmente volta para o seu estado original de 100000000000000000 para reiniciar a contagem, fazendo a mudança dos próximos bits

As próximas figuras registram a análise feita dos parâmetros característicos do circuito, contendo tempo de Fmax, diagrama do RTL Viwer e número de elementos lógicos.

#figure(
  figure(
    image("contadoranel/RTLVIWERring.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viwer do contador em anel], position: top)
)
\

#figure(
  figure(
    image("contadoranel/sumarioring.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário contendo a quantidade de elementos lógicos do contador em anel], position: top)
)
\
#figure(
  figure(
    image("contadoranel/Fmaxring.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([FMAX do contador em anel], position: top)
)

= Contador Johnson
Semelhante ao contador em anel, o contador Johnson para 18 bits faz o uso de um inversor na realimentação do contador em anel.

O código abaixo demonstra a declaração da entidade contendo a variável natural N que controla a quantidade de bits da saída para 18.

#sourcecode[```tcl entity contador_johnson is
generic(
		N : natural := 18
		);
port(
	clk,rst,enable: std_logic;
	ring_out: out std_logic_vector(N-1 downto 0)
);
end entity;
```]
Foi utilizado um código de dois segmentos, contendo a parte combinacional e a parte sequencial, além de um sinal de enable para início da contagem. Os dois códigos abaixo contém a State Register e o Next State, respectivamente.

#sourcecode[```tcl l1: process(clk, rst)
	begin
		if(rst = '1') then
			ring_reg <= (0 => '1', others => '0');
		elsif rising_edge(clk) then
			ring_reg <= ring_next;
		end if;
	end process;```]

 #sourcecode[```tcl l2: process(enable, ring_reg)
		begin
			ring_next <= ring_reg;
			if enable = '1' then
				 ring_next <= (not ring_reg(0)) & ring_reg(N-1 downto 1);
			end if;
		end process;```]
Nota-se a inversão na realimentação com o uso do *`not`* para atualizar o contador.

Uma vez compilado o projeto, foram feitas as devidas simulações no ModelSim com o intuito de verificar os resultados obtidos pelo contador. 

#figure(
  figure(
    image("contadorjohnson/RTLjohnson.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do contador em Johnson], position: top)
)

Nota-se que o contador Johnson com 18 bits segue a mesma lógica de sequência que um contador com 4 bits, por exemplo:
#sourcecode[```0001 -> 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 -> ... -> (repete)```]
\
#figure(
  figure(
    image("contadorjohnson/RTLjohson1000.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do contador Johnson com repetição], position: top)
)

Na figura 18  foi registrado a repetição do contador em Johnson para 18 bits, onde o contador estoura a quantidade de bits com '1' e volta para completar com zeros, reiniciando novamnte o ciclo.
\
\

As próximas figuras registram a análise feita dos parâmetros característicos do circuito, contendo tempo de Fmax, diagrama do RTL Viwer e número de elementos lógicos.
\
\

#figure(
  figure(
    image("contadorjohnson/RTLVIWERJhonson.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viwer do contador Johnson], position: top)
)
\

#figure(
  figure(
    image("contadorjohnson/SumarioJohnson.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário contendo a quantidade de elementos lógicos do contador Johnson], position: top)
)
\
sim:/timer_seg/SSD_UNIDADE



= Contador LFSR
O contador LFSR (Linear-feedback shift register) foi projetado para gerar números aleatórios.

Para isso, foi utilizado um polinômio primitivo para 18 bits com o seguinte formato:

$
  x^18 + x^11 + 1
$

Além disso, foi utilizado um Tap correspondente com o polinômio utilizado no formato:
$
100000010000000000
$

O código abaixo demonstra a declaração da entidade contendo a variável natural N que controla a quantidade de bits da saída para 18.

#sourcecode[```tcl entity contador_lfsr is
generic(
		N	: natural := 18
    );
   port(
      clk, reset, enable: in std_logic;
      lfsr_out: out std_logic_vector(N-1 downto 0)
   );
end entity;```]

Foi utilizado um código de dois segmentos, contendo a parte combinacional e a parte sequencial, além de um sinal de enable para início da contagem. Os dois códigos abaixo contém a State Register e o Next State, respectivamente.
\
#sourcecode[```tcl   l1: process(clk,reset)
	begin
      if (reset='1') then
         r_reg <= SEED;
      elsif rising_edge(clk) then
         r_reg <= r_next;
      end if;
   end process;```]

Dentro da arquitetura do contador, foi utilizado uma constante *`SEED`* que utiliza o valor do Tap referente ao polinômio primitivo para 18 bits:

#sourcecode[```tcl constant SEED: std_logic_vector(N-1 downto 0):= "100000010000000000";```]

#sourcecode[```tcl l2: process(enable, r_reg)
		   variable fb: std_logic;
	   begin
			r_next <= r_reg;
			if enable = '1' then
				 fb := r_reg(N-1) xor r_reg(10);
				 r_next <= fb & r_reg(N-1 downto 1);
			end if;
	end process;```]
 Neste caso quando o reset é ativado, temos que `r_reg <= SEED` e dentro do process temos que `fb := r_reg(N-1) xor r_reg(10)`, fazendo a lógica inicial de `fb := '0' xor '1' = '1'`, onde o feedback fica com valor inicial 1 e da início ao contador.

\
Uma vez compilado o projeto, foram feitas as devidas simulações no ModelSim com o intuito de verificar os resultados obtidos pelo contador. 
\
\

#figure(
  figure(
    image("contadorlfsr/RTLlfsr2.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do LFSR], position: top)
)

#figure(
  figure(
    image("contadorlfsr/RTLlfsr.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Simulação de contagem do LFSR - Visualização dos bits de saída], position: top)
)

As próximas figuras registram a análise feita dos parâmetros característicos do circuito, contendo tempo de Fmax, diagrama do RTL Viwer e número de elementos lógicos.
\
\
#figure(
  figure(
    image("contadorlfsr/RTLVIWERlfsr.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([RTL Viwer do contador LFSR], position: top)
)
\
#figure(
  figure(
    image("contadorlfsr/SumarioLFSR.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([Sumário do contador LFSR], position: top)
)

#figure(
  figure(
    image("contadorlfsr/FMAXlfsr.png", width: 100%),
    numbering: none,
    caption: [Fonte: Elaborado pelo autor]
  ),
  caption: figure.caption([FMAX do contador LFSR], position: top)
)

 
= Tabela de comparação de resultados
Para fins de comparação de resultados, foi montado uma tabela contendo as principais informações técnicas de cada contador. 

#figure(
  figure(
    table(
      align: auto,
      columns: 6,
      [*Parâmetros*],[*Contador Binário*], [*Contador Gray*], [*Contador em anel*], [*Contador Johnson*], [*Contador LFSR*],
      [Elementos lógicos], [18], [36],[18], [18], [18],
      [Pinos], [21], [21], [21],[21], [21],
      [Registers],[10], [18],[18], [18], [18],
      [Fmax (MHz)], [344,35 ], [210,30], [352,73], [352,73], [411,18] 
    ),
    numbering: none,
    caption: [Tabela de resultados de compilação para os 5 contadores]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão
Após a implementação dos 5 contadores BCD para 18 bits, foi possível concluir que a utilização de cada contador tem uma funcionalidade específica para cada cenário de uso. Nota-se que a utilização de tais circuitos podem estar presentes em diversas partes de indústrias e empresas, sendo possível fazer a reutilização para diferentes tipos de projetos. Algumas das implementações possíveis que foram  notadas são: timer, sorteador de números, contagens em displays de 7 segmentos e etc.

Os objetivos definidos no início do projeto foram alcançados, resultando na implementação bem-sucedida dos contadores genéricos para 18 bits.
