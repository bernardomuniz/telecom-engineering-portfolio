#include <stdio.h>
#include <math.h>

int bhaskara (float a, float b, float c, float *x1, float *x2){
    float delta;
    delta = pow(b, 2) - 4*a*c;

    if (delta < 0) {
        return 0;
    }else if (a == 0 ) {
        return 0;
    }else {
        *x1 = (-b + sqrt(delta))/(2*a);
        *x2 = (-b - sqrt(delta))/(2*a);
        return 1;
    }
}


int main(){
    
    float a, b , c, x1, x2, r;
    printf("Entre com os coeficientes: ");
    scanf("%f%f%f", &a, &b, &c);
    
     r = bhaskara(a, b, c, &x1, &x2);

     if(r == 0){
        printf("ímpossível calcular\n");
     }else{
        printf("X1: %.1f\n", x1);
        printf("X2: %.1f\n", x2);
     }

    return 0;

}

