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

	// make the system call to get all process information

    // print process information in required format
	printf(1, "%s\t%s\t%s\t%s\t\t%s \n", 
			"PID", "PPID", "Size", "State", "Name");

    // print per process information

	exit();
}
