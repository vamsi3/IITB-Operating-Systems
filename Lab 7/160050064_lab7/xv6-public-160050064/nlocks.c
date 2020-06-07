#include "types.h"
#include "stat.h"
#include "user.h"

int main()
{
	int ret;
	int i;


	init_counters();

	for (int child=0; child<10; child++) {
		ret = fork();
		for(i=0; i<1000; i++)
		{
			acquire_lock(child);
			set_var(child, get_var(child)+1);
			release_lock(child);
		}

		if(ret == 0)
		{
			exit();
		}
	}
	if (ret != 0) {
		for (int child=0; child<10; child++)
			wait();

		for (i=0; i<10; i++) {
			int val = get_var(0);
			printf(1, "data[%d] = %d\n", i, val);
		}
		exit();
	}
}

