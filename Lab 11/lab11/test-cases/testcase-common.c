#include "emufs.h"

struct mount_t* testcase_mount_device(char* device_name, int device_size, int fs_no)
{
	struct mount_t* mount_point;

	mount_point = opendevice(device_name, device_size);
	if(!mount_point)
	{
		// Error
		return NULL;
	}

	if (mount_point->fs_number == -1)
	{	
		// File system not found
		// Creates a file system of type fs_no
		if(create_file_system(mount_point, fs_no) < 0)
			return NULL;

		return mount_point;
	}

	if (mount_point->fs_number == EMUFS_NON_ENCRYPTED  || mount_point->fs_number == EMUFS_ENCRYPTED)
	{	
		// File system emufs exists on the disk
		return mount_point;
	}
	
	//	Unknown file system
	printf("Error: Found unknown files system. fs_number: %d \n", mount_point->fs_number);
	mount_dump();
	return NULL;
}

void testcase_write_to_file(struct file_t* file, char* filename, char* text)
{
	printf("\n<%s> Current offset: %d. Writing %lu bytes \n", filename, file->offset, strlen(text)); 

	int ret = ewrite(file, text, strlen(text));
	
	printf("<%s> Writing completed. Number of bytes wrtitten: %d. Current offset: %d \n", filename, ret, file->offset);
}


//	Wrapper function to read from a file.
//	Read buffer is local to function.
//	show_text is a boolean flag to control outputs
void testcase_read_from_file(struct file_t* file, char* filename, unsigned long int size, int show_text)
{
	char* readBuf;

	printf("\n<%s> Current offset: %d. Reading %ld bytes \n", filename, file->offset, size); 

	readBuf = (char *)malloc(size * sizeof(char) + 1);
	readBuf[0] = '\0';

	int ret = eread(file, readBuf, size);
	readBuf[ret] = '\0';

	if(show_text)
		printf("Data = [%s] \n", readBuf);

	printf("<%s> Reading completed. Number of bytes read: %d. Current offset: %d \n", filename, ret, file->offset);
	
	free(readBuf);
}

void testcase_change_offset(struct file_t* file, char* filename, int offset)
{
	int ret = eseek(file, offset);
	if(ret > 0)
		printf("\n<%s> Offset is set to %d \n", filename, file->offset);
}
