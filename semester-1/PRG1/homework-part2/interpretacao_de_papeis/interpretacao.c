#include <stdio.h>

int nivel_minimo(int v_inicial, int incremento, int v_desejada){
    int nivel = 0;

    while (v_inicial < v_desejada) {
        nivel ++;
        if (nivel % 5 == 0) {
        v_inicial += incremento * 2;    
        }else {
        v_inicial += incremento;
        }
    }
    return nivel;
}

int main(){
    int classe, vitalidade, vitalidade_desejada, nivel, incremento;

    printf("Entre com a classe (1-arqueiro, 2-bárbaro, 3-druida, 4-mago): ");
    scanf("%d", &classe);
    switch (classe) {
        case 1: 
        vitalidade = 150, incremento = 10; 
        break;
        case 2:
        vitalidade = 200, incremento = 15;
        break;
        case 3:
        vitalidade = 100, incremento = 5;
        break;
        case 4:
        vitalidade = 100, incremento = 5;
        break;
        default:
        printf("Classe inválida");
        return 0;
    }
    printf("Entre com a vitalidade desejada: ");
    scanf("%d", &vitalidade_desejada);
    nivel = nivel_minimo(vitalidade, incremento, vitalidade_desejada);
    printf("Nível necessário: %d\n", nivel);

    return 0;
}