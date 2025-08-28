#include <stdio.h>

int eh_primo (int n){
   if (n < 2) return 0; // Números menores que 2 não são primos
    for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0) {
            return 0; // Encontrou um divisor, não é primo
        }
    }
    return 1; // Não encontrou divisores, é primo
}

int filtra_primos (int seq[], int n, int primos[]){
    int cont_primos = 0;
    for (int i = 0; i < n; i++) {
        if (eh_primo(seq[i]) == 1) {
            primos[cont_primos++] = seq[i];
        }
    }
    return cont_primos;
}


int main(){
    int arranjo[100], primos_encontrados[100], num, contagem_num = 0, cont_primos ;

    printf("Entre com inteiros positivos (0 para terminar): ");
    for (int i = 0; i < 100; i++) { 
        scanf("%d", &num);
        if (num == 0) {
            break;
        }
        arranjo[contagem_num++] = num;
    } 
    cont_primos = filtra_primos(arranjo, contagem_num, primos_encontrados);
    printf("Primos encontrados: ");
    for (int i = 0; i < cont_primos; i++) {
        printf("%d ", primos_encontrados[i]);
    }
    return 0;
}