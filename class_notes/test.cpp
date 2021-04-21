#include <stdio.h>
#include <stdlib.h>

void swap(int &x, int &y) {
    x = x + y;
    y = x - y;
    x = x - y;
}

int main() {
    int i;
    int a[3];
    i = 1;
    a[0] = 2;
    a[1] = 1;
    a[2] = 0;
    swap(i, a[i]);
    /*i = i + a[i];
    a[i] = i - a[i];
    i = i - a[i];*/
    printf("%d %d %d %d\n", i, a[0], a[1], a[2]);
    swap(a[i], a[i]);
    /*a[i] = a[i] + a[i];
    a[i] = a[i] - a[i];
    a[i] = a[i] - a[i];*/
    printf("%d %d %d\n", a[0], a[1], a[2]);
    return 0;
}
