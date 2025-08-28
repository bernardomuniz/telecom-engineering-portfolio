# Como programar testes para sua biblioteca

A biblioteca _libprg_ será construída de forma a fornecer algumas estruturas de dados, incluindo suas operações e algoritmos essenciais. À medida que for sendo desenvolvida, é importante que o softweare possa ser testado e validado. Com isso, você saberá que sua implementação (provavelmente) está correta.

Os testes podem ser criados usando a [biblioteca munit](https://nemequ.github.io/munit/), a qual está incluída aqui neste repositório (veja em _tests/CMakeLists.txt_). Você pode tanto usá-la diretamente, com base em sua documentação, quanto por meio de alguns atalhos criados especificamente para este projeto. A seguir você pode ler uma explicação sobre como usá-la de forma mais simplificada. Para explorá-la com todos seus recursos, consulte sua [documentação](https://nemequ.github.io/munit/).

**Sumário**:
* [Testes de unidade](#testes-de-unidade)
* [Adicionando testes ao projeto](#adicionando-testes-ao-seu-projeto-da-libprg)
* [Testes com a biblioteca munit simplificada](#testes-com-a-biblioteca-munit-simplificada)
  * [Macros _assert_](#macros-assert)
  * [Suites de testes e executando testes](#suites-de-testes)
  * [Exemplo](#exemplo)

## Testes de unidade

Um teste de unidade verifica a menor unidade funcional do seu código. Em programas feitos usando a linguagem C, a menor unidade funcional é tipicamente uma função. Sendo assim, os testes de unidade possibilitam validar as funções que você criou em seu software.

Cada teste deve verificar se uma função funciona corretamente em determinada situação representativa. Por exemplo, se você escrever uma função que [limpa os espaços em excesso de uma string](https://moodle.ifsc.edu.br/mod/vpl/view.php?id=97022), os testes devem verificar o seguinte:
* Se no caso de uma string vazia, a função nada faz
* Se no caso de uma string que contenha somente espaços, ela resulta em uma string vazia
* Se a string não contiver espaços em excesso, a função não a modifica
* Se a string tiver espaços no início, a função os remove como esperado
* Se a string tiver espaços no final, a função os remove como esperado
* Se a string tiver espaços em excesso entre palavras, a função os converte para apenas um espaço entre cada par de palavras

Para cada uma dessas verificações, um teste específico pode ser criado. Assim, a validação da sua função pode ser feita com a execução desses testes.

## Adicionando testes ao seu projeto da libprg

Os testes da biblioteca libprg devem ser adicionados à pasta _tests_. A estrutura dessa pasta inicialmente é esta:

```bash
tests
|-- CMakeLists.txt
|-- testes.h
|-- demo_test.c
```

Cada conjunto de testes deve ficar em um arquivo _.c_ específico. Assim, você pode criar seus testes para cada estrutura de dados ou algoritmo, e depois executá-los. No exemplo, o arquivo demo_test.c mostra como alguns testes podem ser criados (ver mais detalhes nas próximas seções). Com isso, testes poderão ser executados de forma independente, para que você consiga verificar o progresso de sua implementação da _libprg_.

Ao adicionar um novo conjunto de testes, você deve acrescentar o seguinte a ao arquivo _tests/CMakeLists.txt_:

```cmake
add_executable(nome_do_teste arquivo_que_implementa_o_teste.c)
target_link_libraries(nome_do_teste munit libprg)
```

Em seguida, recarregue o arquivo _CMakeLists.txt_ da raiz do projeto. Se estiver usando o CLion, você verá que uma nova configuração de execução com o nome do seu novo teste.

## Testes com a biblioteca munit simplificada

Na biblioteca munit, cada teste é implementado por meio de uma função. Essa função deve encapsular um algoritmo que realiza o teste desejado, e para isso algumas macros auxiliares da biblioteca munit devem ser utilizadas. Ao final, a função de teste deve retornar um valor que indica sucesso ou falha.

Antes de definir seus testes, seu programa de teste deve incluir o arquivo _testes.h_:

```c
#include "testes.h"
```

A função de teste mais simples que se pode criar é esta, que define um teste que dá sempre certo:

```c
define_test(nome_do_teste) {
  return MUNIT_OK;
}
```

A função de teste deve ser definida com a macro _define_test_, passando como parâmetro um nome de teste à sua escolha. Essa macro apenas define uma função de teste conforme exigido pela biblioteca munit, ocultando detalhes tais como parâmetros e tipo de dados do resultado, os quais não são relevantes nessa forma simplificada de uso dessa biblioteca.

O teste definido acima nada faz, pois ele apenas retorna o valor MUNIT_OK, que significa que o teste deu certo. Outros possíveis valores a retornar são:
* **MUNIT_FAIL**: o teste falhou
* **MUNIT_SKIP**: o teste foi ignorado por alguma razão (a seu critério), e não será contabilizado como sucesso ou falha
* **MUNIT_ERROR**: ocorreu um erro no código do próprio teste, e não na função que ele deveria testar. Por exemplo, imagine que o teste precise baixar um arquivo da rede, mas não conseguiu conectar no servidor. Nesse caso, o problema não foi na função a ser testada, e sim no teste.

As verificações que sua função de teste deve realizar devem explorar um conjunto de macros disponibilizadas pela biblioteca munit. Essas macros, com prefixo *assert_*, possibilitam verificar valores de diferentes tipos, tais como inteiros, float, char, string, ponteiros, entre outras coisas. Por exemplo, imagine que sua função de teste queira conferir se uma função de soma fornece o resultado correto:

```c
define_test(teste_soma) {
    int z = soma(1, 1);
    
    assert_int(z, ==, 2);
  
    return MUNIT_OK;
}
```

A macro _assert_int_ faz uma comparação entre dois números inteiros. No caso, a comparação a ser feita é de igualdade. Se a verificação estiver correta, a macro nada faz. Mas, se estiver errada, ela causa o retorno da função de teste com resultado MUNIT_FAIL, além de mostrar uma breve explicação sobre a falha. Por exemplo, imagine que a função de _soma_ fosse esta:

```c
int soma(int x, int y) {
  return x - y;
}
```

Se o teste com essa função _soma_ fosse realizado, o resultado seria este:

```bash
teste_soma                   [ ERROR ]
Error: /home/msobral/CLionProjects/libprg/demo_test.c:25: assertion failed: z == 2 (0 == 2)
Error: child killed by signal 6 (Aborted)
```

### Macros assert

As macros que comparam valores de um tipo de dados têm este formato:

```c
assert_tipo(val1, op_comparacao, val2)
```

... sendo _val1_ e _val2_ valores do _tipo_, e _op_comparação_ um operador de comparação binária (==, !=, <, <=, >, >=). Por exemplo, para comparar se dois números inteiros são iguais, a macro _assert_int_ deve ser usada:

```c
assert_int(2, ==, 2)
```

As macros *assert_tipo* da biblioteca munit são estas (substitua _tipo_ por um dos tipos a seguir):
* char
* unsigned char ("uchar")
* short
* unsigned short ("ushort")
* int
* unsigned int ("uint")
* long int ("long")
* unsigned long int ("ulong")
* long long int ("llong")
* unsigned long long int ("ullong")
* size_t ("size")
* float
* double
* void* ("ptr")

Adicionalmente, a biblioteca disponibiliza algumas macros _assert_ mais especializadas:

```c 
assert_double_equal(double a, double b, int precision)
```
Verifica que dois números double sejam iguais com tolerância de 1.0×10^precision. Por exemplo, 3.141592654 e 3.141592653589793 são considerados iguais com precisão 9, mas nçao com precisão 10.

```c
assert_string_equal(const char* a, const char* b)
```
Verifica se duas strings são equivalentes (i.e., strcmp(a,b) == 0, e não a == b).

```c
assert_string_not_equal(const char* a, const char* b)
```
Como assert_string_equal, mas confere se não são equivalentes

```c
assert_memory_equal(size_t size, const void* a, const void* b)
```
Confere se dois blocos de memória contêm os mesmos dados. Caso falhe, a mensagem de erro informa a posição do primeiro byte divergente.

```c
assert_memory_not_equal(size_t size, const void* a, const void* b)
```
Confere se dois blocos de memória não contêm os mesmos dados.

```c
assert_ptr_equal(void* a, void* b)
```
Outra forma de escrever _assert_ptr(a, ==, b)_

```c
assert_ptr_not_equal(void* a, void* b)
```
Outra forma de escrever _assert_ptr(a, !=, b)_

```c
assert_null(const void* ptr)
```
Outra forma de escrever _assert_ptr(ptr, ==, NULL)_

```c
assert_not_null(const void* ptr)
```
Outra forma de escrever _assert_ptr(ptr, !=, NULL)_

```c
assert_true(bool value)
```
Verifica se o valor booleano é VERDADEIRO

```c
assert_false(bool value)
```
Verifica se o valor booleano é FALSO

### Suites de testes

Os testes devem ser reunidos em um conjunto (ou suite) de testes. Isso facilita muito sua execução e apresentação de resultados. Para criar uma suite, você deve usar a macro _create_suite_ desta forma:

```c
create_suite(nome_var, nome_suite, numero_de_testes, teste1, teste2, ...);
```

Os parâmetros de _create_suite_ são:
* _suite_var_: o nome de uma variável que representa a suite. Essa variável será criada pela própria macro, então não se preocupe em declará-la, nem com qual é seu tipo.
* _nome_suite_: um nome que deve ser dado a essa suite. Esse nome será mostrado no relatório de execução dos testes.
* _numero_de_testes_: a quantidade testes que compõem esta suite
* _teste1, teste2, ...._: as funções de teste que foram criadas previamente. A quantidade de funções de teste deve ser igual ao parâmetro _numero_de_testes_.

Ex: para criar uma suite que contém apenas um teste, deve-se fazer assim:

```c
create_suite(suite_soma, Soma, 1, teste_soma);
```

Por fim, para executar os testes, basta usar a macro _exec_tests_. Essa macro tem como parâmetro a variável que representa a suite (o nome que você deu para _suite_var_):

```c
int main(int argc, char* argv[]) {
    exec_tests(suite_soma);
}
```

### Exemplo

Para ver um exemplo completo, leia o arquivo [demo_test.c](tests/demo_test.c) !
