// Programming Pearl Chapter 1
// this program will generate 1,000,000 unique positive integers
// to input.txt. All integers < 10,000,000
// Sort these integers and write to result.txt
// How to use
// $ gcc -o sort sort-unique-integers.c
// $ ./sort

#include <stdio.h>
#include <stdlib.h>

#define MASK 0x1F
#define SHIFT 5
#define BITSPERWORD 32
#define SIZE  1000000
#define N     10000000

int a[1 + N/BITSPERWORD];

void swap(int *a, int *b) {
  int temp;
  temp = *a;
  *a = *b;
  *b = temp;
}

int bigrand() {
  return RAND_MAX*rand() + rand();
}

int randint(unsigned int l, unsigned int u) {
  return l + bigrand() % (u-l+1);
}

void set(int i) {
  a[i>>SHIFT] |= (1<<(i & MASK));
}

void clr(int i) {
  a[i>>SHIFT] &= ~(1<<(i & MASK));
}

int test(int i) {
  return a[i>>SHIFT] & (1<<(i & MASK));
}

int main(void) {

  srand(time(NULL));

  int i;

  FILE *ifptr, *ofptr;

  ofptr = fopen("input.txt", "w");

  for (i = 0; i < SIZE; i++) {
    fprintf(ofptr, "%d\n", randint(1, N));
  }

  ifptr = fopen("input.txt", "r");
  ofptr = fopen("result.txt", "w");

  for (i = 0; i < N; i++)
    clr(i);

  while (fscanf(ifptr, "%d", &i) != EOF) {
    set(i);
  }

  for (i = 0; i < N; i++)
    if (test(i))
      fprintf(ofptr, "%d\n", i);

  fclose(ifptr);
  fclose(ofptr);
  return 0;
}