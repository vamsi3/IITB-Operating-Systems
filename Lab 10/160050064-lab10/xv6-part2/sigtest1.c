#include "types.h"
#include "stat.h"
#include "user.h"

void signal_handler(int sig_type)
{
  printf(1, "Signal handler invoked !!!. signal type: %d \n", sig_type);

  exit();
}

int
main(int argc, char *argv[])
{
  int pid;

  pid = fork();
  if(pid == 0)
  {
    //  Child process registers signal handler
    signal((char *)signal_handler);

    while(1);
    exit();
  }

  printf(1, "[%d] Parent waits for 5 seconds \n", getpid());
  sleep(5 * 100);

  //  Parent process sends signal to child
  printf(1, "[%d] Parent sends signal to child \n", getpid());
  signal_send(pid, 1);

  wait();
  
  exit();
}
