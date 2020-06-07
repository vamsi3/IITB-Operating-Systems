#include "types.h"
#include "stat.h"
#include "user.h"

#define ARRAY_SIZE 10
char buf[8192];

int
main(int argc, char *argv[])
{	
	int flags;
	int i;
	uint va[ARRAY_SIZE] = {0,0X1000,0X2000,0X100000, 0xE000000, 0x80000000, 0x80000005, 0x8DFFFFFF, 0x8E000000, 0XFFFFFFFF};
	uint pa;
	
	for(i=0; i<ARRAY_SIZE; i++)
	{
		if(get_va_to_pa(va[i], &pa, &flags))
			printf(1,"VA: 0x%x   PA: 0x%x \n", va[i], pa);
		else
			printf(1,"VA: 0x%x   PA: no mapping \n", va[i]);
	}
	
	exit();
}