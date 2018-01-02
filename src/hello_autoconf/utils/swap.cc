#include <stdio.h>
#include "swap.h"

void swap(int* x, int* y)
{
	int temp = 0;
	temp = *x;
	*x = *y;
	*y = temp;
}
