#include <stdio.h>

int main() {
    float a = 3.0, b = 1.0;
    float result = b-a;
    // printf("Result: %f\n", result);
    asm volatile ("fsubr %%st, %%st" ::: "st");
    return 0;
}
