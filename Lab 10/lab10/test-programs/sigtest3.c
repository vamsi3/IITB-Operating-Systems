#include "types.h"
#include "stat.h"
#include "user.h"

void signal_handler(int sig_type)
{
  printf(1, "Child: Signal handler invoked !!!. signal type: %d \n", sig_type);

  if(sig_type == 1)
    exit();
  else
    signal_ret();  
}

int
main(int argc, char *argv[])
{
  int pid;
  int ret;

  pid = fork();
  if(pid == 0)
  {
    signal((char *)signal_handler);

    while(1)
    {
      ret = sleep(100);
      printf(1, "Child: %d  \n", ret);
    }
    exit();
  }

  sleep(5 * 100);
  printf(1, "\n[%d] Parent sends signal '5' to child \n", getpid());
  signal_send(pid, 5);

  sleep(5 * 100);
  printf(1, "\n[%d] Parent sends signal '6' to child \n", getpid());
  signal_send(pid, 6);

  sleep(5 * 100);
  printf(1, "\n[%d] Parent sends signal '1' to child \n", getpid());
  signal_send(pid, 1);

  wait();  
  exit();
}
