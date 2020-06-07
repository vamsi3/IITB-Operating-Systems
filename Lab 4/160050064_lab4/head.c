#include "types.h"
#include "stat.h"
#include "user.h"

char buf[1];

void
cat(int fd, int cnt)
{
  int n;
  while((n = read(fd, buf, 1)) > 0) {
    if (cnt < 0) break;
    if (buf[0] == '\n') cnt--;
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{
  int fd, i;
  if(argc <= 2){
    cat(1, 1);
    exit();
  }

  int cnt = atoi(argv[1]);
  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    printf(1, "--- %s ---\n", argv[i]);
    cat(fd, cnt);
    close(fd);
  }
  exit();
}
