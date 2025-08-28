#include <stdio.h>
#include <math.h>

/*A função graus2rad tem a função de converter os graus de latitude e longitude tanto do ponto 1 e do ponto 2 em radianos para que possa ser calculado o haverseno */
float graus2rad(float graus){                
    float radianos;
    radianos = graus * M_PI / 180.0;
    return radianos;
}


/*A função hav tem a função de calcular o haverseno de um ângulo em radianos (radiano esse que vai ser calculado pela função anterior), que posteriormente será  utilizado na formula*/
float hav(float theta){                         
    float haversine;                            
    haversine = pow(sin(theta/2.0), 2.0);
    return haversine;
}

/*A função distancia_na_terra irá calcular tudo*/
float distancia_na_terra(float lat1, float lon1, float lat2, float lon2){
    float d;
    const int r = 6371; //Raio da terra.

    lat1 = graus2rad(lat1); //Aqui é usado a função graus2rad para converter o parâmetros latitude e longitude dos pontos 1 e 2 em radianos antes de ser usado na fórmula
    lon1 = graus2rad(lon1);
    lat2 = graus2rad(lat2);
    lon2 = graus2rad(lon2);

    d = 2*r*asin(sqrt(hav(lat2 - lat1) + cos(lat1)*cos(lat2)*hav(lon2 - lon1))); //Aqui é usado a função hav. Note que o paremetro "theta" é a diferença entre lat2-lat1.
    return d;
}


int main(){
    float latitude1, longitude1, latitude2, longitude2, distancia_entre_pontos;

    printf("Entre com a latiude e a longitude do ponto 1: ");
    scanf("%f%f", &latitude1, &longitude1);
    printf("Entre com a latitude e a longitude do ponto 2: ");
    scanf("%f%f", &latitude2, &longitude2);

    distancia_entre_pontos = distancia_na_terra(latitude1, longitude1, latitude2, longitude2); //Por fim, basta passar os parâmetros da função distancia_na_terra.

    printf("Distância entre pontos: %g km\n", distancia_entre_pontos);
    return 0;
}