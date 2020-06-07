
_test1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	}
}


int main()
{	
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 1c             	sub    $0x1c,%esp
	int result2;
	int result3;
	int pid;
	int pids[NWORKERS];

	init_taskmaster();
  13:	e8 ba 04 00 00       	call   4d2 <init_taskmaster>

	//	Creating N worker threads
	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  18:	e8 0d 04 00 00       	call   42a <fork>
		if(pid == 0)
  1d:	85 c0                	test   %eax,%eax
  1f:	0f 84 ad 00 00 00    	je     d2 <main+0xd2>
  25:	89 c3                	mov    %eax,%ebx
	init_taskmaster();

	//	Creating N worker threads
	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  27:	e8 fe 03 00 00       	call   42a <fork>
		if(pid == 0)
  2c:	85 c0                	test   %eax,%eax
	init_taskmaster();

	//	Creating N worker threads
	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  2e:	89 c6                	mov    %eax,%esi
		if(pid == 0)
  30:	0f 84 9c 00 00 00    	je     d2 <main+0xd2>
						
		pids[i] = pid;
	}

	//	Creating 3 tasks	
	do_task((char *)task1, 100,	10, 11);
  36:	6a 0b                	push   $0xb
  38:	6a 0a                	push   $0xa
  3a:	6a 64                	push   $0x64
  3c:	68 e0 00 00 00       	push   $0xe0
  41:	e8 94 04 00 00       	call   4da <do_task>
	do_task((char *)task2, 101, 20, 21);
  46:	6a 15                	push   $0x15
  48:	6a 14                	push   $0x14
  4a:	6a 65                	push   $0x65
  4c:	68 40 01 00 00       	push   $0x140
  51:	e8 84 04 00 00       	call   4da <do_task>
	do_task((char *)task1, 102, 30, 31);
  56:	83 c4 20             	add    $0x20,%esp
  59:	6a 1f                	push   $0x1f
  5b:	6a 1e                	push   $0x1e
  5d:	6a 66                	push   $0x66
  5f:	68 e0 00 00 00       	push   $0xe0
  64:	e8 71 04 00 00       	call   4da <do_task>

	//	Waiting for all tasks to complete
	wait_for_task_to_complete(100, &result1);
  69:	58                   	pop    %eax
  6a:	8d 45 dc             	lea    -0x24(%ebp),%eax
  6d:	5a                   	pop    %edx
  6e:	50                   	push   %eax
  6f:	6a 64                	push   $0x64
  71:	e8 6c 04 00 00       	call   4e2 <wait_for_task_to_complete>
	wait_for_task_to_complete(101, &result2);
  76:	59                   	pop    %ecx
  77:	58                   	pop    %eax
  78:	8d 45 e0             	lea    -0x20(%ebp),%eax
  7b:	50                   	push   %eax
  7c:	6a 65                	push   $0x65
  7e:	e8 5f 04 00 00       	call   4e2 <wait_for_task_to_complete>
	wait_for_task_to_complete(102, &result3);
  83:	58                   	pop    %eax
  84:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  87:	5a                   	pop    %edx
  88:	50                   	push   %eax
  89:	6a 66                	push   $0x66
  8b:	e8 52 04 00 00       	call   4e2 <wait_for_task_to_complete>

	sleep(100);
  90:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  97:	e8 26 04 00 00       	call   4c2 <sleep>
	//	Printing the results
	printf(1, "\n\nResult (100): %d.  Result (101): %d. Result (102): %d. \n", result1, result2, result3);
  9c:	59                   	pop    %ecx
  9d:	ff 75 e4             	pushl  -0x1c(%ebp)
  a0:	ff 75 e0             	pushl  -0x20(%ebp)
  a3:	ff 75 dc             	pushl  -0x24(%ebp)
  a6:	68 58 09 00 00       	push   $0x958
  ab:	6a 01                	push   $0x1
  ad:	e8 ee 04 00 00       	call   5a0 <printf>

	//	Master process kills all worker processes
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);
  b2:	83 c4 14             	add    $0x14,%esp
  b5:	53                   	push   %ebx
  b6:	e8 a7 03 00 00       	call   462 <kill>
  bb:	89 34 24             	mov    %esi,(%esp)
  be:	e8 9f 03 00 00       	call   462 <kill>

	for(int i=0; i<NWORKERS; i++)
		wait();
  c3:	e8 72 03 00 00       	call   43a <wait>
  c8:	e8 6d 03 00 00       	call   43a <wait>

	exit();
  cd:	e8 60 03 00 00       	call   432 <exit>
	//	Creating N worker threads
	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
  d2:	e8 c9 00 00 00       	call   1a0 <worker_thread>
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <task1>:
#include "user.h"

#define NWORKERS 2

void task1(int id, int a, int b)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	83 ec 18             	sub    $0x18,%esp
  e9:	8b 75 08             	mov    0x8(%ebp),%esi
  ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(5);
  ef:	6a 05                	push   $0x5
#include "user.h"

#define NWORKERS 2

void task1(int id, int a, int b)
{
  f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(5);
  f4:	e8 c9 03 00 00       	call   4c2 <sleep>
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
  f9:	e8 b4 03 00 00       	call   4b2 <getpid>
  fe:	5a                   	pop    %edx
  ff:	59                   	pop    %ecx
 100:	53                   	push   %ebx
 101:	57                   	push   %edi
	result = a + b;
 102:	01 fb                	add    %edi,%ebx
void task1(int id, int a, int b)
{
	int result;

	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 104:	56                   	push   %esi
 105:	50                   	push   %eax
 106:	68 c0 08 00 00       	push   $0x8c0
 10b:	6a 01                	push   $0x1
 10d:	e8 8e 04 00 00       	call   5a0 <printf>
	result = a + b;

	sleep(300);
 112:	83 c4 14             	add    $0x14,%esp
 115:	68 2c 01 00 00       	push   $0x12c
 11a:	e8 a3 03 00 00       	call   4c2 <sleep>
	task_ret(id, result);
 11f:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 122:	89 75 08             	mov    %esi,0x8(%ebp)
 125:	83 c4 10             	add    $0x10,%esp
}
 128:	8d 65 f4             	lea    -0xc(%ebp),%esp
 12b:	5b                   	pop    %ebx
 12c:	5e                   	pop    %esi
 12d:	5f                   	pop    %edi
 12e:	5d                   	pop    %ebp
	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	result = a + b;

	sleep(300);
	task_ret(id, result);
 12f:	e9 be 03 00 00       	jmp    4f2 <task_ret>
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <task2>:
}

void task2(int id, int a, int b)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	83 ec 18             	sub    $0x18,%esp
 149:	8b 75 08             	mov    0x8(%ebp),%esi
 14c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(15);
 14f:	6a 0f                	push   $0xf
	sleep(300);
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
 151:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(15);
 154:	e8 69 03 00 00       	call   4c2 <sleep>
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 159:	e8 54 03 00 00       	call   4b2 <getpid>
 15e:	5a                   	pop    %edx
 15f:	59                   	pop    %ecx
 160:	53                   	push   %ebx
 161:	57                   	push   %edi
 162:	56                   	push   %esi
 163:	50                   	push   %eax
 164:	68 f0 08 00 00       	push   $0x8f0
 169:	6a 01                	push   $0x1

	result = a * b;
 16b:	0f af df             	imul   %edi,%ebx
void task2(int id, int a, int b)
{
	int result;

	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 16e:	e8 2d 04 00 00       	call   5a0 <printf>

	result = a * b;
	
	sleep(450);
 173:	83 c4 14             	add    $0x14,%esp
 176:	68 c2 01 00 00       	push   $0x1c2
 17b:	e8 42 03 00 00       	call   4c2 <sleep>
	task_ret(id, result);
 180:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 183:	89 75 08             	mov    %esi,0x8(%ebp)
 186:	83 c4 10             	add    $0x10,%esp
}
 189:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18c:	5b                   	pop    %ebx
 18d:	5e                   	pop    %esi
 18e:	5f                   	pop    %edi
 18f:	5d                   	pop    %ebp
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;
	
	sleep(450);
	task_ret(id, result);
 190:	e9 5d 03 00 00       	jmp    4f2 <task_ret>
 195:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <worker_thread>:
}

void worker_thread()
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
	int count = 0;
 1a4:	31 f6                	xor    %esi,%esi
	sleep(450);
	task_ret(id, result);
}

void worker_thread()
{
 1a6:	53                   	push   %ebx
 1a7:	eb 24                	jmp    1cd <worker_thread+0x2d>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 1b0:	e8 fd 02 00 00       	call   4b2 <getpid>
	while(1)
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
 1b5:	83 c6 01             	add    $0x1,%esi
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 1b8:	83 ec 0c             	sub    $0xc,%esp
 1bb:	53                   	push   %ebx
 1bc:	56                   	push   %esi
 1bd:	50                   	push   %eax
 1be:	68 20 09 00 00       	push   $0x920
 1c3:	6a 01                	push   $0x1
 1c5:	e8 d6 03 00 00       	call   5a0 <printf>
		else
		{
			printf(1, "wait for task failed \n");
			exit();
		}
	}
 1ca:	83 c4 20             	add    $0x20,%esp
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 1cd:	e8 18 03 00 00       	call   4ea <wait_for_task>
		if(ret > 0)
 1d2:	85 c0                	test   %eax,%eax
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 1d4:	89 c3                	mov    %eax,%ebx
		if(ret > 0)
 1d6:	7f d8                	jg     1b0 <worker_thread+0x10>
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
 1d8:	83 ec 08             	sub    $0x8,%esp
 1db:	68 94 09 00 00       	push   $0x994
 1e0:	6a 01                	push   $0x1
 1e2:	e8 b9 03 00 00       	call   5a0 <printf>
			exit();
 1e7:	e8 46 02 00 00       	call   432 <exit>
 1ec:	66 90                	xchg   %ax,%ax
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1fa:	89 c2                	mov    %eax,%edx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 200:	83 c1 01             	add    $0x1,%ecx
 203:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 207:	83 c2 01             	add    $0x1,%edx
 20a:	84 db                	test   %bl,%bl
 20c:	88 5a ff             	mov    %bl,-0x1(%edx)
 20f:	75 ef                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 211:	5b                   	pop    %ebx
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 55 08             	mov    0x8(%ebp),%edx
 228:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 22b:	0f b6 02             	movzbl (%edx),%eax
 22e:	0f b6 19             	movzbl (%ecx),%ebx
 231:	84 c0                	test   %al,%al
 233:	75 1e                	jne    253 <strcmp+0x33>
 235:	eb 29                	jmp    260 <strcmp+0x40>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 240:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 243:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 246:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 249:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 24d:	84 c0                	test   %al,%al
 24f:	74 0f                	je     260 <strcmp+0x40>
 251:	89 f1                	mov    %esi,%ecx
 253:	38 d8                	cmp    %bl,%al
 255:	74 e9                	je     240 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 257:	29 d8                	sub    %ebx,%eax
}
 259:	5b                   	pop    %ebx
 25a:	5e                   	pop    %esi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    
 25d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 260:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 262:	29 d8                	sub    %ebx,%eax
}
 264:	5b                   	pop    %ebx
 265:	5e                   	pop    %esi
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    
 268:	90                   	nop
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strlen>:

uint
strlen(char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 39 00             	cmpb   $0x0,(%ecx)
 279:	74 12                	je     28d <strlen+0x1d>
 27b:	31 d2                	xor    %edx,%edx
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c2 01             	add    $0x1,%edx
 283:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 287:	89 d0                	mov    %edx,%eax
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 28d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <memset>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	89 d0                	mov    %edx,%eax
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	74 1d                	je     2ee <strchr+0x2e>
    if(*s == c)
 2d1:	38 d3                	cmp    %dl,%bl
 2d3:	89 d9                	mov    %ebx,%ecx
 2d5:	75 0d                	jne    2e4 <strchr+0x24>
 2d7:	eb 17                	jmp    2f0 <strchr+0x30>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e0:	38 ca                	cmp    %cl,%dl
 2e2:	74 0c                	je     2f0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2e4:	83 c0 01             	add    $0x1,%eax
 2e7:	0f b6 10             	movzbl (%eax),%edx
 2ea:	84 d2                	test   %dl,%dl
 2ec:	75 f2                	jne    2e0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ee:	31 c0                	xor    %eax,%eax
}
 2f0:	5b                   	pop    %ebx
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 306:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 308:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 30b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 30e:	eb 29                	jmp    339 <gets+0x39>
    cc = read(0, &c, 1);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	6a 01                	push   $0x1
 315:	57                   	push   %edi
 316:	6a 00                	push   $0x0
 318:	e8 2d 01 00 00       	call   44a <read>
    if(cc < 1)
 31d:	83 c4 10             	add    $0x10,%esp
 320:	85 c0                	test   %eax,%eax
 322:	7e 1d                	jle    341 <gets+0x41>
      break;
    buf[i++] = c;
 324:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 32d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 32f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 333:	74 1b                	je     350 <gets+0x50>
 335:	3c 0d                	cmp    $0xd,%al
 337:	74 17                	je     350 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 339:	8d 5e 01             	lea    0x1(%esi),%ebx
 33c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33f:	7c cf                	jl     310 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 348:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34b:	5b                   	pop    %ebx
 34c:	5e                   	pop    %esi
 34d:	5f                   	pop    %edi
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 350:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 353:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 355:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 359:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35c:	5b                   	pop    %ebx
 35d:	5e                   	pop    %esi
 35e:	5f                   	pop    %edi
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	eb 0d                	jmp    370 <stat>
 363:	90                   	nop
 364:	90                   	nop
 365:	90                   	nop
 366:	90                   	nop
 367:	90                   	nop
 368:	90                   	nop
 369:	90                   	nop
 36a:	90                   	nop
 36b:	90                   	nop
 36c:	90                   	nop
 36d:	90                   	nop
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <stat>:

int
stat(char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	6a 00                	push   $0x0
 37a:	ff 75 08             	pushl  0x8(%ebp)
 37d:	e8 f0 00 00 00       	call   472 <open>
  if(fd < 0)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	78 27                	js     3b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	ff 75 0c             	pushl  0xc(%ebp)
 38f:	89 c3                	mov    %eax,%ebx
 391:	50                   	push   %eax
 392:	e8 f3 00 00 00       	call   48a <fstat>
 397:	89 c6                	mov    %eax,%esi
  close(fd);
 399:	89 1c 24             	mov    %ebx,(%esp)
 39c:	e8 b9 00 00 00       	call   45a <close>
  return r;
 3a1:	83 c4 10             	add    $0x10,%esp
 3a4:	89 f0                	mov    %esi,%eax
}
 3a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3b5:	eb ef                	jmp    3a6 <stat+0x36>
 3b7:	89 f6                	mov    %esi,%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 11             	movsbl (%ecx),%edx
 3ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 3cd:	3c 09                	cmp    $0x9,%al
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
 3d4:	77 1f                	ja     3f5 <atoi+0x35>
 3d6:	8d 76 00             	lea    0x0(%esi),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3e3:	83 c1 01             	add    $0x1,%ecx
 3e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ea:	0f be 11             	movsbl (%ecx),%edx
 3ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3f5:	5b                   	pop    %ebx
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    
 3f8:	90                   	nop
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
 405:	8b 5d 10             	mov    0x10(%ebp),%ebx
 408:	8b 45 08             	mov    0x8(%ebp),%eax
 40b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40e:	85 db                	test   %ebx,%ebx
 410:	7e 14                	jle    426 <memmove+0x26>
 412:	31 d2                	xor    %edx,%edx
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 418:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 41c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 41f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 422:	39 da                	cmp    %ebx,%edx
 424:	75 f2                	jne    418 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 426:	5b                   	pop    %ebx
 427:	5e                   	pop    %esi
 428:	5d                   	pop    %ebp
 429:	c3                   	ret    

0000042a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42a:	b8 01 00 00 00       	mov    $0x1,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <exit>:
SYSCALL(exit)
 432:	b8 02 00 00 00       	mov    $0x2,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <wait>:
SYSCALL(wait)
 43a:	b8 03 00 00 00       	mov    $0x3,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <pipe>:
SYSCALL(pipe)
 442:	b8 04 00 00 00       	mov    $0x4,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <read>:
SYSCALL(read)
 44a:	b8 05 00 00 00       	mov    $0x5,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <write>:
SYSCALL(write)
 452:	b8 10 00 00 00       	mov    $0x10,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <close>:
SYSCALL(close)
 45a:	b8 15 00 00 00       	mov    $0x15,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <kill>:
SYSCALL(kill)
 462:	b8 06 00 00 00       	mov    $0x6,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <exec>:
SYSCALL(exec)
 46a:	b8 07 00 00 00       	mov    $0x7,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <open>:
SYSCALL(open)
 472:	b8 0f 00 00 00       	mov    $0xf,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <mknod>:
SYSCALL(mknod)
 47a:	b8 11 00 00 00       	mov    $0x11,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <unlink>:
SYSCALL(unlink)
 482:	b8 12 00 00 00       	mov    $0x12,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <fstat>:
SYSCALL(fstat)
 48a:	b8 08 00 00 00       	mov    $0x8,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <link>:
SYSCALL(link)
 492:	b8 13 00 00 00       	mov    $0x13,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <mkdir>:
SYSCALL(mkdir)
 49a:	b8 14 00 00 00       	mov    $0x14,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <chdir>:
SYSCALL(chdir)
 4a2:	b8 09 00 00 00       	mov    $0x9,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <dup>:
SYSCALL(dup)
 4aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <getpid>:
SYSCALL(getpid)
 4b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <sbrk>:
SYSCALL(sbrk)
 4ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <sleep>:
SYSCALL(sleep)
 4c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <uptime>:
SYSCALL(uptime)
 4ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <init_taskmaster>:
#/***************** LAB QUIZ 4 *****************/
SYSCALL(init_taskmaster)
 4d2:	b8 16 00 00 00       	mov    $0x16,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <do_task>:
SYSCALL(do_task)
 4da:	b8 17 00 00 00       	mov    $0x17,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <wait_for_task_to_complete>:
SYSCALL(wait_for_task_to_complete)
 4e2:	b8 18 00 00 00       	mov    $0x18,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <wait_for_task>:
SYSCALL(wait_for_task)
 4ea:	b8 19 00 00 00       	mov    $0x19,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <task_ret>:
SYSCALL(task_ret)
 4f2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	89 c6                	mov    %eax,%esi
 508:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 50b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 50e:	85 db                	test   %ebx,%ebx
 510:	74 7e                	je     590 <printint+0x90>
 512:	89 d0                	mov    %edx,%eax
 514:	c1 e8 1f             	shr    $0x1f,%eax
 517:	84 c0                	test   %al,%al
 519:	74 75                	je     590 <printint+0x90>
    neg = 1;
    x = -xx;
 51b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 51d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 524:	f7 d8                	neg    %eax
 526:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 529:	31 ff                	xor    %edi,%edi
 52b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 52e:	89 ce                	mov    %ecx,%esi
 530:	eb 08                	jmp    53a <printint+0x3a>
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 538:	89 cf                	mov    %ecx,%edi
 53a:	31 d2                	xor    %edx,%edx
 53c:	8d 4f 01             	lea    0x1(%edi),%ecx
 53f:	f7 f6                	div    %esi
 541:	0f b6 92 b4 09 00 00 	movzbl 0x9b4(%edx),%edx
  }while((x /= base) != 0);
 548:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 54a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 54d:	75 e9                	jne    538 <printint+0x38>
  if(neg)
 54f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 552:	8b 75 c0             	mov    -0x40(%ebp),%esi
 555:	85 c0                	test   %eax,%eax
 557:	74 08                	je     561 <printint+0x61>
    buf[i++] = '-';
 559:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 55e:	8d 4f 02             	lea    0x2(%edi),%ecx
 561:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 565:	8d 76 00             	lea    0x0(%esi),%esi
 568:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56b:	83 ec 04             	sub    $0x4,%esp
 56e:	83 ef 01             	sub    $0x1,%edi
 571:	6a 01                	push   $0x1
 573:	53                   	push   %ebx
 574:	56                   	push   %esi
 575:	88 45 d7             	mov    %al,-0x29(%ebp)
 578:	e8 d5 fe ff ff       	call   452 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 57d:	83 c4 10             	add    $0x10,%esp
 580:	39 df                	cmp    %ebx,%edi
 582:	75 e4                	jne    568 <printint+0x68>
    putc(fd, buf[i]);
}
 584:	8d 65 f4             	lea    -0xc(%ebp),%esp
 587:	5b                   	pop    %ebx
 588:	5e                   	pop    %esi
 589:	5f                   	pop    %edi
 58a:	5d                   	pop    %ebp
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 590:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 592:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 599:	eb 8b                	jmp    526 <printint+0x26>
 59b:	90                   	nop
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b5:	0f b6 1e             	movzbl (%esi),%ebx
 5b8:	83 c6 01             	add    $0x1,%esi
 5bb:	84 db                	test   %bl,%bl
 5bd:	0f 84 b0 00 00 00    	je     673 <printf+0xd3>
 5c3:	31 d2                	xor    %edx,%edx
 5c5:	eb 39                	jmp    600 <printf+0x60>
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5d0:	83 f8 25             	cmp    $0x25,%eax
 5d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 5d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5db:	74 18                	je     5f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5e6:	6a 01                	push   $0x1
 5e8:	50                   	push   %eax
 5e9:	57                   	push   %edi
 5ea:	e8 63 fe ff ff       	call   452 <write>
 5ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5f2:	83 c4 10             	add    $0x10,%esp
 5f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5fc:	84 db                	test   %bl,%bl
 5fe:	74 73                	je     673 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 600:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 602:	0f be cb             	movsbl %bl,%ecx
 605:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 608:	74 c6                	je     5d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 60a:	83 fa 25             	cmp    $0x25,%edx
 60d:	75 e6                	jne    5f5 <printf+0x55>
      if(c == 'd'){
 60f:	83 f8 64             	cmp    $0x64,%eax
 612:	0f 84 f8 00 00 00    	je     710 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 618:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 61e:	83 f9 70             	cmp    $0x70,%ecx
 621:	74 5d                	je     680 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 623:	83 f8 73             	cmp    $0x73,%eax
 626:	0f 84 84 00 00 00    	je     6b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 62c:	83 f8 63             	cmp    $0x63,%eax
 62f:	0f 84 ea 00 00 00    	je     71f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 635:	83 f8 25             	cmp    $0x25,%eax
 638:	0f 84 c2 00 00 00    	je     700 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 641:	83 ec 04             	sub    $0x4,%esp
 644:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 648:	6a 01                	push   $0x1
 64a:	50                   	push   %eax
 64b:	57                   	push   %edi
 64c:	e8 01 fe ff ff       	call   452 <write>
 651:	83 c4 0c             	add    $0xc,%esp
 654:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 657:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 65a:	6a 01                	push   $0x1
 65c:	50                   	push   %eax
 65d:	57                   	push   %edi
 65e:	83 c6 01             	add    $0x1,%esi
 661:	e8 ec fd ff ff       	call   452 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 666:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 66d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66f:	84 db                	test   %bl,%bl
 671:	75 8d                	jne    600 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 673:	8d 65 f4             	lea    -0xc(%ebp),%esp
 676:	5b                   	pop    %ebx
 677:	5e                   	pop    %esi
 678:	5f                   	pop    %edi
 679:	5d                   	pop    %ebp
 67a:	c3                   	ret    
 67b:	90                   	nop
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 68d:	89 f8                	mov    %edi,%eax
 68f:	8b 13                	mov    (%ebx),%edx
 691:	e8 6a fe ff ff       	call   500 <printint>
        ap++;
 696:	89 d8                	mov    %ebx,%eax
 698:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 69d:	83 c0 04             	add    $0x4,%eax
 6a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a3:	e9 4d ff ff ff       	jmp    5f5 <printf+0x55>
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 6b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6b5:	83 c0 04             	add    $0x4,%eax
 6b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 6bb:	b8 ab 09 00 00       	mov    $0x9ab,%eax
 6c0:	85 db                	test   %ebx,%ebx
 6c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 6c5:	0f b6 03             	movzbl (%ebx),%eax
 6c8:	84 c0                	test   %al,%al
 6ca:	74 23                	je     6ef <printf+0x14f>
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6d6:	83 ec 04             	sub    $0x4,%esp
 6d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 6db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6de:	50                   	push   %eax
 6df:	57                   	push   %edi
 6e0:	e8 6d fd ff ff       	call   452 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6e5:	0f b6 03             	movzbl (%ebx),%eax
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	84 c0                	test   %al,%al
 6ed:	75 e1                	jne    6d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 ff fe ff ff       	jmp    5f5 <printf+0x55>
 6f6:	8d 76 00             	lea    0x0(%esi),%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
 703:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 706:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 709:	6a 01                	push   $0x1
 70b:	e9 4c ff ff ff       	jmp    65c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
 718:	6a 01                	push   $0x1
 71a:	e9 6b ff ff ff       	jmp    68a <printf+0xea>
 71f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 722:	83 ec 04             	sub    $0x4,%esp
 725:	8b 03                	mov    (%ebx),%eax
 727:	6a 01                	push   $0x1
 729:	88 45 e4             	mov    %al,-0x1c(%ebp)
 72c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 72f:	50                   	push   %eax
 730:	57                   	push   %edi
 731:	e8 1c fd ff ff       	call   452 <write>
 736:	e9 5b ff ff ff       	jmp    696 <printf+0xf6>
 73b:	66 90                	xchg   %ax,%ax
 73d:	66 90                	xchg   %ax,%ax
 73f:	90                   	nop

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 cc 0c 00 00       	mov    0xccc,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 750:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 753:	39 c8                	cmp    %ecx,%eax
 755:	73 19                	jae    770 <free+0x30>
 757:	89 f6                	mov    %esi,%esi
 759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 760:	39 d1                	cmp    %edx,%ecx
 762:	72 1c                	jb     780 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 d0                	cmp    %edx,%eax
 766:	73 18                	jae    780 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 768:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76e:	72 f0                	jb     760 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	39 d0                	cmp    %edx,%eax
 772:	72 f4                	jb     768 <free+0x28>
 774:	39 d1                	cmp    %edx,%ecx
 776:	73 f0                	jae    768 <free+0x28>
 778:	90                   	nop
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 780:	8b 73 fc             	mov    -0x4(%ebx),%esi
 783:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 786:	39 d7                	cmp    %edx,%edi
 788:	74 19                	je     7a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 78a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 78d:	8b 50 04             	mov    0x4(%eax),%edx
 790:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 793:	39 f1                	cmp    %esi,%ecx
 795:	74 23                	je     7ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 797:	89 08                	mov    %ecx,(%eax)
  freep = p;
 799:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7a3:	03 72 04             	add    0x4(%edx),%esi
 7a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a9:	8b 10                	mov    (%eax),%edx
 7ab:	8b 12                	mov    (%edx),%edx
 7ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7b0:	8b 50 04             	mov    0x4(%eax),%edx
 7b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b6:	39 f1                	cmp    %esi,%ecx
 7b8:	75 dd                	jne    797 <free+0x57>
    p->s.size += bp->s.size;
 7ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7bd:	a3 cc 0c 00 00       	mov    %eax,0xccc
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7ca:	5b                   	pop    %ebx
 7cb:	5e                   	pop    %esi
 7cc:	5f                   	pop    %edi
 7cd:	5d                   	pop    %ebp
 7ce:	c3                   	ret    
 7cf:	90                   	nop

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 15 cc 0c 00 00    	mov    0xccc,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 78 07             	lea    0x7(%eax),%edi
 7e5:	c1 ef 03             	shr    $0x3,%edi
 7e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7eb:	85 d2                	test   %edx,%edx
 7ed:	0f 84 a3 00 00 00    	je     896 <malloc+0xc6>
 7f3:	8b 02                	mov    (%edx),%eax
 7f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7f8:	39 cf                	cmp    %ecx,%edi
 7fa:	76 74                	jbe    870 <malloc+0xa0>
 7fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 802:	be 00 10 00 00       	mov    $0x1000,%esi
 807:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 80e:	0f 43 f7             	cmovae %edi,%esi
 811:	ba 00 80 00 00       	mov    $0x8000,%edx
 816:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 81c:	0f 46 da             	cmovbe %edx,%ebx
 81f:	eb 10                	jmp    831 <malloc+0x61>
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 82a:	8b 48 04             	mov    0x4(%eax),%ecx
 82d:	39 cf                	cmp    %ecx,%edi
 82f:	76 3f                	jbe    870 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	39 05 cc 0c 00 00    	cmp    %eax,0xccc
 837:	89 c2                	mov    %eax,%edx
 839:	75 ed                	jne    828 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 83b:	83 ec 0c             	sub    $0xc,%esp
 83e:	53                   	push   %ebx
 83f:	e8 76 fc ff ff       	call   4ba <sbrk>
  if(p == (char*)-1)
 844:	83 c4 10             	add    $0x10,%esp
 847:	83 f8 ff             	cmp    $0xffffffff,%eax
 84a:	74 1c                	je     868 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 84c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 84f:	83 ec 0c             	sub    $0xc,%esp
 852:	83 c0 08             	add    $0x8,%eax
 855:	50                   	push   %eax
 856:	e8 e5 fe ff ff       	call   740 <free>
  return freep;
 85b:	8b 15 cc 0c 00 00    	mov    0xccc,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 861:	83 c4 10             	add    $0x10,%esp
 864:	85 d2                	test   %edx,%edx
 866:	75 c0                	jne    828 <malloc+0x58>
        return 0;
 868:	31 c0                	xor    %eax,%eax
 86a:	eb 1c                	jmp    888 <malloc+0xb8>
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 870:	39 cf                	cmp    %ecx,%edi
 872:	74 1c                	je     890 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 874:	29 f9                	sub    %edi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 87f:	89 15 cc 0c 00 00    	mov    %edx,0xccc
      return (void*)(p + 1);
 885:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 888:	8d 65 f4             	lea    -0xc(%ebp),%esp
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb e9                	jmp    87f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 896:	c7 05 cc 0c 00 00 d0 	movl   $0xcd0,0xccc
 89d:	0c 00 00 
 8a0:	c7 05 d0 0c 00 00 d0 	movl   $0xcd0,0xcd0
 8a7:	0c 00 00 
    base.s.size = 0;
 8aa:	b8 d0 0c 00 00       	mov    $0xcd0,%eax
 8af:	c7 05 d4 0c 00 00 00 	movl   $0x0,0xcd4
 8b6:	00 00 00 
 8b9:	e9 3e ff ff ff       	jmp    7fc <malloc+0x2c>
