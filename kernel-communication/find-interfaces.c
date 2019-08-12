#include<stdio.h>
#include<pcap.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>

// For inet_ntoa()
#include <arpa/inet.h>

#include <string.h>

int main(int argc,char *argv[])
{
    char error[PCAP_ERRBUF_SIZE];
    pcap_if_t *interfaces,*temp;
    int i=0;
    if(pcap_findalldevs(&interfaces,error)==-1)
    {
        printf("error in pcap findall devs\n");
        return -1;    
    }

    printf("Interfaces present on the system are:\n");
    for(temp=interfaces;temp;temp=temp->next)
    {
        printf("%d  :  %s",i++,temp->name); //,temp->addresses->addr[0]->sa_addr);

	// Pointer to pcap addresses
	pcap_addr_t *dev_addr;

	/* check if the device captureble*/
	for (dev_addr = temp->addresses; dev_addr != NULL; dev_addr = dev_addr->next) {
		if (dev_addr->addr->sa_family == AF_INET ) { //&& dev_addr->addr && dev_addr->netmask) {
			struct sockaddr_in *addr_in = (struct sockaddr_in *)dev_addr->addr;
			char *s = inet_ntoa(addr_in->sin_addr);
			printf(" [Family-%u] %s",dev_addr->addr->sa_family,s);
		}
	}
	printf("\n");
    }
    
    return 0;
}
