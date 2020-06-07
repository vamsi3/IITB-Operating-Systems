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

  pid = fork();
  if(pid == 0)
  {
    signal((char *)signal_handler);

    while(1);
    exit();
  }

  sleep(5 * 100);
  printf(1, "\n[%d] Parent sends first signal to child \n", getpid());
  signal_send(pid, 5);

  sleep(5 * 100);
  printf(1, "\n[%d] Parent sends second signal to child \n", getpid());
  signal_send(pid, 1);

  wait();
  exit();
}
