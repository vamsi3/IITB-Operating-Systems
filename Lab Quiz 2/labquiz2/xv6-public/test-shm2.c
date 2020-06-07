#include "types.h"
#include "stat.h"
#include "user.h"

	int
main(int argc, char *argv[])
{
	char *addr;

	shm_stat();

	addr = shm_get(5);
	printf(1, "\npid %d: address: 0x%x \n", getpid(), addr);
	shm_stat();

	sbrk(1);

	addr = shm_get(5);
	printf(1, "\npid %d: address: 0x%x \n", getpid(), addr);
	shm_stat();

	
	exit();
}
