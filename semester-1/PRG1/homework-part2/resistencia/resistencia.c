#include <stdio.h>

int main(){
    int n_req; 
    float resistencias, req_serie = 0, req_paralelo = 0;

    printf("Entre com a quantidade de resistências: ");
    scanf("%d", &n_req);

    for (int i = 1; i <= n_req; i++) {
        printf("Entre com a resistência %d (ohm): ", i);
        scanf("%f", &resistencias);

        req_serie += resistencias;
        req_paralelo += 1.0/resistencias;
        
    }
    req_paralelo = 1.0/req_paralelo;
    printf("Resistência série: %g ohm\n", req_serie);
    printf("Resistência paralelo: %g ohm\n", req_paralelo);
    return 0;
}