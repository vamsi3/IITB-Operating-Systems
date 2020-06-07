#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME "testcase0.img"
#define TEST_DEVICE_SIZE 42
#define TEST_FS_NUMBER EMUFS_NON_ENCRYPTED

#define FILE1 "file1.txt"
#define FILE2 "file2.txt"

int main(int argc, char *argv[])
{
	//	Opening and mounting device.
	struct mount_t* mount1 = testcase_mount_device(TEST_DEVICE_NAME, TEST_DEVICE_SIZE, TEST_FS_NUMBER);
	if(!mount1)
		exit(1);

	mount_dump();
	fsdump(mount1);
	printf("-----------------------------------------------------------------\n\n");

	//	Opening two files, FILE1 and FILE2.
	struct file_t *f1 = eopen(mount1, FILE1);
	struct file_t *f2 = eopen(mount1, FILE2);

	//	Reading smalltext from FILE1
	testcase_read_from_file(f1, FILE1, strlen(smalltext), 1);

	//	Reading largetext from FILE2
	testcase_read_from_file(f2, FILE2, strlen(largetext), 1);

	//	Reading veryLargetext from FILE1
	testcase_read_from_file(f1, FILE1, strlen(veryLargetext), 1);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n\n");

	//	Closing device
	closedevice(mount1);

	mount_dump();

	return 0;
}
