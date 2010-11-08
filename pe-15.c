/*
 * PE#15
 * Ruby is slow. I could have done this with some kind of fancy pruning / doubling algorithm, but I opted for a bigger
 * hammer and just did it brute-force in C.
 */

#include <stdio.h>

int grid_size;

unsigned long long recurse(int x, int y) {
	if ((x == grid_size) || (y == grid_size))
		return 1;
		
	if (x == y)
		return recurse(x, y+1) * 2;
		
	unsigned long long right = recurse(x+1, y);
	unsigned long long down = recurse(x, y+1);
	
	return right+down;
}


unsigned long long solve(int size) {
	grid_size = size;
	printf("%i\n", size);
	printf("%llu\n", recurse(0, 0));
}


int main() {
	int i;
	for (i = 1; i <= 20; i++) {
		solve(i);
	}
}