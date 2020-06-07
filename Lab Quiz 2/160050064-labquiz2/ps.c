#include "types.h"
#include "stat.h"
#include "user.h"

// enum to store process state by name
enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

// a character array to print correspding state names
char *psstate[6] = {"Unused  ", "Embryo  ", "Sleeping ", "Runnable", "Running ", "Zombie  "};

// the format for each process's ps entry
struct ps_entry
{
  int pid;
  int ppid;
  uint sz;
  enum procstate state;
  char name[16];
};


int
main(int argc, char *argv[])
{
	int ret;

	// make space for ps_entrys first, assume a maximum of 64 processes
	// ...
	struct ps_entry proc_info[64];

	// make the system call to get all process information
	ret = getps(proc_info);

    // print process information in required format
	printf(1, "%s\t%s\t%s\t%s\t\t%s \n", 
			"PID", "PPID", "Size", "State", "Name");

    // print per process information
	for (int i=0; i<ret; i++) {
		struct ps_entry curr_p = proc_info[i];
		printf(1, "%d\t%d\t%d\t%s\t%s \n", 
				curr_p.pid, curr_p.ppid, (int) curr_p.sz, psstate[curr_p.state], curr_p.name);
	}
	exit();
}
