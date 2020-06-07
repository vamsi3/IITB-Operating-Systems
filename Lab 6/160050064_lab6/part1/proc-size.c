#include "types.h"
#include "stat.h"
#include "user.h"
char b[1024];


int getpusz()
{
	uint KERNBASE = 0x80000000;
	uint PGSIZE = 4096;
	uint num_pages = KERNBASE/PGSIZE;
	int cnt = 0;
	for (uint i=0; i<num_pages; i++) {
		uint pa;
		int flag;
		if (get_va_to_pa(i*PGSIZE, &pa, &flag))
			cnt++;
	}
	return cnt * ((int) PGSIZE);
}
int getpksz()
{
	uint KERNBASE = 0x80000000;

	// I strongly think I need to check only until PHYSTOP, but the sample testcase doesn't match that way.
	// Gotta see where I'm getting confused. TODO: Need to clarify!
	uint KERNTOP = 0xFFFFFFFF;
	
	uint PGSIZE = 4096;
	uint base_page = KERNBASE/PGSIZE, top_page = KERNTOP/PGSIZE;
	int cnt = 0;
	for (uint i=base_page; i<=top_page; i++) {
		uint pa;
		int flag;
		if (get_va_to_pa(i*PGSIZE, &pa, &flag))
			cnt++;
	}
	return cnt * ((int) PGSIZE);	
}

int
main(int argc, char *argv[])
{
	char *buf;

	printf(1, "\ngetpsz: %d bytes \n", getpsz());
	printf(1,"getpusz: %d bytes \n",getpusz());
	printf(1,"getpksz: %d bytes\n",getpksz());


	buf=sbrk(4096);
	buf[0]='\0';
	printf(1, "\ngetpsz: %d bytes \n", getpsz());
	printf(1,"getpusz: %d bytes \n",getpusz());
	printf(1,"getpksz: %d bytes\n",getpksz());

	
	buf=sbrk(4096*7);
	printf(1, "\ngetpsz: %d bytes \n", getpsz());
	printf(1,"getpusz: %d bytes \n",getpusz());
	printf(1,"getpksz: %d bytes\n",getpksz());

	buf=sbrk(1);
	printf(1, "\ngetpsz: %d bytes \n", getpsz());
	printf(1,"getpusz: %d bytes \n",getpusz());
	printf(1,"getpksz: %d bytes\n",getpksz());

	buf=sbrk(2);
	printf(1, "\ngetpsz: %d bytes \n", getpsz());
	printf(1,"getpusz: %d bytes \n",getpusz());
	printf(1,"getpksz: %d bytes\n",getpksz());


	exit();
}