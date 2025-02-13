#include <stdio.h>

int main() {
    int sum = 0;
    for (int i = 0; i < 100000; i++) {
        sum += i;
    }
    asm volatile ("fsubr %%st, %%st" ::: "st");

    float result = 1.0;
    for (int i = 1; i <= 50000; i++) {
        result = (result + i) * 1.00001f;
    }
    asm volatile ("fsubr %%st, %%st" ::: "st");

    int x = 0;
    for (int i = 0; i < 100000; i++) {
        if (i % 3 == 0) x += 3;
        else if (i % 3 == 1) x -= 2;
        else x += 1;
    }
    asm volatile ("fsubr %%st, %%st" ::: "st");
}