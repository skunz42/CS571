#include <stdio.h>
#include <stdlib.h>

int main() {
    int **x;
    int *y;
    int z;
    x = (int **)malloc(sizeof(int *));
    y = (int *)malloc(sizeof(int));
    z = 1;
    *y = 2;
    *x = y;
    **x = z;

    printf("x: %d, %p, %p\n", **x, *x, x);
    printf("y: %d, %p\n", *y, y);
    printf("z: %d, %p\n", z, &z);

    return 0;
}
