#include "emufs.h"
struct mount_t mounts[MAX_MOUNT_POINTS];


struct mount_t* add_new_mount_point(int fd, char *device_name, int fs_number)
{
	struct mount_t* mount_point = NULL;

	for(int i=0; i<MAX_MOUNT_POINTS; i++)
		if(mounts[i].device_fd <= 0 )
		{
			mount_point = &mounts[i];
			mount_point->device_fd = fd;
			strcpy(mount_point->device_name, device_name);
			mount_point->fs_number = fs_number;

			return mount_point;
		}

	return NULL;
}


struct mount_t* opendevice(char* device_name, int size)
{
	int fd;
	FILE* fp;
	char tempBuf[BLOCKSIZE];
	struct superblock_t* superblock;
	struct mount_t*  mount_point;

	if(!device_name || strlen(device_name) == 0)
	{
		printf("Error: Invalid device name \n");
		return NULL;
	}

	if(size > MAX_BLOCKS || size < 2)
	{
		printf("Error: Invalid disk size \n");
		return NULL;
	}

	superblock = (struct superblock_t*)malloc(sizeof(struct superblock_t));
	fp = fopen(device_name, "r");
	if(!fp)
	{
		//	Creating the device
		printf("[%s] Creating the disk image \n", device_name);

		superblock->fs_number =  -1; 	//	No fs in the disk
		strcpy(superblock->device_name, device_name);
		superblock->disk_size = size;
		superblock->magic_number = MAGIC_NUMBER;	

		fp = fopen(device_name, "w+");
		if(!fp)
		{
			printf("Error : Unable to create the device. \n");
			free(superblock);
			return NULL;
		}
		fd = fileno(fp);

		// Make size of the disk as the total size
		// printf("Current offset: %ld \n", lseek( fd, 0, SEEK_CUR ));
		fseek(fp, size * BLOCKSIZE, SEEK_SET);
		fputc('\0', fp);
		fseek(fp, 0, SEEK_SET);

		// Allocating super block on the disk
		memcpy(tempBuf, superblock, sizeof(struct superblock_t));
		writeblock(fd, 0, tempBuf);

		printf("[%s] Disk image is successfully creatd \n", device_name);
	}
	else
	{
		fclose(fp);
		fd = open(device_name, O_RDWR);

		readblock(fd, 0, tempBuf);
		memcpy(superblock, tempBuf, sizeof(struct superblock_t));
		if(superblock->magic_number != MAGIC_NUMBER || superblock->disk_size <= 2 || superblock->disk_size > 42)
		{
			printf("Error: Inconsistent super block on device. \n");
			free(superblock);
			return NULL;
		}
		printf("[%s] Disk opened \n", device_name);

		if(superblock->fs_number == -1)
			printf("[%s] File system not found in the disk \n", device_name);
		else
			printf("[%s] File system found. fs_number: %d \n", device_name, superblock->fs_number);
		
	}	

	mount_point = add_new_mount_point(fd, device_name, superblock->fs_number);
	printf("[%s] Disk successfully mounted \n", device_name);
	free(superblock);

	return mount_point;	
}

int writeblock(int dev_fd, int block, char* buf)
{
	int ret;
	int offset;

	if(dev_fd < 0)
	{
		printf("Devices not found \n");
		return -1;
	}

	offset = block * BLOCKSIZE;
	lseek(dev_fd, offset, SEEK_SET);
	ret = write(dev_fd, buf, BLOCKSIZE);
	if(ret != BLOCKSIZE)
	{
		printf("Error: Disk write error. fd: %d. block: %d. buf: %p. ret: %d \n", dev_fd, block, buf, ret);
		return -1;
	}

	return 1;
}

int readblock(int dev_fd, int block, char * buf)
{
	int ret;
	int offset;

	if(dev_fd < 0)
	{
		printf("Devices not found\n");
		return -1;
	}
	offset = block * BLOCKSIZE;
	lseek(dev_fd, offset, SEEK_SET);
	ret = read(dev_fd, buf, BLOCKSIZE);
	if(ret != BLOCKSIZE)
	{
		printf("Error: Disk read error. fd: %d. block: %d. buf: %p. ret: %d \n", dev_fd, block, buf, ret);
		return -1;
	}

	return 1;
}

int closedevice(struct mount_t *mount_point)
{
	char device_name[20];

	if(!mount_point)
	{
		printf("Error: Mount point not found\n");
		return -1;
	}

	if(mount_point->device_fd < 0)
	{
		printf("Error: Devices not found\n");
		return -1;
	}

	strcpy(device_name, mount_point->device_name);
	close(mount_point->device_fd);

	mount_point->device_fd = -1;
	strcpy(mount_point->device_name, "\0");
	mount_point->fs_number = -1;

	printf("[%s] Device closed \n", device_name);
	return 1;
}

void mount_dump(void)
{
	struct mount_t* mount_point;

	printf("\n%-12s %-20s %-15s %-10s %-20s \n", "MOUNT-POINT", "DEVICE-NAME", "DEVICE-NUMBER", "FS-NUMBER", "FS-NAME");
	for(int i=0; i< MAX_MOUNT_POINTS; i++)
	{
		mount_point = mounts + i;
		if(mount_point->device_fd <= 0)
			continue;

		if(mount_point->device_fd > 0)
			printf("%-12d %-20s %-15d %-10d %-20s\n", 
					i, mount_point->device_name, mount_point->device_fd, mount_point->fs_number, 
					mount_point->fs_number == EMUFS_NON_ENCRYPTED ? "emufs non-encrypted" : (mount_point->fs_number == EMUFS_ENCRYPTED ? "emufs encrypted" : "Unknown file system"));
	}
}

