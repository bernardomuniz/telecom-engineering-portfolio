#include <stdio.h>


int main(){
    int cpf[11];
    int tamanho = 0;

    printf("Entre com o CPF: ");
    for (int i = 0; i < 11; i++) {
        scanf("%d", &cpf[i]);
    }

    printf("%d %d\n", cpf[9], cpf[10]);



    return 0;
}