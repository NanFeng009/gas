#include <stdio.h>

extern int __world();
int main()
{
	printf("start to call fun in gas\n\t");
	__world();
}
