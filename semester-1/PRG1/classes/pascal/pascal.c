#include <stdio.h>

int potencia_fatorial(int x, int m);
int coeficiente_binomial(int n, int k);
void imprime_pascal(int n_max);

int main (){
    int n_max;
    printf("Entre com n máximo: ");
    scanf("%d", &n_max);
    imprime_pascal(n_max);
    return 0;
}



int potencia_fatorial(int x, int m){
    int pf = 1;

    while (m > 0) {
        pf = pf * x;
        x--;
        m--;
    }
    return pf;
}

int coeficiente_binomial(int n, int k){
    int num, den;
    num = potencia_fatorial(n, k);
    den = potencia_fatorial(k, k);
    return num/den;
}

void imprime_pascal(int n_max){
    for (int n = 0; n <= n_max; n++) {
        for (int k = 0; k <= n; k++) {
             printf("%4d", coeficiente_binomial(n, k));
        }
        printf("\n");
    }
}