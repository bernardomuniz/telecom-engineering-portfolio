#include <stdio.h>

int conta_pares (int x[], int tam){
    int contagem = 0;

    for (int i = 0; i < tam; i++) {
        if (x[i] % 2 == 0) {
            contagem ++;
        }
    }
    return contagem;
}

int compara_arranjos (int x[], int y[], int tam){
    int contagem_x, contagem_y;
    contagem_x = conta_pares(x, tam);
    contagem_y = conta_pares(y,tam);

    if (contagem_x > contagem_y) {
        return 0;
    }else if (contagem_y > contagem_x) {
        return 1;
    }else {
        return 2;
    }
}

int main(){
    int arranjo1[100], arranjo2[100], tamanho_arr, comparacao;

    printf("Entre com o tamanho dos arranjos: ");
    scanf("%d", &tamanho_arr);
    printf("Entre com os elementos do primeiro arranjo: ");
    for (int i = 0; i < tamanho_arr; i++) {
        scanf("%d", &arranjo1[i]);
    }
    printf("Entre com os elementos do segundo arranjo: ");
    for (int i = 0; i < tamanho_arr; i++) {
        scanf("%d", &arranjo2[i]);
    }

    comparacao = compara_arranjos(arranjo1, arranjo2, tamanho_arr);
    if (comparacao == 0) {
        printf("O primeiro arranjo possui mais números pares\n");
    }else if (comparacao == 1) {
        printf("O segundo arranjo possui mais números pares\n");
    }else {
        printf("Os dois arranjos possuem a mesma quantidade de números pares\n");
    }
    return 0;
}