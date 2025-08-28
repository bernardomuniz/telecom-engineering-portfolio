#include <stdio.h>
#include <math.h>

float calc_area_circulo (float raio){
    float area;
    area = M_PI * pow(raio, 2.0);
    return area;
}

float calc_area_anel (float r_ext, float r_int){
    float area_anel;

    area_anel = calc_area_circulo(r_ext) - calc_area_circulo(r_int);

    return area_anel;
}
//rho = densidade
//raio externo --> d2

float calc_massa_arruela (float d1, float d2, float H, float rho ){
    float raio_ex, raio_int, tot_area, massa;

    raio_ex = d2/2; //raio externo
    raio_int = d1 /2; //raio interno

    tot_area = calc_area_anel(raio_ex, raio_int); //area da arruela

    massa = rho * H * tot_area; //massa = densidade * espessura * area anel

    return massa;
}

int main(){
    float diametro_interno, diametro_externo, espessura, densidade, massa_total;
    int num_arruelas;

    printf("Entre com o diâmetro interno (cm): ");
    scanf("%f", &diametro_interno);
    printf("Entre com o diâmetro externo (cm): ");
    scanf("%f", &diametro_externo);
    printf("Entre com a espessura (cm): ");
    scanf("%f", &espessura);
    printf("Entre com a densidade (g/cm³): ");
    scanf("%f", &densidade);
    printf("Entre com o número de arruelas: ");
    scanf("%d", &num_arruelas);

    massa_total = calc_massa_arruela(diametro_interno, diametro_externo, espessura, densidade) * num_arruelas;

    printf("Massa total: %.2f g\n", massa_total);
    return 0;
}