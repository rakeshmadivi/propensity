# include <linux/module.h>
# include <linux/version.h>
# include <linux/kernel.h>

// File structure that performs operations on device 
# include <linux/fs.h>

#define SUCCESS 0
#define DEV_NAME "mydev"

// Device Operations to be performed
static struct file_operations fops = {
	.read = mydev_read,
	.write = mydev_write,
	.open = mydev_open,
	.release = mydev_release
};

static int __init init_mod ( void ) /* Constructor */
{
	// Register the character device on Initializatoin
	unsigned int major;
	reg_id = register_chrdev(0,DEV_NAME,&fops);

	if(major < 0)
	{
		printk(KERN_ALERT "Registering char device %s failed with %d\n",DEV_NAME,major);
		return major;
	}
	printk(KERN_INFO "I was assigned major number %d. To talk to\n", Major);
	printk(KERN_INFO "the driver, create a dev file with\n");
	printk(KERN_INFO "'mknod /dev/%s c %d 0'.\n", DEVICE_NAME, Major);
	printk(KERN_INFO "Try various minor numbers. Try to cat and echo to\n");
	printk(KERN_INFO "the device file.\n");
	printk(KERN_INFO "Remove the device file and module when done.\n");

	return SUCCESS;
}

/*
 *  * This function is called when the module is unloaded
 *   */
void cleanup_module(void)
{
	/* 
	 * 	 * Unregister the device 
	 * 	 	 */
	int ret = unregister_chrdev(Major, DEVICE_NAME);
	if (ret < 0)
		printk(KERN_ALERT "Error in unregister_chrdev: %d\n", ret);
}

static void __exit end_mod ( void ) /* Destructor */
{
	printk (KERN_INFO "Module1 ended ...\n");
}
module_init ( init_mod );
module_exit ( end_mod );
MODULE_LICENSE ("GPL");
MODULE_AUTHOR ("Rakesh Madivi");
MODULE_DESCRIPTION ("Test Driver Module");
