
_test2:     file format elf32-i386


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
  13:	e8 8a 05 00 00       	call   5a2 <init_taskmaster>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  18:	e8 dd 04 00 00       	call   4fa <fork>
		if(pid == 0)
  1d:	85 c0                	test   %eax,%eax
  1f:	0f 84 80 01 00 00    	je     1a5 <main+0x1a5>
  25:	89 c3                	mov    %eax,%ebx

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  27:	e8 ce 04 00 00       	call   4fa <fork>
		if(pid == 0)
  2c:	85 c0                	test   %eax,%eax

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  2e:	89 c6                	mov    %eax,%esi
		if(pid == 0)
  30:	0f 84 6f 01 00 00    	je     1a5 <main+0x1a5>
			worker_thread();
						
		pids[i] = pid;
	}

	if(do_task((char *)task1, 100,	10, 11) < 0)
  36:	6a 0b                	push   $0xb
  38:	6a 0a                	push   $0xa
  3a:	6a 64                	push   $0x64
  3c:	68 b0 01 00 00       	push   $0x1b0
  41:	e8 64 05 00 00       	call   5aa <do_task>
  46:	83 c4 10             	add    $0x10,%esp
  49:	85 c0                	test   %eax,%eax
  4b:	0f 88 ca 00 00 00    	js     11b <main+0x11b>
		printf(1, "do_task failed. task ID: %d \n", 100);

	if(do_task((char *)task2, 101, 20, 21) < 0)
  51:	6a 15                	push   $0x15
  53:	6a 14                	push   $0x14
  55:	6a 65                	push   $0x65
  57:	68 10 02 00 00       	push   $0x210
  5c:	e8 49 05 00 00       	call   5aa <do_task>
  61:	83 c4 10             	add    $0x10,%esp
  64:	85 c0                	test   %eax,%eax
  66:	0f 88 c6 00 00 00    	js     132 <main+0x132>
		printf(1, "do_task failed. task ID: %d \n", 101);

	if(do_task((char *)task1, 101, 30, 31) < 0)
  6c:	6a 1f                	push   $0x1f
  6e:	6a 1e                	push   $0x1e
  70:	6a 65                	push   $0x65
  72:	68 b0 01 00 00       	push   $0x1b0
  77:	e8 2e 05 00 00       	call   5aa <do_task>
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	85 c0                	test   %eax,%eax
  81:	0f 88 c2 00 00 00    	js     149 <main+0x149>
		printf(1, "do_task failed. task ID: %d \n", 101);

	sleep(10);
  87:	83 ec 0c             	sub    $0xc,%esp
  8a:	6a 0a                	push   $0xa
  8c:	e8 01 05 00 00       	call   592 <sleep>

	if(wait_for_task_to_complete(100, &result1) < 0)
  91:	58                   	pop    %eax
  92:	8d 45 dc             	lea    -0x24(%ebp),%eax
  95:	5a                   	pop    %edx
  96:	50                   	push   %eax
  97:	6a 64                	push   $0x64
  99:	e8 14 05 00 00       	call   5b2 <wait_for_task_to_complete>
  9e:	83 c4 10             	add    $0x10,%esp
  a1:	85 c0                	test   %eax,%eax
  a3:	0f 88 b7 00 00 00    	js     160 <main+0x160>
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 100);

	if(wait_for_task_to_complete(101, &result2) < 0)
  a9:	8d 45 e0             	lea    -0x20(%ebp),%eax
  ac:	83 ec 08             	sub    $0x8,%esp
  af:	50                   	push   %eax
  b0:	6a 65                	push   $0x65
  b2:	e8 fb 04 00 00       	call   5b2 <wait_for_task_to_complete>
  b7:	83 c4 10             	add    $0x10,%esp
  ba:	85 c0                	test   %eax,%eax
  bc:	0f 88 b5 00 00 00    	js     177 <main+0x177>
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 101);

	if(wait_for_task_to_complete(101, &result3) < 0)
  c2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	50                   	push   %eax
  c9:	6a 65                	push   $0x65
  cb:	e8 e2 04 00 00       	call   5b2 <wait_for_task_to_complete>
  d0:	83 c4 10             	add    $0x10,%esp
  d3:	85 c0                	test   %eax,%eax
  d5:	0f 88 b3 00 00 00    	js     18e <main+0x18e>
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 101);

	sleep(100);
  db:	83 ec 0c             	sub    $0xc,%esp
  de:	6a 64                	push   $0x64
  e0:	e8 ad 04 00 00       	call   592 <sleep>
	printf(1, "\n\nResult (100): %d.  Result (101): %d. Result (102): %d. \n", result1, result2, result3);
  e5:	58                   	pop    %eax
  e6:	ff 75 e4             	pushl  -0x1c(%ebp)
  e9:	ff 75 e0             	pushl  -0x20(%ebp)
  ec:	ff 75 dc             	pushl  -0x24(%ebp)
  ef:	68 58 0a 00 00       	push   $0xa58
  f4:	6a 01                	push   $0x1
  f6:	e8 75 05 00 00       	call   670 <printf>

	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);
  fb:	83 c4 14             	add    $0x14,%esp
  fe:	53                   	push   %ebx
  ff:	e8 2e 04 00 00       	call   532 <kill>
 104:	89 34 24             	mov    %esi,(%esp)
 107:	e8 26 04 00 00       	call   532 <kill>

	for(int i=0; i<NWORKERS; i++)
		wait();
 10c:	e8 f9 03 00 00       	call   50a <wait>
 111:	e8 f4 03 00 00       	call   50a <wait>

	exit();
 116:	e8 e7 03 00 00       	call   502 <exit>
						
		pids[i] = pid;
	}

	if(do_task((char *)task1, 100,	10, 11) < 0)
		printf(1, "do_task failed. task ID: %d \n", 100);
 11b:	50                   	push   %eax
 11c:	6a 64                	push   $0x64
 11e:	68 ab 0a 00 00       	push   $0xaab
 123:	6a 01                	push   $0x1
 125:	e8 46 05 00 00       	call   670 <printf>
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	e9 1f ff ff ff       	jmp    51 <main+0x51>

	if(do_task((char *)task2, 101, 20, 21) < 0)
		printf(1, "do_task failed. task ID: %d \n", 101);
 132:	50                   	push   %eax
 133:	6a 65                	push   $0x65
 135:	68 ab 0a 00 00       	push   $0xaab
 13a:	6a 01                	push   $0x1
 13c:	e8 2f 05 00 00       	call   670 <printf>
 141:	83 c4 10             	add    $0x10,%esp
 144:	e9 23 ff ff ff       	jmp    6c <main+0x6c>

	if(do_task((char *)task1, 101, 30, 31) < 0)
		printf(1, "do_task failed. task ID: %d \n", 101);
 149:	51                   	push   %ecx
 14a:	6a 65                	push   $0x65
 14c:	68 ab 0a 00 00       	push   $0xaab
 151:	6a 01                	push   $0x1
 153:	e8 18 05 00 00       	call   670 <printf>
 158:	83 c4 10             	add    $0x10,%esp
 15b:	e9 27 ff ff ff       	jmp    87 <main+0x87>

	sleep(10);

	if(wait_for_task_to_complete(100, &result1) < 0)
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 100);
 160:	50                   	push   %eax
 161:	6a 64                	push   $0x64
 163:	68 28 0a 00 00       	push   $0xa28
 168:	6a 01                	push   $0x1
 16a:	e8 01 05 00 00       	call   670 <printf>
 16f:	83 c4 10             	add    $0x10,%esp
 172:	e9 32 ff ff ff       	jmp    a9 <main+0xa9>

	if(wait_for_task_to_complete(101, &result2) < 0)
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 101);
 177:	51                   	push   %ecx
 178:	6a 65                	push   $0x65
 17a:	68 28 0a 00 00       	push   $0xa28
 17f:	6a 01                	push   $0x1
 181:	e8 ea 04 00 00       	call   670 <printf>
 186:	83 c4 10             	add    $0x10,%esp
 189:	e9 34 ff ff ff       	jmp    c2 <main+0xc2>

	if(wait_for_task_to_complete(101, &result3) < 0)
		printf(1, "wait_for_task_to_complete failed. task ID: %d \n", 101);
 18e:	52                   	push   %edx
 18f:	6a 65                	push   $0x65
 191:	68 28 0a 00 00       	push   $0xa28
 196:	6a 01                	push   $0x1
 198:	e8 d3 04 00 00       	call   670 <printf>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	e9 36 ff ff ff       	jmp    db <main+0xdb>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
 1a5:	e8 c6 00 00 00       	call   270 <worker_thread>
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <task1>:
#include "user.h"

#define NWORKERS 2

void task1(int id, int a, int b)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	83 ec 18             	sub    $0x18,%esp
 1b9:	8b 75 08             	mov    0x8(%ebp),%esi
 1bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(5);
 1bf:	6a 05                	push   $0x5
#include "user.h"

#define NWORKERS 2

void task1(int id, int a, int b)
{
 1c1:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(5);
 1c4:	e8 c9 03 00 00       	call   592 <sleep>
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 1c9:	e8 b4 03 00 00       	call   582 <getpid>
 1ce:	5a                   	pop    %edx
 1cf:	59                   	pop    %ecx
 1d0:	53                   	push   %ebx
 1d1:	57                   	push   %edi
	result = a + b;
 1d2:	01 fb                	add    %edi,%ebx
void task1(int id, int a, int b)
{
	int result;

	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 1d4:	56                   	push   %esi
 1d5:	50                   	push   %eax
 1d6:	68 90 09 00 00       	push   $0x990
 1db:	6a 01                	push   $0x1
 1dd:	e8 8e 04 00 00       	call   670 <printf>
	result = a + b;

	sleep(300);
 1e2:	83 c4 14             	add    $0x14,%esp
 1e5:	68 2c 01 00 00       	push   $0x12c
 1ea:	e8 a3 03 00 00       	call   592 <sleep>
	task_ret(id, result);
 1ef:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 1f2:	89 75 08             	mov    %esi,0x8(%ebp)
 1f5:	83 c4 10             	add    $0x10,%esp
}
 1f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fb:	5b                   	pop    %ebx
 1fc:	5e                   	pop    %esi
 1fd:	5f                   	pop    %edi
 1fe:	5d                   	pop    %ebp
	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	result = a + b;

	sleep(300);
	task_ret(id, result);
 1ff:	e9 be 03 00 00       	jmp    5c2 <task_ret>
 204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 20a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000210 <task2>:
}

void task2(int id, int a, int b)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
 216:	83 ec 18             	sub    $0x18,%esp
 219:	8b 75 08             	mov    0x8(%ebp),%esi
 21c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(15);
 21f:	6a 0f                	push   $0xf
	sleep(300);
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
 221:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(15);
 224:	e8 69 03 00 00       	call   592 <sleep>
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 229:	e8 54 03 00 00       	call   582 <getpid>
 22e:	5a                   	pop    %edx
 22f:	59                   	pop    %ecx
 230:	53                   	push   %ebx
 231:	57                   	push   %edi
 232:	56                   	push   %esi
 233:	50                   	push   %eax
 234:	68 c0 09 00 00       	push   $0x9c0
 239:	6a 01                	push   $0x1

	result = a * b;
 23b:	0f af df             	imul   %edi,%ebx
void task2(int id, int a, int b)
{
	int result;

	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 23e:	e8 2d 04 00 00       	call   670 <printf>

	result = a * b;
	
	sleep(450);
 243:	83 c4 14             	add    $0x14,%esp
 246:	68 c2 01 00 00       	push   $0x1c2
 24b:	e8 42 03 00 00       	call   592 <sleep>
	task_ret(id, result);
 250:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 253:	89 75 08             	mov    %esi,0x8(%ebp)
 256:	83 c4 10             	add    $0x10,%esp
}
 259:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5f                   	pop    %edi
 25f:	5d                   	pop    %ebp
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;
	
	sleep(450);
	task_ret(id, result);
 260:	e9 5d 03 00 00       	jmp    5c2 <task_ret>
 265:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <worker_thread>:
}

void worker_thread()
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
	int count = 0;
 274:	31 f6                	xor    %esi,%esi
	sleep(450);
	task_ret(id, result);
}

void worker_thread()
{
 276:	53                   	push   %ebx
 277:	eb 24                	jmp    29d <worker_thread+0x2d>
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 280:	e8 fd 02 00 00       	call   582 <getpid>
	while(1)
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
 285:	83 c6 01             	add    $0x1,%esi
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	53                   	push   %ebx
 28c:	56                   	push   %esi
 28d:	50                   	push   %eax
 28e:	68 f0 09 00 00       	push   $0x9f0
 293:	6a 01                	push   $0x1
 295:	e8 d6 03 00 00       	call   670 <printf>
		else
		{
			printf(1, "wait for task failed \n");
			exit();
		}
	}
 29a:	83 c4 20             	add    $0x20,%esp
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 29d:	e8 18 03 00 00       	call   5ba <wait_for_task>
		if(ret > 0)
 2a2:	85 c0                	test   %eax,%eax
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 2a4:	89 c3                	mov    %eax,%ebx
		if(ret > 0)
 2a6:	7f d8                	jg     280 <worker_thread+0x10>
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
 2a8:	83 ec 08             	sub    $0x8,%esp
 2ab:	68 94 0a 00 00       	push   $0xa94
 2b0:	6a 01                	push   $0x1
 2b2:	e8 b9 03 00 00       	call   670 <printf>
			exit();
 2b7:	e8 46 02 00 00       	call   502 <exit>
 2bc:	66 90                	xchg   %ax,%ax
 2be:	66 90                	xchg   %ax,%ax

000002c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ca:	89 c2                	mov    %eax,%edx
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d0:	83 c1 01             	add    $0x1,%ecx
 2d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2d7:	83 c2 01             	add    $0x1,%edx
 2da:	84 db                	test   %bl,%bl
 2dc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2df:	75 ef                	jne    2d0 <strcpy+0x10>
    ;
  return os;
}
 2e1:	5b                   	pop    %ebx
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    
 2e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	8b 55 08             	mov    0x8(%ebp),%edx
 2f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2fb:	0f b6 02             	movzbl (%edx),%eax
 2fe:	0f b6 19             	movzbl (%ecx),%ebx
 301:	84 c0                	test   %al,%al
 303:	75 1e                	jne    323 <strcmp+0x33>
 305:	eb 29                	jmp    330 <strcmp+0x40>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 310:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 313:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 316:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 319:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 31d:	84 c0                	test   %al,%al
 31f:	74 0f                	je     330 <strcmp+0x40>
 321:	89 f1                	mov    %esi,%ecx
 323:	38 d8                	cmp    %bl,%al
 325:	74 e9                	je     310 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 327:	29 d8                	sub    %ebx,%eax
}
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 330:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 332:	29 d8                	sub    %ebx,%eax
}
 334:	5b                   	pop    %ebx
 335:	5e                   	pop    %esi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <strlen>:

uint
strlen(char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 346:	80 39 00             	cmpb   $0x0,(%ecx)
 349:	74 12                	je     35d <strlen+0x1d>
 34b:	31 d2                	xor    %edx,%edx
 34d:	8d 76 00             	lea    0x0(%esi),%esi
 350:	83 c2 01             	add    $0x1,%edx
 353:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 357:	89 d0                	mov    %edx,%eax
 359:	75 f5                	jne    350 <strlen+0x10>
    ;
  return n;
}
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 35d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	eb 0d                	jmp    370 <memset>
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

00000370 <memset>:

void*
memset(void *dst, int c, uint n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 377:	8b 4d 10             	mov    0x10(%ebp),%ecx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	89 d7                	mov    %edx,%edi
 37f:	fc                   	cld    
 380:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 382:	89 d0                	mov    %edx,%eax
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <strchr>:

char*
strchr(const char *s, char c)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 39a:	0f b6 10             	movzbl (%eax),%edx
 39d:	84 d2                	test   %dl,%dl
 39f:	74 1d                	je     3be <strchr+0x2e>
    if(*s == c)
 3a1:	38 d3                	cmp    %dl,%bl
 3a3:	89 d9                	mov    %ebx,%ecx
 3a5:	75 0d                	jne    3b4 <strchr+0x24>
 3a7:	eb 17                	jmp    3c0 <strchr+0x30>
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3b0:	38 ca                	cmp    %cl,%dl
 3b2:	74 0c                	je     3c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3b4:	83 c0 01             	add    $0x1,%eax
 3b7:	0f b6 10             	movzbl (%eax),%edx
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3be:	31 c0                	xor    %eax,%eax
}
 3c0:	5b                   	pop    %ebx
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    
 3c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <gets>:

char*
gets(char *buf, int max)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 3d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 3db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3de:	eb 29                	jmp    409 <gets+0x39>
    cc = read(0, &c, 1);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	6a 01                	push   $0x1
 3e5:	57                   	push   %edi
 3e6:	6a 00                	push   $0x0
 3e8:	e8 2d 01 00 00       	call   51a <read>
    if(cc < 1)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7e 1d                	jle    411 <gets+0x41>
      break;
    buf[i++] = c;
 3f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3f8:	8b 55 08             	mov    0x8(%ebp),%edx
 3fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 3fd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 3ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 403:	74 1b                	je     420 <gets+0x50>
 405:	3c 0d                	cmp    $0xd,%al
 407:	74 17                	je     420 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 409:	8d 5e 01             	lea    0x1(%esi),%ebx
 40c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 40f:	7c cf                	jl     3e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 418:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41b:	5b                   	pop    %ebx
 41c:	5e                   	pop    %esi
 41d:	5f                   	pop    %edi
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 420:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 423:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 425:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 429:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42c:	5b                   	pop    %ebx
 42d:	5e                   	pop    %esi
 42e:	5f                   	pop    %edi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	eb 0d                	jmp    440 <stat>
 433:	90                   	nop
 434:	90                   	nop
 435:	90                   	nop
 436:	90                   	nop
 437:	90                   	nop
 438:	90                   	nop
 439:	90                   	nop
 43a:	90                   	nop
 43b:	90                   	nop
 43c:	90                   	nop
 43d:	90                   	nop
 43e:	90                   	nop
 43f:	90                   	nop

00000440 <stat>:

int
stat(char *n, struct stat *st)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	56                   	push   %esi
 444:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 445:	83 ec 08             	sub    $0x8,%esp
 448:	6a 00                	push   $0x0
 44a:	ff 75 08             	pushl  0x8(%ebp)
 44d:	e8 f0 00 00 00       	call   542 <open>
  if(fd < 0)
 452:	83 c4 10             	add    $0x10,%esp
 455:	85 c0                	test   %eax,%eax
 457:	78 27                	js     480 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 459:	83 ec 08             	sub    $0x8,%esp
 45c:	ff 75 0c             	pushl  0xc(%ebp)
 45f:	89 c3                	mov    %eax,%ebx
 461:	50                   	push   %eax
 462:	e8 f3 00 00 00       	call   55a <fstat>
 467:	89 c6                	mov    %eax,%esi
  close(fd);
 469:	89 1c 24             	mov    %ebx,(%esp)
 46c:	e8 b9 00 00 00       	call   52a <close>
  return r;
 471:	83 c4 10             	add    $0x10,%esp
 474:	89 f0                	mov    %esi,%eax
}
 476:	8d 65 f8             	lea    -0x8(%ebp),%esp
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 485:	eb ef                	jmp    476 <stat+0x36>
 487:	89 f6                	mov    %esi,%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 497:	0f be 11             	movsbl (%ecx),%edx
 49a:	8d 42 d0             	lea    -0x30(%edx),%eax
 49d:	3c 09                	cmp    $0x9,%al
 49f:	b8 00 00 00 00       	mov    $0x0,%eax
 4a4:	77 1f                	ja     4c5 <atoi+0x35>
 4a6:	8d 76 00             	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4b3:	83 c1 01             	add    $0x1,%ecx
 4b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ba:	0f be 11             	movsbl (%ecx),%edx
 4bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 4c5:	5b                   	pop    %ebx
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    
 4c8:	90                   	nop
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
 4d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
 4db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4de:	85 db                	test   %ebx,%ebx
 4e0:	7e 14                	jle    4f6 <memmove+0x26>
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4f2:	39 da                	cmp    %ebx,%edx
 4f4:	75 f2                	jne    4e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fa:	b8 01 00 00 00       	mov    $0x1,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exit>:
SYSCALL(exit)
 502:	b8 02 00 00 00       	mov    $0x2,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait>:
SYSCALL(wait)
 50a:	b8 03 00 00 00       	mov    $0x3,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <pipe>:
SYSCALL(pipe)
 512:	b8 04 00 00 00       	mov    $0x4,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <read>:
SYSCALL(read)
 51a:	b8 05 00 00 00       	mov    $0x5,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <write>:
SYSCALL(write)
 522:	b8 10 00 00 00       	mov    $0x10,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <close>:
SYSCALL(close)
 52a:	b8 15 00 00 00       	mov    $0x15,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kill>:
SYSCALL(kill)
 532:	b8 06 00 00 00       	mov    $0x6,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exec>:
SYSCALL(exec)
 53a:	b8 07 00 00 00       	mov    $0x7,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <open>:
SYSCALL(open)
 542:	b8 0f 00 00 00       	mov    $0xf,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mknod>:
SYSCALL(mknod)
 54a:	b8 11 00 00 00       	mov    $0x11,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <unlink>:
SYSCALL(unlink)
 552:	b8 12 00 00 00       	mov    $0x12,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <fstat>:
SYSCALL(fstat)
 55a:	b8 08 00 00 00       	mov    $0x8,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <link>:
SYSCALL(link)
 562:	b8 13 00 00 00       	mov    $0x13,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mkdir>:
SYSCALL(mkdir)
 56a:	b8 14 00 00 00       	mov    $0x14,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <chdir>:
SYSCALL(chdir)
 572:	b8 09 00 00 00       	mov    $0x9,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <dup>:
SYSCALL(dup)
 57a:	b8 0a 00 00 00       	mov    $0xa,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getpid>:
SYSCALL(getpid)
 582:	b8 0b 00 00 00       	mov    $0xb,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <sbrk>:
SYSCALL(sbrk)
 58a:	b8 0c 00 00 00       	mov    $0xc,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sleep>:
SYSCALL(sleep)
 592:	b8 0d 00 00 00       	mov    $0xd,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <uptime>:
SYSCALL(uptime)
 59a:	b8 0e 00 00 00       	mov    $0xe,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <init_taskmaster>:
#/***************** LAB QUIZ 4 *****************/
SYSCALL(init_taskmaster)
 5a2:	b8 16 00 00 00       	mov    $0x16,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <do_task>:
SYSCALL(do_task)
 5aa:	b8 17 00 00 00       	mov    $0x17,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <wait_for_task_to_complete>:
SYSCALL(wait_for_task_to_complete)
 5b2:	b8 18 00 00 00       	mov    $0x18,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <wait_for_task>:
SYSCALL(wait_for_task)
 5ba:	b8 19 00 00 00       	mov    $0x19,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <task_ret>:
SYSCALL(task_ret)
 5c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    
 5ca:	66 90                	xchg   %ax,%ax
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	89 c6                	mov    %eax,%esi
 5d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5de:	85 db                	test   %ebx,%ebx
 5e0:	74 7e                	je     660 <printint+0x90>
 5e2:	89 d0                	mov    %edx,%eax
 5e4:	c1 e8 1f             	shr    $0x1f,%eax
 5e7:	84 c0                	test   %al,%al
 5e9:	74 75                	je     660 <printint+0x90>
    neg = 1;
    x = -xx;
 5eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5f4:	f7 d8                	neg    %eax
 5f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f9:	31 ff                	xor    %edi,%edi
 5fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5fe:	89 ce                	mov    %ecx,%esi
 600:	eb 08                	jmp    60a <printint+0x3a>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 608:	89 cf                	mov    %ecx,%edi
 60a:	31 d2                	xor    %edx,%edx
 60c:	8d 4f 01             	lea    0x1(%edi),%ecx
 60f:	f7 f6                	div    %esi
 611:	0f b6 92 d0 0a 00 00 	movzbl 0xad0(%edx),%edx
  }while((x /= base) != 0);
 618:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 61a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 61d:	75 e9                	jne    608 <printint+0x38>
  if(neg)
 61f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 622:	8b 75 c0             	mov    -0x40(%ebp),%esi
 625:	85 c0                	test   %eax,%eax
 627:	74 08                	je     631 <printint+0x61>
    buf[i++] = '-';
 629:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 62e:	8d 4f 02             	lea    0x2(%edi),%ecx
 631:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 635:	8d 76 00             	lea    0x0(%esi),%esi
 638:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63b:	83 ec 04             	sub    $0x4,%esp
 63e:	83 ef 01             	sub    $0x1,%edi
 641:	6a 01                	push   $0x1
 643:	53                   	push   %ebx
 644:	56                   	push   %esi
 645:	88 45 d7             	mov    %al,-0x29(%ebp)
 648:	e8 d5 fe ff ff       	call   522 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 64d:	83 c4 10             	add    $0x10,%esp
 650:	39 df                	cmp    %ebx,%edi
 652:	75 e4                	jne    638 <printint+0x68>
    putc(fd, buf[i]);
}
 654:	8d 65 f4             	lea    -0xc(%ebp),%esp
 657:	5b                   	pop    %ebx
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 660:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 662:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 669:	eb 8b                	jmp    5f6 <printint+0x26>
 66b:	90                   	nop
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 676:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 679:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 67c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 67f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 682:	89 45 d0             	mov    %eax,-0x30(%ebp)
 685:	0f b6 1e             	movzbl (%esi),%ebx
 688:	83 c6 01             	add    $0x1,%esi
 68b:	84 db                	test   %bl,%bl
 68d:	0f 84 b0 00 00 00    	je     743 <printf+0xd3>
 693:	31 d2                	xor    %edx,%edx
 695:	eb 39                	jmp    6d0 <printf+0x60>
 697:	89 f6                	mov    %esi,%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6a0:	83 f8 25             	cmp    $0x25,%eax
 6a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 6a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6ab:	74 18                	je     6c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6b6:	6a 01                	push   $0x1
 6b8:	50                   	push   %eax
 6b9:	57                   	push   %edi
 6ba:	e8 63 fe ff ff       	call   522 <write>
 6bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6c2:	83 c4 10             	add    $0x10,%esp
 6c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6cc:	84 db                	test   %bl,%bl
 6ce:	74 73                	je     743 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6d2:	0f be cb             	movsbl %bl,%ecx
 6d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6d8:	74 c6                	je     6a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6da:	83 fa 25             	cmp    $0x25,%edx
 6dd:	75 e6                	jne    6c5 <printf+0x55>
      if(c == 'd'){
 6df:	83 f8 64             	cmp    $0x64,%eax
 6e2:	0f 84 f8 00 00 00    	je     7e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ee:	83 f9 70             	cmp    $0x70,%ecx
 6f1:	74 5d                	je     750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f3:	83 f8 73             	cmp    $0x73,%eax
 6f6:	0f 84 84 00 00 00    	je     780 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fc:	83 f8 63             	cmp    $0x63,%eax
 6ff:	0f 84 ea 00 00 00    	je     7ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 705:	83 f8 25             	cmp    $0x25,%eax
 708:	0f 84 c2 00 00 00    	je     7d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 711:	83 ec 04             	sub    $0x4,%esp
 714:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 718:	6a 01                	push   $0x1
 71a:	50                   	push   %eax
 71b:	57                   	push   %edi
 71c:	e8 01 fe ff ff       	call   522 <write>
 721:	83 c4 0c             	add    $0xc,%esp
 724:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 727:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 72a:	6a 01                	push   $0x1
 72c:	50                   	push   %eax
 72d:	57                   	push   %edi
 72e:	83 c6 01             	add    $0x1,%esi
 731:	e8 ec fd ff ff       	call   522 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 736:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 73a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 73d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 73f:	84 db                	test   %bl,%bl
 741:	75 8d                	jne    6d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 743:	8d 65 f4             	lea    -0xc(%ebp),%esp
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    
 74b:	90                   	nop
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 10 00 00 00       	mov    $0x10,%ecx
 758:	6a 00                	push   $0x0
 75a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 75d:	89 f8                	mov    %edi,%eax
 75f:	8b 13                	mov    (%ebx),%edx
 761:	e8 6a fe ff ff       	call   5d0 <printint>
        ap++;
 766:	89 d8                	mov    %ebx,%eax
 768:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 76b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 76d:	83 c0 04             	add    $0x4,%eax
 770:	89 45 d0             	mov    %eax,-0x30(%ebp)
 773:	e9 4d ff ff ff       	jmp    6c5 <printf+0x55>
 778:	90                   	nop
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 780:	8b 45 d0             	mov    -0x30(%ebp),%eax
 783:	8b 18                	mov    (%eax),%ebx
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 78b:	b8 c9 0a 00 00       	mov    $0xac9,%eax
 790:	85 db                	test   %ebx,%ebx
 792:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 795:	0f b6 03             	movzbl (%ebx),%eax
 798:	84 c0                	test   %al,%al
 79a:	74 23                	je     7bf <printf+0x14f>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 7ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7ae:	50                   	push   %eax
 7af:	57                   	push   %edi
 7b0:	e8 6d fd ff ff       	call   522 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7b5:	0f b6 03             	movzbl (%ebx),%eax
 7b8:	83 c4 10             	add    $0x10,%esp
 7bb:	84 c0                	test   %al,%al
 7bd:	75 e1                	jne    7a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7bf:	31 d2                	xor    %edx,%edx
 7c1:	e9 ff fe ff ff       	jmp    6c5 <printf+0x55>
 7c6:	8d 76 00             	lea    0x0(%esi),%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
 7d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7d9:	6a 01                	push   $0x1
 7db:	e9 4c ff ff ff       	jmp    72c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e8:	6a 01                	push   $0x1
 7ea:	e9 6b ff ff ff       	jmp    75a <printf+0xea>
 7ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7f2:	83 ec 04             	sub    $0x4,%esp
 7f5:	8b 03                	mov    (%ebx),%eax
 7f7:	6a 01                	push   $0x1
 7f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7ff:	50                   	push   %eax
 800:	57                   	push   %edi
 801:	e8 1c fd ff ff       	call   522 <write>
 806:	e9 5b ff ff ff       	jmp    766 <printf+0xf6>
 80b:	66 90                	xchg   %ax,%ax
 80d:	66 90                	xchg   %ax,%ax
 80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 e8 0d 00 00       	mov    0xde8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 820:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 823:	39 c8                	cmp    %ecx,%eax
 825:	73 19                	jae    840 <free+0x30>
 827:	89 f6                	mov    %esi,%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 830:	39 d1                	cmp    %edx,%ecx
 832:	72 1c                	jb     850 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 d0                	cmp    %edx,%eax
 836:	73 18                	jae    850 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 838:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83e:	72 f0                	jb     830 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 d0                	cmp    %edx,%eax
 842:	72 f4                	jb     838 <free+0x28>
 844:	39 d1                	cmp    %edx,%ecx
 846:	73 f0                	jae    838 <free+0x28>
 848:	90                   	nop
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 850:	8b 73 fc             	mov    -0x4(%ebx),%esi
 853:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 856:	39 d7                	cmp    %edx,%edi
 858:	74 19                	je     873 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 85a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 85d:	8b 50 04             	mov    0x4(%eax),%edx
 860:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 863:	39 f1                	cmp    %esi,%ecx
 865:	74 23                	je     88a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 867:	89 08                	mov    %ecx,(%eax)
  freep = p;
 869:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 86e:	5b                   	pop    %ebx
 86f:	5e                   	pop    %esi
 870:	5f                   	pop    %edi
 871:	5d                   	pop    %ebp
 872:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 873:	03 72 04             	add    0x4(%edx),%esi
 876:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 879:	8b 10                	mov    (%eax),%edx
 87b:	8b 12                	mov    (%edx),%edx
 87d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 880:	8b 50 04             	mov    0x4(%eax),%edx
 883:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 886:	39 f1                	cmp    %esi,%ecx
 888:	75 dd                	jne    867 <free+0x57>
    p->s.size += bp->s.size;
 88a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 88d:	a3 e8 0d 00 00       	mov    %eax,0xde8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 892:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 895:	8b 53 f8             	mov    -0x8(%ebx),%edx
 898:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
 89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 15 e8 0d 00 00    	mov    0xde8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 78 07             	lea    0x7(%eax),%edi
 8b5:	c1 ef 03             	shr    $0x3,%edi
 8b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8bb:	85 d2                	test   %edx,%edx
 8bd:	0f 84 a3 00 00 00    	je     966 <malloc+0xc6>
 8c3:	8b 02                	mov    (%edx),%eax
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8c8:	39 cf                	cmp    %ecx,%edi
 8ca:	76 74                	jbe    940 <malloc+0xa0>
 8cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8d2:	be 00 10 00 00       	mov    $0x1000,%esi
 8d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8de:	0f 43 f7             	cmovae %edi,%esi
 8e1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8ec:	0f 46 da             	cmovbe %edx,%ebx
 8ef:	eb 10                	jmp    901 <malloc+0x61>
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8fa:	8b 48 04             	mov    0x4(%eax),%ecx
 8fd:	39 cf                	cmp    %ecx,%edi
 8ff:	76 3f                	jbe    940 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 901:	39 05 e8 0d 00 00    	cmp    %eax,0xde8
 907:	89 c2                	mov    %eax,%edx
 909:	75 ed                	jne    8f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 90b:	83 ec 0c             	sub    $0xc,%esp
 90e:	53                   	push   %ebx
 90f:	e8 76 fc ff ff       	call   58a <sbrk>
  if(p == (char*)-1)
 914:	83 c4 10             	add    $0x10,%esp
 917:	83 f8 ff             	cmp    $0xffffffff,%eax
 91a:	74 1c                	je     938 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 91c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 91f:	83 ec 0c             	sub    $0xc,%esp
 922:	83 c0 08             	add    $0x8,%eax
 925:	50                   	push   %eax
 926:	e8 e5 fe ff ff       	call   810 <free>
  return freep;
 92b:	8b 15 e8 0d 00 00    	mov    0xde8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 931:	83 c4 10             	add    $0x10,%esp
 934:	85 d2                	test   %edx,%edx
 936:	75 c0                	jne    8f8 <malloc+0x58>
        return 0;
 938:	31 c0                	xor    %eax,%eax
 93a:	eb 1c                	jmp    958 <malloc+0xb8>
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 940:	39 cf                	cmp    %ecx,%edi
 942:	74 1c                	je     960 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 944:	29 f9                	sub    %edi,%ecx
 946:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 949:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 94c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 94f:	89 15 e8 0d 00 00    	mov    %edx,0xde8
      return (void*)(p + 1);
 955:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 958:	8d 65 f4             	lea    -0xc(%ebp),%esp
 95b:	5b                   	pop    %ebx
 95c:	5e                   	pop    %esi
 95d:	5f                   	pop    %edi
 95e:	5d                   	pop    %ebp
 95f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 960:	8b 08                	mov    (%eax),%ecx
 962:	89 0a                	mov    %ecx,(%edx)
 964:	eb e9                	jmp    94f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 966:	c7 05 e8 0d 00 00 ec 	movl   $0xdec,0xde8
 96d:	0d 00 00 
 970:	c7 05 ec 0d 00 00 ec 	movl   $0xdec,0xdec
 977:	0d 00 00 
    base.s.size = 0;
 97a:	b8 ec 0d 00 00       	mov    $0xdec,%eax
 97f:	c7 05 f0 0d 00 00 00 	movl   $0x0,0xdf0
 986:	00 00 00 
 989:	e9 3e ff ff ff       	jmp    8cc <malloc+0x2c>
