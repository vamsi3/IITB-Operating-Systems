#include "emufs.h"

/**************************** File system helper functions ****************************/

//	Function to encrypt a block of data 
int encrypt(char* input, char* encrypted)
{
	for(int i=0; i<BLOCKSIZE; i++)
	{
		encrypted[i] = ~input[i];
	}
}

//	Function to decrypt a block of data 
int decrypt(char* input, char* decrypted)
{
	for(int i=0; i<BLOCKSIZE; i++)
	{
		decrypted[i] = ~input[i];
	}
}

//	The following helper functions are used to read and write 
//	superblock and metadata block. 
//	Change the function definitions with required arguments
struct superblock_t* readSuperblock(struct mount_t *mount_point)
{
	/*
		* Read 0th block from the device into a blocksize buffer
		* Create superblock_t variable and fill it using reader buffer
		* Return the superblock_t variable
	*/

	int fd = mount_point->device_fd;
	if (fd <= 0) return NULL;
	char tempBuf[BLOCKSIZE];
	if (readblock(fd, 0, tempBuf) != 1) return NULL;

	struct superblock_t* superblock;
	superblock = (struct superblock_t*) malloc(sizeof(struct superblock_t));
	memcpy(superblock, tempBuf, sizeof(struct superblock_t));

	return superblock;
}

int writeSuperblock(struct superblock_t *superblock, struct mount_t *mount_point)
{
	/*
		* Read the 0th block from device into a buffer
		* Write the superblock into the buffer
		* Write back the buffer into block 0
	*/

	char tempBuf[BLOCKSIZE];
	memcpy(tempBuf, superblock, sizeof(struct superblock_t));

	int fd = mount_point->device_fd;
	if (fd <= 0) return -1;
	if (writeblock(fd, 0, tempBuf) != 1) return -1;

	return 1;
}

struct metadata_t* readMetadata(struct mount_t *mount_point)
{
	// Same as readSuperblock(), but it is stored on block 1
	// Need to decrypt if emufs-encrypted is used 

	int fd = mount_point->device_fd;
	if (fd <= 0) return NULL;
	char tempBuf[BLOCKSIZE];
	if (readblock(fd, 1, tempBuf) != 1) return NULL;

	if (mount_point->fs_number == 1) {
		char decrypted[BLOCKSIZE];
		decrypt(tempBuf, decrypted);
		memset(tempBuf, 0, sizeof(tempBuf));
		memcpy(tempBuf, decrypted, sizeof(decrypted));	
	}

	struct metadata_t* metadata;
	metadata = (struct metadata_t*) malloc(sizeof(struct metadata_t));
	memcpy(metadata, tempBuf, sizeof(struct metadata_t));

	return metadata;
}

int writeMetadata(struct metadata_t *metadata, struct mount_t *mount_point)
{
	// Same as writeSuperblock(), but it is stored on block 1
	// Need to decrypt/encrypt if emufs-encrypted is used  

	char tempBuf[BLOCKSIZE];
	memcpy(tempBuf, metadata, sizeof(struct metadata_t));

	if (mount_point->fs_number == 1) {
		char encrypted[BLOCKSIZE];
		encrypt(tempBuf, encrypted);
		memset(tempBuf, 0, sizeof(tempBuf));
		memcpy(tempBuf, encrypted, sizeof(encrypted));
	}

	int fd = mount_point->device_fd;
	if (fd <= 0) return -1;
	if (writeblock(fd, 1, tempBuf) != 1) return -1;

	return 1;
}

/**************************** File system API ****************************/

int create_file_system(struct mount_t *mount_point, int fs_number)
{
	/*
	   	* Read the superblock.
	    * Set file system number on superblock
		* Clear the bitmaps.  values on the bitmap will be either '0', or '1', or'x'. 
		* Create metadata block in disk
		* Write superblock and metadata block back to disk.

		* Return value: -1,		error
						 1, 	success
	*/

	struct superblock_t* superblock;
	superblock = readSuperblock(mount_point);
	if (superblock == NULL) return -1;

	superblock->fs_number = fs_number;

	memset(superblock->bitmap, 'x', sizeof(superblock->bitmap));
	for (int i=0; i<superblock->disk_size; i++) {
		superblock->bitmap[i] = '0';
	}

	if (writeSuperblock(superblock, mount_point) != 1) return -1;

	struct metadata_t *metadata;
	metadata = (struct metadata_t*) malloc(sizeof(struct metadata_t));
	for (int inode_number=0; inode_number<MAX_FILES; inode_number++) {
		metadata->inodes[inode_number].status = 0;
	}

	if (writeMetadata(metadata, mount_point) != 1) return -1;

	mount_point->fs_number = fs_number;

	printf("[%s] File system created.\n", mount_point->device_name);

	return 1;
}


struct file_t* eopen(struct mount_t* mount_point, char* filename)
{
	/* 
		* If file exist, get the inode number. inode number is the index of inode in the metadata.
		* If file does not exist, 
			* find free inode.
			* allocate the free inode as USED
			* if free id not found, print the error and return -1
		* Create the file hander (struct file_t)
		* Initialize offset in the file hander
		* Return file handler.

		* Return NULL on error.
	*/

	struct metadata_t *metadata;
	metadata = readMetadata(mount_point);
	if (metadata == NULL) return NULL;

	int inode_number;
	for (inode_number = 0; inode_number < MAX_FILES; inode_number++) {
		if (strcmp(metadata->inodes[inode_number].name, filename) == 0) break;
	}
	if (inode_number == MAX_FILES) {
		// No inode with filename found
		int inode_number_free;
		for (inode_number_free = 0; inode_number_free < MAX_FILES; inode_number_free++) {
			if (metadata->inodes[inode_number_free].status == 0) break;
		}
		if (inode_number_free == MAX_FILES) {
			// No free inode present
			printf("[eopen]: No free inode available\n");
			return NULL;
		}
		inode_number = inode_number_free;
		struct inode_t *inode;
		inode = &metadata->inodes[inode_number];
		inode->status = 1;
		strcpy(inode->name, filename);
		inode->file_size = 0;
		memset(inode->blocks, -1, sizeof(inode->blocks));
		time(&inode->modtime);
	}

	struct file_t *file;
	file = (struct file_t*) malloc(sizeof(struct file_t*));
	file->offset = 0;
	file->inode_number = inode_number;
	file->mount_point = mount_point;

	printf("File '%s' Opened \n", filename);

	if (writeMetadata(metadata, file->mount_point) != 1) return NULL;

	return file;
}

int ewrite(struct file_t* file, char* data1, int size)
{
	// You do not need to implement partial writes in case file exceeds 4 blocks
	// or no free block is available in the disk. 

	// Return value: 	-1,  error
	//					Number of bytes written

	char data[size];
	memcpy(data, data1, size);

	if (file->mount_point->fs_number == 1) {
		char encrypted[size];
		encrypt(data, encrypted);
		memset(data, 0, sizeof(data));
		memcpy(data, encrypted, sizeof(encrypted));
	}

	int size_in_blocks = size/BLOCKSIZE;
	int offset_block_number = file->offset/BLOCKSIZE;
	if (offset_block_number+size_in_blocks > MAX_FILE_SIZE) {
		printf("ERROR: Maximum File Size Exceeded\n");
		return -1;
	}

	struct metadata_t *metadata;
	metadata = readMetadata(file->mount_point);
	if (metadata == NULL) return -1;

	struct inode_t *inode;
	inode = &metadata->inodes[file->inode_number];

	if (offset_block_number > inode->file_size) {
		printf("ERROR: Invalid offset\n");
		return -1;
	}

	struct superblock_t* superblock;
	superblock = readSuperblock(file->mount_point);
	if (superblock == NULL) return -1;

	int fd = file->mount_point->device_fd;

	int cnt = 0;
	for (int i=2; i<MAX_BLOCKS; i++) {
		if (superblock->bitmap[i] == '0') {
			cnt++;
		}
	}

	int block_write_count, block_write_addr;
	int cnt2 = 0;
	for (block_write_count = 0, block_write_addr = 0; block_write_count < size_in_blocks; block_write_count++, block_write_addr+=BLOCKSIZE) {
		int physical_block_number = inode->blocks[offset_block_number+block_write_count];
		if (physical_block_number == -1) cnt2++;
	}

	if (cnt2 > cnt) {
		printf("ERROR: Out of diskspace\n");
		return -1;
	}


	for (block_write_count = 0, block_write_addr = 0; block_write_count < size_in_blocks; block_write_count++, block_write_addr+=BLOCKSIZE) {
		int physical_block_number = inode->blocks[offset_block_number+block_write_count];
		if (physical_block_number == -1) {
			for (physical_block_number=2; physical_block_number<MAX_BLOCKS; physical_block_number++) {
				if (superblock->bitmap[physical_block_number] == '0') {
					superblock->bitmap[physical_block_number] = '1';
					break;
				}
			}
			if (physical_block_number >= MAX_BLOCKS) return -1; // Free space not available on disk
			inode->blocks[offset_block_number+block_write_count] = physical_block_number;
			inode->file_size += BLOCKSIZE;
		}
		if (writeblock(fd, physical_block_number, data+block_write_addr) != 1) return -1;
	}

	file->offset += size;
	time(&inode->modtime);

	if (writeSuperblock(superblock, file->mount_point) != 1) return -1;
	if (writeMetadata(metadata, file->mount_point) != 1) return -1;	

	return size;
}

int eread(struct file_t* file, char* data, int size)
{
	// NO partial READS.

	// Return value: 	-1,  error
	//					Number of bytes read

	char data1[size];

	int size_in_blocks = size/BLOCKSIZE;
	int offset_block_number = file->offset/BLOCKSIZE;

	struct metadata_t *metadata;
	metadata = readMetadata(file->mount_point);
	if (metadata == NULL) return -1;

	struct inode_t *inode;
	inode = &metadata->inodes[file->inode_number];

	if (offset_block_number+size_in_blocks >= inode->file_size) {
		printf("ERROR: Invalid offset\n");
		return -1;
	}

	int fd = file->mount_point->device_fd;

	int block_read_count, block_read_addr;
	for (block_read_count = 0, block_read_addr = 0; block_read_count < size_in_blocks; block_read_count++, block_read_addr+=BLOCKSIZE) {
		int physical_block_number = inode->blocks[offset_block_number+block_read_count];
		if (physical_block_number == -1) return -1; // Precaution only. This case never occurs.
		if (readblock(fd, physical_block_number, data1+block_read_addr) != 1) return -1;
	}

	file->offset += size;

	if (writeMetadata(metadata, file->mount_point) != 1) return -1;

	if (file->mount_point->fs_number == 1) {
		char decrypted[size];
		decrypt(data1, decrypted);
		memset(data1, 0, sizeof(data1));
		memcpy(data1, decrypted, sizeof(decrypted));
	}

	memcpy(data, data1, size);

	return size;
}

void eclose(struct file_t* file)
{
	// free the memory allocated for the file handler 'file'
	free(file);
	printf("File Closed\n");
}

int eseek(struct file_t *file, int offset)
{
	// Change the offset in file hanlder 'file'

	if (file == NULL) return -1;
	if (offset < 0) return -1;

	file->offset = offset;
	return 1;
}

void fsdump(struct mount_t* mount_point)
{
	struct metadata_t *metadata;
	metadata = readMetadata(mount_point);
	if (metadata == NULL) return;

	printf("\n[%s] fsdump \n", mount_point->device_name);
	printf("%-10s %6s \t[%s] \t%s\n", "  NAME", "SIZE", "BLOCKS", "LAST MODIFIED");
	
	for (int inode_number=0; inode_number<MAX_FILES; inode_number++) {
		struct inode_t *inode;
		inode = &metadata->inodes[inode_number];
		if (inode->status == 1) {
			printf("%-10s %6d \t[%d %d %d %d] \t%s", 
				inode->name, 
				inode->file_size,
				inode->blocks[0],
				inode->blocks[1],
				inode->blocks[2],
				inode->blocks[3],
				asctime(localtime(&(inode->modtime))));
		}
	}
}
