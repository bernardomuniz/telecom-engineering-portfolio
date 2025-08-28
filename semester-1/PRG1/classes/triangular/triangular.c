#include <stdio.h>
#include <stdbool.h>

bool eh_triangular(int n);

int main(){
    int n;
    int verificação;

    printf("Entre com um inteiro positivo: ");
    scanf("%d", &n);
    verificação = eh_triangular(n);
    if (verificação) {
        printf("É triangular\n");
    }else {
        printf("Não é triangular\n");
    }


    return 0;
}

bool eh_triangular(int n){

    int padrão = 1, n_triangular = 1;

    while (n > n_triangular) {
        padrão++;
        n_triangular += padrão;
    }

    if (n == n_triangular) {
        return 0;
    }else {
        return 1;
    }
}
