#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define EPS 0.000001

char codon[64] = {'K', 'D', 'K', 'D', 'T', 'T', 'T', 'T', 'R', 'S', 'R', 'S', 'I', 'I', 'M', 'I', 'Q', 'H', 'Q', 'H', 'P', 'P', 'P', 'P', 'R', 'R', 'R', 'R', 'L', 'L', 'L', 'L', 'E', 'D', 'E', 'D', 'A', 'A', 'A', 'A', 'G', 'G', 'G', 'G', 'V', 'V', 'V', 'V', 'B', 'Y', 'B', 'Y', 'S', 'S', 'S', 'S', 'B', 'C', 'W', 'C', 'L', 'F', 'L', 'F' };

int test(int a)
{
	printf("Hello I'm in C\n");
	return a;
}

