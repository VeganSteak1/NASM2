#define mod(x, y) ((x) - (int)((x) / (y)) * (y))
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
double x;
double cos(double x) {
    return 1 - ((x * x) / (2)) + ((x * x * x * x) / (24)) - ((x * x * x * x * x * x) / (720)) + ((x * x * x * x * x * x * x * x) / (40320)) - ((x * x * x * x * x * x * x * x * x * x) / (3628800)) + ((x * x * x * x * x * x * x * x * x * x * x * x) / (479001600));
}

void *myThreadFun1(void *vargp) {
    x = mod(x, 6.28318530718);
    return NULL;
}

void *myThreadFun2(void *vargp) {
    printf("Valoare cos(%lf) = %lf\n", x, cos(x));
    return NULL;
}

int main(){
    printf("Introduce valoare x:\n");
    scanf("%lf",&x);
    pthread_t id1,id2;
    pthread_create(&id1, NULL, myThreadFun1, NULL);
    pthread_join(id1, NULL);
    pthread_create(&id2, NULL, myThreadFun2, NULL);
    pthread_join(id2, NULL);
    return 0;
}
