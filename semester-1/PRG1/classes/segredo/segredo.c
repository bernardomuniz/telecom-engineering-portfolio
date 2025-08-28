#include <stdio.h>
#include <stdlib.h> //Atribui números aleatórios rand(), srand (semente)
#include <time.h>

int main (){
    int palpite, contagem = 0, aleatório;

    srand(time(NULL)); // Gera uma seed de números válidos a serem gerados
    aleatório = rand() % 100 - 1; //Número aleatório de 1 a 100
    
    do {
        printf("Entre com seu palpite (1 - 100): ");
        scanf("%d", &palpite);

        if (palpite > aleatório ) {
        printf("O segredo é menor\n");
        contagem ++;
        }else{
            printf("O segredo é maior\n");
            contagem++;
        }
    }while (palpite != aleatório); //Faça seu palpite enquanto seu palpite for diferente do número aletório
    printf("Parabéns! Você acertou!\n");
    printf("Número total de tentativas: %d\n", contagem);

    return 0;
}