#include "types.h"
#include "stat.h"
#include "user.h"

int main()
{
	int ret;
	int i;


	init_counters();

	ret = fork();
	for(i=0; i<10000; i++)
	{
		set_var(0, get_var(0)+1);
	}

	if(ret == 0)
	{
		exit();
	}
	else
	{
		wait();
		int val = get_var(0);
		printf(1, "%d", val);

		exit();
	}
}

