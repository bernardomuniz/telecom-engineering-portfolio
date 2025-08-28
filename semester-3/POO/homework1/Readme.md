[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/toeCyvWQ)

# Engenharia de Telecomunicações - Programação Orientada a Objetos
## Bernardo Souza Muniz - Lista de exercícios 1

### Como usar o repositório
Para clonar o repositório para a sua máquina local utilizando Git, basta executar o seguinte comando no seu terminal:

`git clone https://github.com/sergio-prolo-class/lista-1-BernardoMuniz39`


### Exemplo 1
O primeiro algoritmo tem o objetivo  de imprimir as formas geométricas triângulo, retângulo e losango. Para o triângulo e losango é possível imprimir formatos com determinado tamanho de altura e para o retângulo deve-se definir o tamanho da base e da altura.

Para a utilização correta do algoritmo, certifique-se de estar na raiz do projeto e digite o seguinte comando no terminal:

`cd exemplo1`

Após entrar dentro da pasta exemplo1, você pode executar o algoritmo com a tarefa `gradle run --args "<argumentos>"` e informar a figura e o tamanho desejado no lugar de argumentos. **Ambos os parâmetros são informados com letra minúscula, sem acento e separados por espaço**. Abaixo é exemplificado como executar cada figura do projeto:

**Triângulo:**

Para a forma de triângulo, basta executar o comando abaixo no terminal com a seguinte formatação:

`gradle run --args "triangulo <tamanho>`

No lugar de tamanho você pode colocar o número que desejar, como saída o algoritmo irá mostrar um triangulo retângulo com a altura informada. Por exemplo, ao digitar `gradle run --args "triangulo 5"` irá ser impresso um triângulo com altura 5.

**Losango:**

Para a forma de losango, basta executar o comando abaixo no terminal com a seguinte formatação:

`gradle run --args "losango <tamanho>`

No lugar de tamanho você pode colocar o número que desejar, como saída o algoritmo irá mostrar um losango com a altura total informada. Por exemplo, ao digitar `gradle run --args "losango 5"` irá ser impresso um losango com altura total 5.

**Retângulo:**

Para a forma de retângulo, basta executar o comando abaixo no terminal com a seguinte formatação:

`gradle run --args "retangulo <base> <altura>`

No lugar de base e altura você pode colocar o número que desejar, como saída o algoritmo irá mostrar um retângulo com a base e altura informada. Por exemplo, ao digitar `gradle run --args "retangulo 8 5"` irá ser impresso um retângulo com base 8 e altura 5.


### Exemplo 2
O segundo algoritmo tem o objetivo de mostrar a resistência em Ohms (Ω) de um resistor com base nas faixas impressas em seu corpo. As duas primeira faixas indicam os dois dígitos inciais do valor, a terceira o multiplicador, e a quarta faixa, que é opcional, indica a tolerância de resistência.

Para a utilização correta do algoritmo, certifique-se de estar na raiz do projeto e digite o seguinte comando no terminal:

`cd exemplo2`

Após entrar dentro da pasta exemplo2, você pode executar o algoritmo com a tarefa `gradle run --args "<argumentos>"` e informar o nome das cores presentes nas faixas do resistor no lugar de argumentos. **Todos os parâmetros são informados com letra minúscula, sem acento e separados por espaço**. Abaixo é exemplificado como funciona a formatação do comando:

`gradle run --args "<primeira faixa> <segunda faixa> <multiplicador> <tolerância>"`

Caso seu resistor não possua a faixa de tolerância, basta desconsiderar o último parâmetro do comando acima e informar somente até o multiplicador.

Se caso for informado alguma cor inválida ou na formatação incorreta, o programa informa a cor errada em questão e encerra o programa. Para executar novamente, basta utilizar a tarefa gradle run novamente na formatação correta.

Para verificar as cores válidas para serem informadas dentro do programa, consulte o link: [Tabela de cores resistor](https://static.wixstatic.com/media/767b08_494141490a1b4d83b7b942f8596bf9aa~mv2.png/v1/fill/w_288,h_515,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/Tabela%20de%20cores%20de%20resistores%204%20faixas.png)


### Exemplo 3
O terceiro exemplo tem o objetivo de gerar um tabuleiro de batalha naval (10x10) posicionando a frota de navios de forma aleatória. O tabuleiro é impresso utilizando a identificação e quantidade de navios no formato padrão do jogo. 

A tabela abaixo mostra os navios presentes no jogo Batalha Naval, bem como a quantidade e identificação de cada um:

<div align="center">

| Navio              | Tamanho (casas) | Símbolo |
|:------------------:|:---------------:|:-------:|
| Porta-aviões       |        5        |    P    |
| Encouraçado        |        4        |    E    |
| Cruzador           |        3        |    C    |
| Submarino          |        3        |    S    |
| Contratorpedeiro   |        2        |    N    |

</div>


Para a utilização correta do algoritmo, certifique-se de estar na raiz do projeto e digite o seguinte comando no terminal:

`cd exemplo3`

A impressão do tabuleiro não depende de argumentos e nem de formatação específica. Após entrar dentro da pasta "exemplo3", apenas digite o seguinte comando no terminal da sua máquina local:

`gradle run`

Como resultado, será impresso um tabuleiro no formato padrão do jogo Batalha Naval.

### Exemplo 4
O quarto e último algoritmo tem o objetivo de validar um tabuleiro de Batalha Naval. O programa recebe com redirecionamento de entrada um arquivo `txt` contendo um tabuleiro de Batalha Naval. Se caso o tabuleiro informado for válido, o programa vai imprimir "Tabuleiro válido", caso contrário, vai imprimir os motivos da não conformidade.

Um tabuleiro é inválido quando:
- Não possui a dimensão correta (10x10);
- Inclui navios que não estão dentro do padrão conhecido (P, E, C, S e N);
- Não inclui pelo menos um navio de cada tipo;
- Inclui mais do que a quantidade padrão de navios (P = 5, E = 4, C - 3, S = 3 e N = 2);
- Inclui navios insuficientes;
- Inclui navios que não estão na horizontal ou vertical;

Se caso o tabuleiro informado incluir pelo menos uma das não conformidades, ja é considerado inválido.


Para a utilização correta do algoritmo, certifique-se de estar na raiz do projeto e digite o seguinte comando no terminal:

`cd exemplo4`

Após entrar dentro da pasta exemplo4, você pode executar o algoritmo com a tarefa `gradle run < <arquivo.txt>` e informar o arquivo texto contendo o tabuleiro a ser validado no lugar de argumentos.

Dentro da pasta exemplo 4 você pode incluir o seu arquvo `.txt` ou então informar o caminho dele dentro da sua máquina. Abaixo é exemplificado os dois casos:

1) O arquivo texto está dentro da pasta "exemplo4":
`gradle run < arquivo.txt`

2) O arquivo está em outro lugar, como na pasta Documentos, por exemplo:
`gradle run < ~/Documentos/arquivo.txt`

Como sugestão, você pode utilizar os tabuleiros gerados no exemplo 3 para incluir no seu arquivo de entrada.



