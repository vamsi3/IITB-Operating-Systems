#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  int pid;
  int ret;

  pid = fork();
  if(pid == 0)
  {
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
  printf(1, "[%d] Child process has terminated \n", getpid());
  exit();
}
