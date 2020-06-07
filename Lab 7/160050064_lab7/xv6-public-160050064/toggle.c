#include "types.h"
#include "stat.h"
#include "user.h"

int main()
{
	int ret;
	int i;


	init_counters();

	// Our shared variable is data[0]. the line below is just precautionary.
	set_var(0, 0);
	acquire_lock(1);

	ret = fork();

	for(i=0; i<30; i++)
	{
		if(ret == 0)
		{
			acquire_lock(1);

			acquire_lock(0);
			set_var(0, get_var(0)-1);
			int val = get_var(0);
			printf(1, "In child,  %d\n", val);
			release_lock(0);

			release_lock(2);
		}
		else
		{
			acquire_lock(2);

			acquire_lock(0);
			set_var(0, get_var(0)+1);
			int val = get_var(0);
			printf(1, "In parent, %d\n", val);
			release_lock(0);

			release_lock(1);
		}
	}

	if(ret == 0)
	{
		exit();
	}
	else
	{
		wait();
		exit();
	}
}
