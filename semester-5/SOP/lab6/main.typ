#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Coordenação de tarefas",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz.",),
  date: "08 de Maio de 2026",
  doc,
)

= Introdução
Este trabalho tem como objetivo apresentar a resolução dos problemas relacionados à condição de corrida (_Race Condition_) entre tarefas, abordados na disciplina de Sistemas Operacionais.
\
\
Foi disponibilizado o seguinte código para a implementação dos algoritmos de Alternância de Uso, Algoritmo de Peterson e TSL (_Test-and-Set Lock_).

#sourcecode[```c
int saldo = 100;
void* depositar(void* arg) {
    int valor = *(int*)arg;
    int temp = saldo;
    usleep(100);
    temp += valor; 
    saldo = temp; 
return NULL;
}
int main() {
    pthread_t t1, t2;
    int v1 = 50, v2 = 30;
    pthread_create(&t1, NULL, depositar, &v1);
    pthread_create(&t2, NULL, depositar, &v2);
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido: %d\n", saldo);
return 0;
}

```]

Ao executar o código, é possível verificar uma incoerência nos resultados obtidos, visto que o saldo inicial da conta é de 100 reais e são realizados dois depósitos, de 50 e 30 reais, respectivamente. Assim, o valor esperado ao final da execução seria de 180 reais. Entretanto, observa-se que o saldo final varia entre 130 e 150 reais, evidenciando um problema de condição de corrida.

#figure(
  figure(
    rect(image("algoritmo,png.png", width:70%)),
    numbering: none,
    caption: [Execução do algoritmo apresentado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Isso ocorre devido à condição de corrida entre as tarefas, na qual mais de uma thread manipula simultaneamente um recurso compartilhado, tornando o resultado final imprevisível. O objetivo da implementação dos algoritmos é eliminar a condição de corrida, garantindo o resultado correto da operação.

= Alternância de Uso
Ao realizar a implementação do algoritmo de alternância de uso, foi obtido o seguinte resultado:

#sourcecode[```c
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int saldo = 100;
int num_tasks = 2;
int turn = 0; 

void enter(int task) {
    while (turn != task){
    }
}

void leave(){
    turn = (turn + 1) % num_tasks; 
}

void* depositar(void* arg) {
    int task_id = *(int*)arg;
    int valor = (task_id == 0) ? 50 : 30;

    enter(task_id);
    int temp = saldo; 
    usleep(100);
    temp += valor;
    saldo = temp; 

    leave(task_id);
    return NULL;
}

int main() {
    pthread_t t1, t2;
    int index_t1 = 0, index_t2 = 1; 

    pthread_create(&t1, NULL, depositar, &index_t1);
    pthread_create(&t2, NULL, depositar, &index_t2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido: %d\n", saldo);

    return 0;
}

```]

#pagebreak()

Ao executar o programa mais de uma vez foi possível verificar que a condição de corrida foi sanada:

#figure(
  figure(
    rect(image("Screenshot_5.png", width:90%)),
    numbering: none,
    caption: [Execução do algoritmo de Alternância de uso]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()

= Algoritmo de Peterson
Ao realizar a implementação do algoritmo de Peterson, foi obtido o seguinte resultado:

#sourcecode[```c
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int turn = 0;
int wants[2] = {0, 0};
int saldo = 100;

void enter(int task) { 
    int other = 1 - task;
    wants[task] = 1;
    turn = other;
    while ((turn == other) && wants[other]) {
    }
}

void leave(int task) {
    wants[task] = 0;
}

void* depositar(void* arg) {
    int task_id = *(int*)arg;
    int valor = (task_id == 0) ? 50 : 30;
    enter(task_id);

    int temp = saldo; 
    usleep(100);
    temp += valor;
    saldo = temp;
    leave(task_id);

    return NULL;
}
int main() {
    pthread_t t1, t2;
    int v1 = 50, v2 = 30;
    int id_task1 = 0 , id_task2 = 1;

    pthread_create(&t1, NULL, depositar, &id_task1);
    pthread_create(&t2, NULL, depositar, &id_task2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido: %d\n", saldo);
    return 0;
}


```]
#pagebreak()
Ao executar o programa mais de uma vez foi possível verificar que a condição de corrida foi sanada:

#figure(
  figure(
    rect(image("Screenshot_6.png", width:90%)),
    numbering: none,
    caption: [Execução do algoritmo de Peteron]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#pagebreak()
= TSL
Ao realizar a implementação do algoritmo de TSL, foi obtido o seguinte resultado:

#sourcecode[```c

#include <stdio.h>
#include <pthread.h>
#include <unistd.h>


int saldo = 100;
int lock = 0; // vari´avel de trava

void enter(int *lock){ // passa o endere¸co da trava
    while (__sync_lock_test_and_set(lock,1)) {
    // espera ocupada sobre a trava
    }
}

void leave(int *lock) {
    *lock = 0; // libera a se¸c~ao cr´ıtica
}

void* depositar(void* arg) {
    int task_id = *(int*)arg;
    int valor = (task_id == 0) ? 50 : 30;
    enter(&lock);

    int temp = saldo; 
    usleep(100);
    temp += valor; // Passo 2: Soma
    saldo = temp; // Passo 3: Escrita
    leave(&lock);
    return NULL;
}

int main() {
    pthread_t t1, t2;
    int index_t1 = 0, index_t2 = 1;

    pthread_create(&t1, NULL, depositar, &index_t1);
    pthread_create(&t2, NULL, depositar, &index_t2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido: %d\n", saldo);
    return 0;
}
```]
#pagebreak()
Ao executar o programa mais de uma vez foi possível verificar que a condição de corrida foi sanada:

#figure(
  figure(
    rect(image("Screenshot_7.png", width:90%)),
    numbering: none,
    caption: [Execução do algoritmo de TSL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão
A implementação dos algoritmos de sincronização, como Alternância de Uso, Peterson e TSL (Test-and-Set Lock), verificou-se a importância do controle de acesso à região crítica, garantindo que apenas uma thread manipule o recurso compartilhado por vez. Dessa forma, foi possível garantir o valor correto dos dados e alcançar o objetivo proposto.