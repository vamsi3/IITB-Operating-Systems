#include "types.h"
#include "stat.h"
#include "user.h"

	int
main(int argc, char *argv[])
{
	char *addr;

	shm_stat();

	addr = shm_get(5);
	printf(1, "\npid %d: VA for shared object with key 5: 0x%x \n", getpid(), addr);
	shm_stat();

	addr = shm_get(1);
	printf(1, "\npid %d: VA for shared object with key 1: 0x%x \n", getpid(), addr);
	shm_stat();

	addr = shm_get(1);
	printf(1, "\npid %d: VA for shared object with key 1: 0x%x \n", getpid(), addr);
	shm_stat();


	exit();
}