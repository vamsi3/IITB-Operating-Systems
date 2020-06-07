#include "types.h"
#include "stat.h"
#include "user.h"

void print_vm_block()
{
	/*todo*/
}

	int
main(int argc, char *argv[])
{
	char *buf1, *buf2, *buf3;

	print_vm_block();

	buf1=sbrk(4096);
	buf1[0]='\0';
	print_vm_block();

	buf2=sbrk(4096*3);
	buf2[0]='\0';
	print_vm_block();

	buf3=sbrk(4096*11);
	buf3[0]='\0';
	print_vm_block();

	exit();
}
