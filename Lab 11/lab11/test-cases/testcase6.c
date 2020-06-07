#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME_A "testcase6A.img"
#define TEST_DEVICE_NAME_B "testcase6B.img"
#define TEST_DEVICE_SIZE 42
#define TEST_FS_NUMBER_A EMUFS_NON_ENCRYPTED
#define TEST_FS_NUMBER_B EMUFS_ENCRYPTED

#define FILE1 "file1.txt"
#define FILE2 "file2.txt"
#define FILE3 "file3.txt"

int main(int argc, char *argv[])
{
	char readBuf[2048];

	//	Opening and mounting device.
	//	Creating file system, if does not exist.
	struct mount_t* mount1 = testcase_mount_device(TEST_DEVICE_NAME_A, TEST_DEVICE_SIZE, TEST_FS_NUMBER_A);
	if(!mount1)
		exit(1);

	struct mount_t* mount2 = testcase_mount_device(TEST_DEVICE_NAME_B, TEST_DEVICE_SIZE, TEST_FS_NUMBER_B);
	if(!mount2)
		exit(1);

	mount_dump();
	printf("-----------------------------------------------------------------\n\n");
	
	//	Opening two files, FILE1 and FILE2, on TEST_DEVICE_NAME_A
	struct file_t *f1 = eopen(mount1, FILE1);
	struct file_t *f2 = eopen(mount1, FILE2);

	//	Opening a file FILE3 on TEST_DEVICE_NAME_B
	struct file_t *f3 = eopen(mount2, FILE3);
	
	fsdump(mount1);
	fsdump(mount2);
	printf("-----------------------------------------------------------------\n");

	//	Writing smalltext to FILE1
	testcase_write_to_file(f1, FILE1, smalltext);
	
	//	Writing largetext to FILE2
	testcase_write_to_file(f2, FILE2, largetext);
	
	fsdump(mount1);
	fsdump(mount2);
	printf("-----------------------------------------------------------------\n");

	//	Resetting offsets of both FILE and FILE2
	testcase_change_offset(f1, FILE1, 0);
	testcase_change_offset(f2, FILE2, 0);

	//	Reading from FILE1 and writing to FILE3 
	eread(f1, readBuf, strlen(smalltext));
	readBuf[strlen(smalltext)] = '\0';
	testcase_write_to_file(f3, FILE3, readBuf);
	
	//	Reading from FILE2 and writing to FILE3 
	eread(f2, readBuf, strlen(largetext));
	readBuf[strlen(largetext)] = '\0';
	testcase_write_to_file(f3, FILE3, readBuf);

	//	Reading from FILE3
	testcase_change_offset(f3, FILE3, 0);
	testcase_read_from_file(f3, FILE3, strlen(smalltext), 1);
	testcase_read_from_file(f3, FILE3, strlen(largetext), 1);

	fsdump(mount1);
	fsdump(mount2);
	printf("-----------------------------------------------------------------\n");

	///	Closing devices
	closedevice(mount1);
	closedevice(mount2);

	mount_dump();
	printf(" \n");

	return 0;
}
