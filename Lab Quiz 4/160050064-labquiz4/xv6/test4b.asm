
_test4b:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		}
	}
}

int main()
{	
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	31 db                	xor    %ebx,%ebx
  13:	83 ec 28             	sub    $0x28,%esp
	int pid;
	int pids[NWORKERS];
	int results[NTASKS];

	init_taskmaster();
  16:	e8 d7 04 00 00       	call   4f2 <init_taskmaster>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  1b:	e8 2a 04 00 00       	call   44a <fork>
		if(pid == 0)
  20:	85 c0                	test   %eax,%eax
  22:	89 c6                	mov    %eax,%esi
  24:	0f 84 e3 00 00 00    	je     10d <main+0x10d>
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		pids[i] = pid;
	}

	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
  30:	f6 c3 01             	test   $0x1,%bl
			do_task((char *)task1, 100 + i,	i, i+2);
  33:	8d 43 02             	lea    0x2(%ebx),%eax
		pids[i] = pid;
	}

	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
  36:	0f 85 9c 00 00 00    	jne    d8 <main+0xd8>
			do_task((char *)task1, 100 + i,	i, i+2);
  3c:	50                   	push   %eax
  3d:	8d 43 64             	lea    0x64(%ebx),%eax
  40:	53                   	push   %ebx
  41:	50                   	push   %eax
  42:	68 20 01 00 00       	push   $0x120
  47:	e8 ae 04 00 00       	call   4fa <do_task>
  4c:	83 c4 10             	add    $0x10,%esp
			worker_thread();
						
		pids[i] = pid;
	}

	for(int i=0; i<NTASKS; i++)
  4f:	83 c3 01             	add    $0x1,%ebx
  52:	83 fb 05             	cmp    $0x5,%ebx
  55:	75 d9                	jne    30 <main+0x30>
  57:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  5a:	bb 68 00 00 00       	mov    $0x68,%ebx
		else
			do_task((char *)task2, 100 + i, i, i+2);
	}

	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + NTASKS - i - 1, &results[NTASKS-1-i]);
  5f:	83 ec 08             	sub    $0x8,%esp
  62:	57                   	push   %edi
  63:	53                   	push   %ebx
  64:	83 eb 01             	sub    $0x1,%ebx
  67:	83 ef 04             	sub    $0x4,%edi
  6a:	e8 93 04 00 00       	call   502 <wait_for_task_to_complete>
			do_task((char *)task1, 100 + i,	i, i+2);
		else
			do_task((char *)task2, 100 + i, i, i+2);
	}

	for(int i=0; i<NTASKS; i++)
  6f:	83 c4 10             	add    $0x10,%esp
  72:	83 fb 63             	cmp    $0x63,%ebx
  75:	75 e8                	jne    5f <main+0x5f>
		wait_for_task_to_complete(100 + NTASKS - i - 1, &results[NTASKS-1-i]);

	printf(1, "\n--------------------------------------\n");
  77:	83 ec 08             	sub    $0x8,%esp
	for(int i=0; i<NTASKS; i++)
  7a:	31 db                	xor    %ebx,%ebx
	}

	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + NTASKS - i - 1, &results[NTASKS-1-i]);

	printf(1, "\n--------------------------------------\n");
  7c:	68 78 09 00 00       	push   $0x978
  81:	6a 01                	push   $0x1
  83:	e8 38 05 00 00       	call   5c0 <printf>
  88:	83 c4 10             	add    $0x10,%esp
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
  8b:	f6 c3 01             	test   $0x1,%bl
  8e:	75 60                	jne    f0 <main+0xf0>
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
  90:	8d 43 02             	lea    0x2(%ebx),%eax
  93:	83 ec 0c             	sub    $0xc,%esp
  96:	ff 74 9d d4          	pushl  -0x2c(%ebp,%ebx,4)
  9a:	50                   	push   %eax
  9b:	53                   	push   %ebx
  9c:	68 bb 09 00 00       	push   $0x9bb
  a1:	6a 01                	push   $0x1
  a3:	e8 18 05 00 00       	call   5c0 <printf>
  a8:	83 c4 20             	add    $0x20,%esp

	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + NTASKS - i - 1, &results[NTASKS-1-i]);

	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
  ab:	83 c3 01             	add    $0x1,%ebx
  ae:	83 fb 05             	cmp    $0x5,%ebx
  b1:	75 d8                	jne    8b <main+0x8b>
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	sleep(200);
  b3:	83 ec 0c             	sub    $0xc,%esp
  b6:	68 c8 00 00 00       	push   $0xc8
  bb:	e8 22 04 00 00       	call   4e2 <sleep>
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);
  c0:	89 34 24             	mov    %esi,(%esp)
  c3:	e8 ba 03 00 00       	call   482 <kill>

	for(int i=0; i<NWORKERS; i++)
		wait();
  c8:	e8 8d 03 00 00       	call   45a <wait>

	exit();
  cd:	e8 80 03 00 00       	call   452 <exit>
  d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			do_task((char *)task1, 100 + i,	i, i+2);
		else
			do_task((char *)task2, 100 + i, i, i+2);
  d8:	50                   	push   %eax
  d9:	8d 43 64             	lea    0x64(%ebx),%eax
  dc:	53                   	push   %ebx
  dd:	50                   	push   %eax
  de:	68 70 01 00 00       	push   $0x170
  e3:	e8 12 04 00 00       	call   4fa <do_task>
  e8:	83 c4 10             	add    $0x10,%esp
  eb:	e9 5f ff ff ff       	jmp    4f <main+0x4f>
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
  f0:	8d 43 02             	lea    0x2(%ebx),%eax
  f3:	83 ec 0c             	sub    $0xc,%esp
  f6:	ff 74 9d d4          	pushl  -0x2c(%ebp,%ebx,4)
  fa:	50                   	push   %eax
  fb:	53                   	push   %ebx
  fc:	68 d3 09 00 00       	push   $0x9d3
 101:	6a 01                	push   $0x1
 103:	e8 b8 04 00 00       	call   5c0 <printf>
 108:	83 c4 20             	add    $0x20,%esp
 10b:	eb 9e                	jmp    ab <main+0xab>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
 10d:	e8 ae 00 00 00       	call   1c0 <worker_thread>
 112:	66 90                	xchg   %ax,%ax
 114:	66 90                	xchg   %ax,%ax
 116:	66 90                	xchg   %ax,%ax
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <task1>:

#define NWORKERS 1
#define NTASKS 5

void task1(int id, int a, int b)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	83 ec 18             	sub    $0x18,%esp
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(5);
 12f:	6a 05                	push   $0x5

#define NWORKERS 1
#define NTASKS 5

void task1(int id, int a, int b)
{
 131:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(5);
 134:	e8 a9 03 00 00       	call   4e2 <sleep>
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 139:	e8 94 03 00 00       	call   4d2 <getpid>
 13e:	5a                   	pop    %edx
 13f:	59                   	pop    %ecx
 140:	53                   	push   %ebx
 141:	57                   	push   %edi

	result = a + b;

	task_ret(id, result);
 142:	01 fb                	add    %edi,%ebx
void task1(int id, int a, int b)
{
	int result;

	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 144:	56                   	push   %esi
 145:	50                   	push   %eax
 146:	68 e0 08 00 00       	push   $0x8e0
 14b:	6a 01                	push   $0x1
 14d:	e8 6e 04 00 00       	call   5c0 <printf>

	result = a + b;

	task_ret(id, result);
 152:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 155:	89 75 08             	mov    %esi,0x8(%ebp)
 158:	83 c4 20             	add    $0x20,%esp
}
 15b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15e:	5b                   	pop    %ebx
 15f:	5e                   	pop    %esi
 160:	5f                   	pop    %edi
 161:	5d                   	pop    %ebp
	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;

	task_ret(id, result);
 162:	e9 ab 03 00 00       	jmp    512 <task_ret>
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <task2>:
}

void task2(int id, int a, int b)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
 176:	83 ec 18             	sub    $0x18,%esp
 179:	8b 7d 0c             	mov    0xc(%ebp),%edi
 17c:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(15);
 17f:	6a 0f                	push   $0xf

	task_ret(id, result);
}

void task2(int id, int a, int b)
{
 181:	8b 75 08             	mov    0x8(%ebp),%esi
	int result;

	sleep(15);
 184:	e8 59 03 00 00       	call   4e2 <sleep>
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 189:	e8 44 03 00 00       	call   4d2 <getpid>
 18e:	5a                   	pop    %edx
 18f:	59                   	pop    %ecx
 190:	53                   	push   %ebx
 191:	57                   	push   %edi
	
	result = a * b;

	task_ret(id, result);
 192:	0f af df             	imul   %edi,%ebx
void task2(int id, int a, int b)
{
	int result;

	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 195:	56                   	push   %esi
 196:	50                   	push   %eax
 197:	68 10 09 00 00       	push   $0x910
 19c:	6a 01                	push   $0x1
 19e:	e8 1d 04 00 00       	call   5c0 <printf>
	
	result = a * b;

	task_ret(id, result);
 1a3:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 1a6:	89 75 08             	mov    %esi,0x8(%ebp)
 1a9:	83 c4 20             	add    $0x20,%esp
}
 1ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5f                   	pop    %edi
 1b2:	5d                   	pop    %ebp
	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	
	result = a * b;

	task_ret(id, result);
 1b3:	e9 5a 03 00 00       	jmp    512 <task_ret>
 1b8:	90                   	nop
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <worker_thread>:
}

void worker_thread()
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
	int count = 0;
 1c4:	31 f6                	xor    %esi,%esi

	task_ret(id, result);
}

void worker_thread()
{
 1c6:	53                   	push   %ebx
 1c7:	eb 24                	jmp    1ed <worker_thread+0x2d>
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 1d0:	e8 fd 02 00 00       	call   4d2 <getpid>
	while(1)
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
 1d5:	83 c6 01             	add    $0x1,%esi
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	56                   	push   %esi
 1dd:	50                   	push   %eax
 1de:	68 40 09 00 00       	push   $0x940
 1e3:	6a 01                	push   $0x1
 1e5:	e8 d6 03 00 00       	call   5c0 <printf>
		else
		{
			printf(1, "wait for task failed \n");
			exit();
		}
	}
 1ea:	83 c4 20             	add    $0x20,%esp
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 1ed:	e8 18 03 00 00       	call   50a <wait_for_task>
		if(ret > 0)
 1f2:	85 c0                	test   %eax,%eax
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 1f4:	89 c3                	mov    %eax,%ebx
		if(ret > 0)
 1f6:	7f d8                	jg     1d0 <worker_thread+0x10>
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
 1f8:	83 ec 08             	sub    $0x8,%esp
 1fb:	68 a4 09 00 00       	push   $0x9a4
 200:	6a 01                	push   $0x1
 202:	e8 b9 03 00 00       	call   5c0 <printf>
			exit();
 207:	e8 46 02 00 00       	call   452 <exit>
 20c:	66 90                	xchg   %ax,%ax
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 21a:	89 c2                	mov    %eax,%edx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 220:	83 c1 01             	add    $0x1,%ecx
 223:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 227:	83 c2 01             	add    $0x1,%edx
 22a:	84 db                	test   %bl,%bl
 22c:	88 5a ff             	mov    %bl,-0x1(%edx)
 22f:	75 ef                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 231:	5b                   	pop    %ebx
 232:	5d                   	pop    %ebp
 233:	c3                   	ret    
 234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 23a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
 245:	8b 55 08             	mov    0x8(%ebp),%edx
 248:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 24b:	0f b6 02             	movzbl (%edx),%eax
 24e:	0f b6 19             	movzbl (%ecx),%ebx
 251:	84 c0                	test   %al,%al
 253:	75 1e                	jne    273 <strcmp+0x33>
 255:	eb 29                	jmp    280 <strcmp+0x40>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 260:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 263:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 266:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 269:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 26d:	84 c0                	test   %al,%al
 26f:	74 0f                	je     280 <strcmp+0x40>
 271:	89 f1                	mov    %esi,%ecx
 273:	38 d8                	cmp    %bl,%al
 275:	74 e9                	je     260 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 277:	29 d8                	sub    %ebx,%eax
}
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 280:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 282:	29 d8                	sub    %ebx,%eax
}
 284:	5b                   	pop    %ebx
 285:	5e                   	pop    %esi
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
 288:	90                   	nop
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <strlen>:

uint
strlen(char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 296:	80 39 00             	cmpb   $0x0,(%ecx)
 299:	74 12                	je     2ad <strlen+0x1d>
 29b:	31 d2                	xor    %edx,%edx
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2a7:	89 d0                	mov    %edx,%eax
 2a9:	75 f5                	jne    2a0 <strlen+0x10>
    ;
  return n;
}
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 2ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    
 2b1:	eb 0d                	jmp    2c0 <memset>
 2b3:	90                   	nop
 2b4:	90                   	nop
 2b5:	90                   	nop
 2b6:	90                   	nop
 2b7:	90                   	nop
 2b8:	90                   	nop
 2b9:	90                   	nop
 2ba:	90                   	nop
 2bb:	90                   	nop
 2bc:	90                   	nop
 2bd:	90                   	nop
 2be:	90                   	nop
 2bf:	90                   	nop

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ea:	0f b6 10             	movzbl (%eax),%edx
 2ed:	84 d2                	test   %dl,%dl
 2ef:	74 1d                	je     30e <strchr+0x2e>
    if(*s == c)
 2f1:	38 d3                	cmp    %dl,%bl
 2f3:	89 d9                	mov    %ebx,%ecx
 2f5:	75 0d                	jne    304 <strchr+0x24>
 2f7:	eb 17                	jmp    310 <strchr+0x30>
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	38 ca                	cmp    %cl,%dl
 302:	74 0c                	je     310 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 304:	83 c0 01             	add    $0x1,%eax
 307:	0f b6 10             	movzbl (%eax),%edx
 30a:	84 d2                	test   %dl,%dl
 30c:	75 f2                	jne    300 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 30e:	31 c0                	xor    %eax,%eax
}
 310:	5b                   	pop    %ebx
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <gets>:

char*
gets(char *buf, int max)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 326:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 328:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 32b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32e:	eb 29                	jmp    359 <gets+0x39>
    cc = read(0, &c, 1);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	6a 01                	push   $0x1
 335:	57                   	push   %edi
 336:	6a 00                	push   $0x0
 338:	e8 2d 01 00 00       	call   46a <read>
    if(cc < 1)
 33d:	83 c4 10             	add    $0x10,%esp
 340:	85 c0                	test   %eax,%eax
 342:	7e 1d                	jle    361 <gets+0x41>
      break;
    buf[i++] = c;
 344:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 348:	8b 55 08             	mov    0x8(%ebp),%edx
 34b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 34d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 34f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 353:	74 1b                	je     370 <gets+0x50>
 355:	3c 0d                	cmp    $0xd,%al
 357:	74 17                	je     370 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 359:	8d 5e 01             	lea    0x1(%esi),%ebx
 35c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 35f:	7c cf                	jl     330 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 368:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36b:	5b                   	pop    %ebx
 36c:	5e                   	pop    %esi
 36d:	5f                   	pop    %edi
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 370:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 373:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 375:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 379:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37c:	5b                   	pop    %ebx
 37d:	5e                   	pop    %esi
 37e:	5f                   	pop    %edi
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <stat>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <stat>:

int
stat(char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	6a 00                	push   $0x0
 39a:	ff 75 08             	pushl  0x8(%ebp)
 39d:	e8 f0 00 00 00       	call   492 <open>
  if(fd < 0)
 3a2:	83 c4 10             	add    $0x10,%esp
 3a5:	85 c0                	test   %eax,%eax
 3a7:	78 27                	js     3d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	ff 75 0c             	pushl  0xc(%ebp)
 3af:	89 c3                	mov    %eax,%ebx
 3b1:	50                   	push   %eax
 3b2:	e8 f3 00 00 00       	call   4aa <fstat>
 3b7:	89 c6                	mov    %eax,%esi
  close(fd);
 3b9:	89 1c 24             	mov    %ebx,(%esp)
 3bc:	e8 b9 00 00 00       	call   47a <close>
  return r;
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	89 f0                	mov    %esi,%eax
}
 3c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c9:	5b                   	pop    %ebx
 3ca:	5e                   	pop    %esi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	eb ef                	jmp    3c6 <stat+0x36>
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 11             	movsbl (%ecx),%edx
 3ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ed:	3c 09                	cmp    $0x9,%al
 3ef:	b8 00 00 00 00       	mov    $0x0,%eax
 3f4:	77 1f                	ja     415 <atoi+0x35>
 3f6:	8d 76 00             	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 400:	8d 04 80             	lea    (%eax,%eax,4),%eax
 403:	83 c1 01             	add    $0x1,%ecx
 406:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40a:	0f be 11             	movsbl (%ecx),%edx
 40d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 415:	5b                   	pop    %ebx
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
 418:	90                   	nop
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
 425:	8b 5d 10             	mov    0x10(%ebp),%ebx
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42e:	85 db                	test   %ebx,%ebx
 430:	7e 14                	jle    446 <memmove+0x26>
 432:	31 d2                	xor    %edx,%edx
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 438:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 43c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 43f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 442:	39 da                	cmp    %ebx,%edx
 444:	75 f2                	jne    438 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    

0000044a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44a:	b8 01 00 00 00       	mov    $0x1,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <exit>:
SYSCALL(exit)
 452:	b8 02 00 00 00       	mov    $0x2,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <wait>:
SYSCALL(wait)
 45a:	b8 03 00 00 00       	mov    $0x3,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <pipe>:
SYSCALL(pipe)
 462:	b8 04 00 00 00       	mov    $0x4,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <read>:
SYSCALL(read)
 46a:	b8 05 00 00 00       	mov    $0x5,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <write>:
SYSCALL(write)
 472:	b8 10 00 00 00       	mov    $0x10,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <close>:
SYSCALL(close)
 47a:	b8 15 00 00 00       	mov    $0x15,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <kill>:
SYSCALL(kill)
 482:	b8 06 00 00 00       	mov    $0x6,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <exec>:
SYSCALL(exec)
 48a:	b8 07 00 00 00       	mov    $0x7,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <open>:
SYSCALL(open)
 492:	b8 0f 00 00 00       	mov    $0xf,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <mknod>:
SYSCALL(mknod)
 49a:	b8 11 00 00 00       	mov    $0x11,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <unlink>:
SYSCALL(unlink)
 4a2:	b8 12 00 00 00       	mov    $0x12,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <fstat>:
SYSCALL(fstat)
 4aa:	b8 08 00 00 00       	mov    $0x8,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <link>:
SYSCALL(link)
 4b2:	b8 13 00 00 00       	mov    $0x13,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <mkdir>:
SYSCALL(mkdir)
 4ba:	b8 14 00 00 00       	mov    $0x14,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <chdir>:
SYSCALL(chdir)
 4c2:	b8 09 00 00 00       	mov    $0x9,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <dup>:
SYSCALL(dup)
 4ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <getpid>:
SYSCALL(getpid)
 4d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <sbrk>:
SYSCALL(sbrk)
 4da:	b8 0c 00 00 00       	mov    $0xc,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <sleep>:
SYSCALL(sleep)
 4e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <uptime>:
SYSCALL(uptime)
 4ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <init_taskmaster>:
#/***************** LAB QUIZ 4 *****************/
SYSCALL(init_taskmaster)
 4f2:	b8 16 00 00 00       	mov    $0x16,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <do_task>:
SYSCALL(do_task)
 4fa:	b8 17 00 00 00       	mov    $0x17,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <wait_for_task_to_complete>:
SYSCALL(wait_for_task_to_complete)
 502:	b8 18 00 00 00       	mov    $0x18,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait_for_task>:
SYSCALL(wait_for_task)
 50a:	b8 19 00 00 00       	mov    $0x19,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <task_ret>:
SYSCALL(task_ret)
 512:	b8 1a 00 00 00       	mov    $0x1a,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	89 c6                	mov    %eax,%esi
 528:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 52b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 52e:	85 db                	test   %ebx,%ebx
 530:	74 7e                	je     5b0 <printint+0x90>
 532:	89 d0                	mov    %edx,%eax
 534:	c1 e8 1f             	shr    $0x1f,%eax
 537:	84 c0                	test   %al,%al
 539:	74 75                	je     5b0 <printint+0x90>
    neg = 1;
    x = -xx;
 53b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 53d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 544:	f7 d8                	neg    %eax
 546:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 549:	31 ff                	xor    %edi,%edi
 54b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 54e:	89 ce                	mov    %ecx,%esi
 550:	eb 08                	jmp    55a <printint+0x3a>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 558:	89 cf                	mov    %ecx,%edi
 55a:	31 d2                	xor    %edx,%edx
 55c:	8d 4f 01             	lea    0x1(%edi),%ecx
 55f:	f7 f6                	div    %esi
 561:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
  }while((x /= base) != 0);
 568:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 56a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 56d:	75 e9                	jne    558 <printint+0x38>
  if(neg)
 56f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 572:	8b 75 c0             	mov    -0x40(%ebp),%esi
 575:	85 c0                	test   %eax,%eax
 577:	74 08                	je     581 <printint+0x61>
    buf[i++] = '-';
 579:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 57e:	8d 4f 02             	lea    0x2(%edi),%ecx
 581:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 585:	8d 76 00             	lea    0x0(%esi),%esi
 588:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	83 ef 01             	sub    $0x1,%edi
 591:	6a 01                	push   $0x1
 593:	53                   	push   %ebx
 594:	56                   	push   %esi
 595:	88 45 d7             	mov    %al,-0x29(%ebp)
 598:	e8 d5 fe ff ff       	call   472 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	39 df                	cmp    %ebx,%edi
 5a2:	75 e4                	jne    588 <printint+0x68>
    putc(fd, buf[i]);
}
 5a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5b9:	eb 8b                	jmp    546 <printint+0x26>
 5bb:	90                   	nop
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d5:	0f b6 1e             	movzbl (%esi),%ebx
 5d8:	83 c6 01             	add    $0x1,%esi
 5db:	84 db                	test   %bl,%bl
 5dd:	0f 84 b0 00 00 00    	je     693 <printf+0xd3>
 5e3:	31 d2                	xor    %edx,%edx
 5e5:	eb 39                	jmp    620 <printf+0x60>
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5f0:	83 f8 25             	cmp    $0x25,%eax
 5f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 5f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5fb:	74 18                	je     615 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 606:	6a 01                	push   $0x1
 608:	50                   	push   %eax
 609:	57                   	push   %edi
 60a:	e8 63 fe ff ff       	call   472 <write>
 60f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 612:	83 c4 10             	add    $0x10,%esp
 615:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 618:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 61c:	84 db                	test   %bl,%bl
 61e:	74 73                	je     693 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 620:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 622:	0f be cb             	movsbl %bl,%ecx
 625:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 628:	74 c6                	je     5f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 62a:	83 fa 25             	cmp    $0x25,%edx
 62d:	75 e6                	jne    615 <printf+0x55>
      if(c == 'd'){
 62f:	83 f8 64             	cmp    $0x64,%eax
 632:	0f 84 f8 00 00 00    	je     730 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 638:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 63e:	83 f9 70             	cmp    $0x70,%ecx
 641:	74 5d                	je     6a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 643:	83 f8 73             	cmp    $0x73,%eax
 646:	0f 84 84 00 00 00    	je     6d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64c:	83 f8 63             	cmp    $0x63,%eax
 64f:	0f 84 ea 00 00 00    	je     73f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 655:	83 f8 25             	cmp    $0x25,%eax
 658:	0f 84 c2 00 00 00    	je     720 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 65e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 661:	83 ec 04             	sub    $0x4,%esp
 664:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 668:	6a 01                	push   $0x1
 66a:	50                   	push   %eax
 66b:	57                   	push   %edi
 66c:	e8 01 fe ff ff       	call   472 <write>
 671:	83 c4 0c             	add    $0xc,%esp
 674:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 677:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 67a:	6a 01                	push   $0x1
 67c:	50                   	push   %eax
 67d:	57                   	push   %edi
 67e:	83 c6 01             	add    $0x1,%esi
 681:	e8 ec fd ff ff       	call   472 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 686:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 68f:	84 db                	test   %bl,%bl
 691:	75 8d                	jne    620 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 693:	8d 65 f4             	lea    -0xc(%ebp),%esp
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    
 69b:	90                   	nop
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a8:	6a 00                	push   $0x0
 6aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6ad:	89 f8                	mov    %edi,%eax
 6af:	8b 13                	mov    (%ebx),%edx
 6b1:	e8 6a fe ff ff       	call   520 <printint>
        ap++;
 6b6:	89 d8                	mov    %ebx,%eax
 6b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c3:	e9 4d ff ff ff       	jmp    615 <printf+0x55>
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6d5:	83 c0 04             	add    $0x4,%eax
 6d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 6db:	b8 eb 09 00 00       	mov    $0x9eb,%eax
 6e0:	85 db                	test   %ebx,%ebx
 6e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 6e5:	0f b6 03             	movzbl (%ebx),%eax
 6e8:	84 c0                	test   %al,%al
 6ea:	74 23                	je     70f <printf+0x14f>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6f6:	83 ec 04             	sub    $0x4,%esp
 6f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 6fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6fe:	50                   	push   %eax
 6ff:	57                   	push   %edi
 700:	e8 6d fd ff ff       	call   472 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 705:	0f b6 03             	movzbl (%ebx),%eax
 708:	83 c4 10             	add    $0x10,%esp
 70b:	84 c0                	test   %al,%al
 70d:	75 e1                	jne    6f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 ff fe ff ff       	jmp    615 <printf+0x55>
 716:	8d 76 00             	lea    0x0(%esi),%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 726:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 729:	6a 01                	push   $0x1
 72b:	e9 4c ff ff ff       	jmp    67c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	e9 6b ff ff ff       	jmp    6aa <printf+0xea>
 73f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 742:	83 ec 04             	sub    $0x4,%esp
 745:	8b 03                	mov    (%ebx),%eax
 747:	6a 01                	push   $0x1
 749:	88 45 e4             	mov    %al,-0x1c(%ebp)
 74c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 74f:	50                   	push   %eax
 750:	57                   	push   %edi
 751:	e8 1c fd ff ff       	call   472 <write>
 756:	e9 5b ff ff ff       	jmp    6b6 <printf+0xf6>
 75b:	66 90                	xchg   %ax,%ax
 75d:	66 90                	xchg   %ax,%ax
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 10 0d 00 00       	mov    0xd10,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 770:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 773:	39 c8                	cmp    %ecx,%eax
 775:	73 19                	jae    790 <free+0x30>
 777:	89 f6                	mov    %esi,%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 780:	39 d1                	cmp    %edx,%ecx
 782:	72 1c                	jb     7a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 d0                	cmp    %edx,%eax
 786:	73 18                	jae    7a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 788:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78e:	72 f0                	jb     780 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 f4                	jb     788 <free+0x28>
 794:	39 d1                	cmp    %edx,%ecx
 796:	73 f0                	jae    788 <free+0x28>
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a6:	39 d7                	cmp    %edx,%edi
 7a8:	74 19                	je     7c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	74 23                	je     7da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b9:	a3 10 0d 00 00       	mov    %eax,0xd10
}
 7be:	5b                   	pop    %ebx
 7bf:	5e                   	pop    %esi
 7c0:	5f                   	pop    %edi
 7c1:	5d                   	pop    %ebp
 7c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7c3:	03 72 04             	add    0x4(%edx),%esi
 7c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c9:	8b 10                	mov    (%eax),%edx
 7cb:	8b 12                	mov    (%edx),%edx
 7cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d0:	8b 50 04             	mov    0x4(%eax),%edx
 7d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d6:	39 f1                	cmp    %esi,%ecx
 7d8:	75 dd                	jne    7b7 <free+0x57>
    p->s.size += bp->s.size;
 7da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7dd:	a3 10 0d 00 00       	mov    %eax,0xd10
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 10 0d 00 00    	mov    0xd10,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 a3 00 00 00    	je     8b6 <malloc+0xc6>
 813:	8b 02                	mov    (%edx),%eax
 815:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 818:	39 cf                	cmp    %ecx,%edi
 81a:	76 74                	jbe    890 <malloc+0xa0>
 81c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 822:	be 00 10 00 00       	mov    $0x1000,%esi
 827:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 82e:	0f 43 f7             	cmovae %edi,%esi
 831:	ba 00 80 00 00       	mov    $0x8000,%edx
 836:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 83c:	0f 46 da             	cmovbe %edx,%ebx
 83f:	eb 10                	jmp    851 <malloc+0x61>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 cf                	cmp    %ecx,%edi
 84f:	76 3f                	jbe    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	39 05 10 0d 00 00    	cmp    %eax,0xd10
 857:	89 c2                	mov    %eax,%edx
 859:	75 ed                	jne    848 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	53                   	push   %ebx
 85f:	e8 76 fc ff ff       	call   4da <sbrk>
  if(p == (char*)-1)
 864:	83 c4 10             	add    $0x10,%esp
 867:	83 f8 ff             	cmp    $0xffffffff,%eax
 86a:	74 1c                	je     888 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 86c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 86f:	83 ec 0c             	sub    $0xc,%esp
 872:	83 c0 08             	add    $0x8,%eax
 875:	50                   	push   %eax
 876:	e8 e5 fe ff ff       	call   760 <free>
  return freep;
 87b:	8b 15 10 0d 00 00    	mov    0xd10,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 881:	83 c4 10             	add    $0x10,%esp
 884:	85 d2                	test   %edx,%edx
 886:	75 c0                	jne    848 <malloc+0x58>
        return 0;
 888:	31 c0                	xor    %eax,%eax
 88a:	eb 1c                	jmp    8a8 <malloc+0xb8>
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 1c                	je     8b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 89f:	89 15 10 0d 00 00    	mov    %edx,0xd10
      return (void*)(p + 1);
 8a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb e9                	jmp    89f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 05 10 0d 00 00 14 	movl   $0xd14,0xd10
 8bd:	0d 00 00 
 8c0:	c7 05 14 0d 00 00 14 	movl   $0xd14,0xd14
 8c7:	0d 00 00 
    base.s.size = 0;
 8ca:	b8 14 0d 00 00       	mov    $0xd14,%eax
 8cf:	c7 05 18 0d 00 00 00 	movl   $0x0,0xd18
 8d6:	00 00 00 
 8d9:	e9 3e ff ff ff       	jmp    81c <malloc+0x2c>
