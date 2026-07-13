#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Coordenação de tarefas - Parte 2",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz.",),
  date: "08 de Maio de 2026",
  doc,
)

= Questão 1
Para a realização da questão 1, foi utilizado as implementações explícitas de Mutex e Semáforo através do pacote `java.util.concurrent`.

== Implementação do Semáforo
Foi escolhido a implementação do exemplo do estacionamento em Java. Neste caso, foi utilizado a classe `Semaphore` e definido a quantidade de vagas disponíveis para entrada e saída de carros.
\
\
O resultado obtido está presente no código abaixo:

#sourcecode[```Java
package ex1.semaforo;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class Semaforo {
    public static final int TOTAL_VAGAS = 5;
    public static final int TOTAL_CARROS = 10;

    private static final Semaphore semaforo = new Semaphore(TOTAL_VAGAS);
    private static final Random r = new Random();

    static void entrar_no_estacionamento(int arg){
        System.out.println("Carro " + arg + " chegou e está procurando vaga...");
        
        try{
            semaforo.acquire(); //Se não houver vaga, bloqueia 

            System.out.println("--> Carro " + arg + " ENTROU.");

            Thread.sleep(5000 + (r.nextInt(3000)));
            
        }catch (InterruptedException e){
            Thread.currentThread().interrupt();
            
        }finally{
            System.out.println("<-- Carro " + arg + " SAIU. Liberando vaga...");
            semaforo.release();
        }

    }
    public static void main(String[] args) {
         Thread[] threads = new Thread[TOTAL_CARROS];
        
        for (int i = 0; i < TOTAL_CARROS; i++) {
            int id = i + 1;
            threads[i] = new Thread(() -> entrar_no_estacionamento(id));
            try {
                Thread.sleep(600); 
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            threads[i].start();
            
        }

        for (int i = 0; i < TOTAL_CARROS; i++) {
            try {
                threads[i].join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }

        System.out.println("\nEstacionamento encerrado.\n");
    }

}

```]

Ao realizar a execução do código, foi possível observar que a premissa do semáforo foi bem executada, uma vez que a ordem de chegada de cada carro e o tempo de espera é feita de maneira síncrona, sem o ocasionamento de um carro estacionar em uma vaga que está ocupada:

#figure(
  figure(
    rect(image("semaforo.png", width:97%)),
    numbering: none,
    caption: [Execução do algoritmo de Semáforo implementando a versão em Java]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()


== Implementação do Mutex

Para implementação do Mutex em Java, foi escolhido o exemplo do contador.

#sourcecode[```Java
package ex1.mutex;
import java.util.concurrent.locks.ReentrantLock;

public class Mutex{
    public static final int NUM_THREADS = 100;
    public static final int NUM_STEPS = 100000;
    private static int sum = 0;
    private static final ReentrantLock lock = new ReentrantLock();

    static void threadBody(int id){
        long my_id = (long)id;

        for ( int i = 0; i < NUM_STEPS; i++){
            lock.lock();

            try {
                sum += 1;
                if (sum % 100000 == 0){
                System.out.println("Thread " + my_id + " incrementou. Sum: " + sum);
                }
            } finally {
                lock.unlock();
            }
            
        }
    }

    public static void main(String[] args) {
        Thread[] threads = new Thread[NUM_THREADS];
        long expected = (long)NUM_THREADS * NUM_STEPS;
        
        for (int i = 0; i < NUM_THREADS; i++) {
            int id = i + 1;
            threads[i] = new Thread(() -> threadBody(id));
             try {
                threads[i].sleep(100);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            threads[i].start();
        }

        for (int i = 0; i < NUM_THREADS; i++) {
            try {
                threads[i].join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        
        System.out.println("\n--- Resultado: Pthread Mutex ---");
        System.out.println("Valor esperado: " + expected);
        System.out.println("Valor obtido: " + sum);
        System.out.println("Diferença: " + (expected-sum));

    }
}

```]


Ao realizar a execução do código, foi possível verificar que a implementação do Mutex permitiu com que não houvesse condição de corrida entre as threads de incremento, garantindo o valor correto da variável `sum`.

#figure(
  figure(
    rect(image("ex1-mutex.png", width:100%)),
    numbering: none,
    caption: [Execução do algoritmo do Contador implementando a versão em Java]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()

= Questão 2
A questão 2 consistia em solucionar o problema de condição de corrida (_Race Condition_) no sistema de pagamento bancário. Para isso, foi implementado em Java os algoritmos de Mutex, Monitoramento e Semáforo. O resultado final após a execução de cada código, é obter o valor final de $"R$"$  180 de saldo bancário.

== Implementação utilizando Monitores
Ao realizar a implementação do sistema de pagamento bancário utilizando Monitores, foi obtido o seguinte resultado:

#sourcecode[```Java
package exemplo2.monitor;

public class MonitorConta {
    public static int saldo = 100;

    static synchronized void depositar(int arg){
        int valor = arg;
        
        try {
            Thread.sleep(0);
            int temp = saldo;
            temp += valor;           // Passo 2: Soma
            saldo = temp;           // Passo 3: Escrita

        }catch (InterruptedException e){
            Thread.currentThread().interrupt();
        }
        
    }

    public static void main(String[] args) {
        int v1 = 50, v2 = 30;
        Thread t1 = new Thread(()-> depositar(v1));
        Thread t2 = new Thread(()-> depositar(v2));

        t1.start();
        t2.start();

        try {
            t1.join();
            t2.join();
        }catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido: " + saldo);
       

    }
}
```]
#pagebreak()
Ao executar o código mais de uma vez, foi obtido o valor correto de saldo bancário:

#figure(
  figure(
    rect(image("ex2-monitor.png", width:100%)),
    numbering: none,
    caption: [Execução do algoritmo de conta bancária utilizando Monitores em Java]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

\
\
#pagebreak()
== Implementação utilizando Mutex
Ao realizar a implementação do sistema de pagamento bancário utilizando Mutex, foi obtido o seguinte resultado:

#sourcecode[```Java
package exemplo2.mutex;
import java.util.concurrent.locks.ReentrantLock;

public class MutexConta {
    private static final ReentrantLock lock = new ReentrantLock();
    public static int saldo = 100;

    static void depositar(int arg){
        int valor = arg;
        lock.lock();
        
        try {
            Thread.sleep(100);
            int temp = saldo;
            temp += valor;           // Passo 2: Soma
            saldo = temp;           // Passo 3: Escrita

        }catch (InterruptedException e){
            Thread.currentThread().interrupt();
        }finally {
            lock.unlock();
        }
        
    }

    public static void main(String[] args) {
        int v1 = 50, v2 = 30;
        Thread t1 = new Thread(()-> depositar(v1));
        Thread t2 = new Thread(()-> depositar(v2));

        t1.start();
        t2.start();

        try {
            t1.join();
            t2.join();
        }catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido: " + saldo);
    }
}
```]
#pagebreak()
Ao executar o código mais de uma vez, foi obtido o valor correto de saldo bancário:
\
\

#figure(
  figure(
    rect(image("ex2-mutex.png", width:100%)),
    numbering: none,
    caption: [Execução do algoritmo de conta bancária utilizando Mutex em Java]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()
== Implementação utilizando Semáforo
Ao realizar a implementação do sistema de pagamento bancário utilizando Semáforos, foi obtido o seguinte resultado:

#sourcecode[```Java
package exemplo2.semafaro;
import java.util.concurrent.Semaphore;

public class SemafaroConta {
    private static final Semaphore semafaro = new Semaphore(2);
    public static int saldo = 100;

    static void depositar(int arg){
        int valor = arg;
        
        
        try {
           semafaro.acquire();
            Thread.sleep(100);
            int temp = saldo;
            temp += valor;           // Passo 2: Soma
            saldo = temp;           // Passo 3: Escrita

        }catch (InterruptedException e){
            Thread.currentThread().interrupt();
        }finally {
            semafaro.release();
        }
        
    }

    public static void main(String[] args) {
        int v1 = 50, v2 = 30;
        Thread t1 = new Thread(()-> depositar(v1));
        Thread t2 = new Thread(()-> depositar(v2));

        t1.start();
        t2.start();

        try {
            t1.join();
            t2.join();
        }catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido: " + saldo);
       

    }
}

```]
#pagebreak()
Ao executar o código mais de uma vez, foi obtido o valor correto de saldo bancário:
\
\

#figure(
  figure(
    rect(image("ex2-semaforo.png", width:100%)),
    numbering: none,
    caption: [Execução do algoritmo de conta bancária utilizando Semáforos em Java]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()
= Questão 3
A questão 3 consistia em alterar o exemplo da pizzaria implementado em Monitores. Foi sugerido que o cozinheiro conseguisse colocar na mesa até 2 pizzas para o entregador levar. Para isso, foi utilizado a estrutura de dados Fila (_Queue_) e seus demais métodos.

- *Classe Mesa:*

#sourcecode[```Java
package exemplo3.Monitor;

import java.util.LinkedList;
import java.util.Queue;


class Mesa {
    private String pizza;
    //private boolean mesaVazia = true;
    public static Queue<String> pizzas = new LinkedList<>(); //a fila de pizzas começa vazia
    

    // Monitor: Garante que só um mexe na mesa por vez
    public synchronized void colocarPizza(String nomePizza) throws InterruptedException {
        //se a fila de pizzas consegue armazenar 2 pizzas, o cozinheiro continua colocando pizzas, se não, ele espera
        while (pizzas.size() == 2) {
            System.out.println("-> Mesa cheia! Cozinheiro esperando...");
            wait();
        }

        pizzas.add(nomePizza);
        System.out.println("Cozinheiro colocou a pizza de: " + pizzas);
        // Avisa o entregador que tem pizza pronta
        notifyAll();
    }

    public synchronized String retirarPizza() throws InterruptedException {
        while (pizzas.isEmpty()) {
            System.out.println("-> Mesa vazia! Entregador esperando...");
            wait();
        }

        String p = pizzas.poll();
        System.out.println("Entregador levou a pizza de: " + p);
        // Avisa o cozinheiro que a mesa liberou
        notifyAll();
        return p;
    }
}
```]
#pagebreak()
- *Classe Pizzaria:*

#sourcecode[```Java
package exemplo3.Monitor;

public class Pizzaria {
    public static void main(String[] args) {
        Mesa mesa = new Mesa();
       
     
        // Thread do Cozinheiro
        new Thread(() -> {
            
            try {
                String[] cardapio = {"Calabresa", "Mussarela", "Portuguesa", "Marguerita", "Frango"};
                for (String p : cardapio) {
                    mesa.colocarPizza(p);
                    Thread.sleep(0); // Cozinheiro rápido
                }
            } catch (InterruptedException e) {}
        }).start();

        // Thread do Entregador
        new Thread(() -> {
            try {
                for (int i = 0; i < 3; i++) {
                    mesa.retirarPizza();
                    Thread.sleep(3000); //Entregador lento
                }
            } catch (InterruptedException e) {}
        }).start();
    }
}

```]

Ao executar o código, para o caso aonde o cozinheiro é mais rápido que o entregador, foi possível observar que o _buffer_ de até duas pizzas para o cozinheiro estava funcionando corretamente:
#figure(
  figure(
    rect(image("ex3-pizzaria.png", width:100%)),
    numbering: none,
    caption: [Execução do algoritmo da pizzaria com _buffer_ maior para o cozinheiro]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#pagebreak()

= Questão 4

As principais desvantagens e limitações na utilização de Semáforos podem ser destacadas como:
- *Possibilidade de bloqueio mútuo:* Na implementação de uso de Semáforos, pode ocorrer o caso em que uma um processo contendo  Thread A que fique esperando por uma Thread B e outro processo é contendo a Thread B esperando por A. Neste caso é gerado um impasse, pois temos uma thread esperando pela outra para iniciar sua execução.
- *Necessidade de liberar e fechar o semáforo manualmente:* Para cenários maiores e complexos, o programador do código pode acabar esquecendo de liberar ou bloquear determinada Thread, causando resultados inconsistentes e inesperados.
- *Utilização de variável global:* Nos exemplos de semáforos sempre era necessário o uso de uma variável global sendo acessível pelas tarefas em questão. Como se tratava de apenas exemplos simples, não houve problemas de alteração do valor da variável. Em cenários maiores e mais complexos, manter uma variável global sendo acessível por várias Threads simultaneamente e por demais funções presentes no código, pode causar valores inesperados.