#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int segredo, palpite, contagem = 0;
    srand(time(NULL));
    segredo = rand() % 100 + 1; 
    do {
        scanf("%d", &palpite);
        if (palpite > segredo) {
            printf("<\n");
            contagem++;
        }else if (palpite < segredo) {
            printf(">\n");
            contagem++;
        }else {
            printf("=\n");
            contagem++;
        }
    }while (palpite != segredo);
    printf("%d tentativas\n", contagem);

    return 0;
}