#include <stdio.h>

int main(){
    float ph_adequado1, ph_adequado2, medicoes_ph;
    int n_medicoes, fora_da_faixa = 0;

    printf("Entre com a faixa de pH adequada: ");
    scanf("%f %f", &ph_adequado1, &ph_adequado2);
    printf("Entre com o número de medições: ");
    scanf("%d", &n_medicoes);
    printf("Entre com as medições de pH: ");
    for (int i = 1; i <= n_medicoes; i++) {
        scanf("%f", &medicoes_ph);
        if(medicoes_ph > ph_adequado2 || medicoes_ph < ph_adequado1){
            fora_da_faixa++;
        }
    }

    printf("Número de medições fora da faixa: %d\n", fora_da_faixa);


    return 0;
}