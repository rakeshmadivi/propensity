/*
	Packet sniffer using libpcap library
*/
#include<pcap.h>
#include<stdio.h>
#include<stdlib.h> // for exit()
#include<string.h> //for memset

#include<sys/socket.h>
#include<arpa/inet.h> // for inet_ntoa()
#include<net/ethernet.h>
#include<netinet/ip_icmp.h>	//Provides declarations for icmp header
#include<netinet/udp.h>	//Provides declarations for udp header
#include<netinet/tcp.h>	//Provides declarations for tcp header
#include<netinet/ip.h>	//Provides declarations for ip header

void process_packet(u_char *, const struct pcap_pkthdr *, const u_char *);
void process_ip_packet(const u_char * , int);
void print_ip_packet(const u_char * , int);
void print_tcp_packet(const u_char *  , int );
void print_udp_packet(const u_char * , int);
void print_icmp_packet(const u_char * , int );
void PrintData (const u_char * , int);

FILE *logfile;
struct sockaddr_in source,dest;
int tcp=0,udp=0,icmp=0,others=0,igmp=0,total=0,i,j;	

int main()
{
	pcap_if_t *alldevsp , *device;
	pcap_t *handle; //Handle of the device that shall be sniffed

	char errbuf[100] , *devname , devs[100][100];
	int count = 1 , n;
	
	//First get the list of available devices
	printf(&amp;quot;Finding available devices ... &amp;quot;);
	if( pcap_findalldevs( &amp;amp;alldevsp , errbuf) )
	{
		printf(&amp;quot;Error finding devices : %s&amp;quot; , errbuf);
		exit(1);
	}
	printf(&amp;quot;Done&amp;quot;);
	
	//Print the available devices
	printf(&amp;quot;\nAvailable Devices are :\n&amp;quot;);
	for(device = alldevsp ; device != NULL ; device = device->next)
	{
		printf(&amp;quot;%d. %s - %s\n&amp;quot; , count , device->name , device->description);
		if(device->name != NULL)
		{
			strcpy(devs[count] , device->name);
		}
		count++;
	}
	
	//Ask user which device to sniff
	printf(&amp;quot;Enter the number of the device you want to sniff : &amp;quot;);
	scanf(&amp;quot;%d&amp;quot; , &amp;amp;n);
	devname = devs[n];
	
	//Open the device for sniffing
	printf(&amp;quot;Opening device %s for sniffing ... &amp;quot; , devname);
	handle = pcap_open_live(devname , 65536 , 1 , 0 , errbuf);
	
	if (handle == NULL) 
	{
		fprintf(stderr, &amp;quot;Couldn't open device %s : %s\n&amp;quot; , devname , errbuf);
		exit(1);
	}
	printf(&amp;quot;Done\n&amp;quot;);
	
	logfile=fopen(&amp;quot;log.txt&amp;quot;,&amp;quot;w&amp;quot;);
	if(logfile==NULL) 
	{
		printf(&amp;quot;Unable to create file.&amp;quot;);
	}
	
	//Put the device in sniff loop
	pcap_loop(handle , -1 , process_packet , NULL);
	
	return 0;	
}

void process_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *buffer)
{
	int size = header->len;
	
	//Get the IP Header part of this packet , excluding the ethernet header
	struct iphdr *iph = (struct iphdr*)(buffer + sizeof(struct ethhdr));
	++total;
	switch (iph->protocol) //Check the Protocol and do accordingly...
	{
		case 1:  //ICMP Protocol
			++icmp;
			print_icmp_packet( buffer , size);
			break;
		
		case 2:  //IGMP Protocol
			++igmp;
			break;
		
		case 6:  //TCP Protocol
			++tcp;
			print_tcp_packet(buffer , size);
			break;
		
		case 17: //UDP Protocol
			++udp;
			print_udp_packet(buffer , size);
			break;
		
		default: //Some Other Protocol like ARP etc.
			++others;
			break;
	}
	printf(&amp;quot;TCP : %d   UDP : %d   ICMP : %d   IGMP : %d   Others : %d   Total : %d\r&amp;quot;, tcp , udp , icmp , igmp , others , total);
}

void print_ethernet_header(const u_char *Buffer, int Size)
{
	struct ethhdr *eth = (struct ethhdr *)Buffer;
	
	fprintf(logfile , &amp;quot;\n&amp;quot;);
	fprintf(logfile , &amp;quot;Ethernet Header\n&amp;quot;);
	fprintf(logfile , &amp;quot;   |-Destination Address : %.2X-%.2X-%.2X-%.2X-%.2X-%.2X \n&amp;quot;, eth->h_dest[0] , eth->h_dest[1] , eth->h_dest[2] , eth->h_dest[3] , eth->h_dest[4] , eth->h_dest[5] );
	fprintf(logfile , &amp;quot;   |-Source Address      : %.2X-%.2X-%.2X-%.2X-%.2X-%.2X \n&amp;quot;, eth->h_source[0] , eth->h_source[1] , eth->h_source[2] , eth->h_source[3] , eth->h_source[4] , eth->h_source[5] );
	fprintf(logfile , &amp;quot;   |-Protocol            : %u \n&amp;quot;,(unsigned short)eth->h_proto);
}

void print_ip_header(const u_char * Buffer, int Size)
{
	print_ethernet_header(Buffer , Size);
  
	unsigned short iphdrlen;
		
	struct iphdr *iph = (struct iphdr *)(Buffer  + sizeof(struct ethhdr) );
	iphdrlen =iph->ihl*4;
	
	memset(&amp;amp;source, 0, sizeof(source));
	source.sin_addr.s_addr = iph->saddr;
	
	memset(&amp;amp;dest, 0, sizeof(dest));
	dest.sin_addr.s_addr = iph->daddr;
	
	fprintf(logfile , &amp;quot;\n&amp;quot;);
	fprintf(logfile , &amp;quot;IP Header\n&amp;quot;);
	fprintf(logfile , &amp;quot;   |-IP Version        : %d\n&amp;quot;,(unsigned int)iph->version);
	fprintf(logfile , &amp;quot;   |-IP Header Length  : %d DWORDS or %d Bytes\n&amp;quot;,(unsigned int)iph->ihl,((unsigned int)(iph->ihl))*4);
	fprintf(logfile , &amp;quot;   |-Type Of Service   : %d\n&amp;quot;,(unsigned int)iph->tos);
	fprintf(logfile , &amp;quot;   |-IP Total Length   : %d  Bytes(Size of Packet)\n&amp;quot;,ntohs(iph->tot_len));
	fprintf(logfile , &amp;quot;   |-Identification    : %d\n&amp;quot;,ntohs(iph->id));
	//fprintf(logfile , &amp;quot;   |-Reserved ZERO Field   : %d\n&amp;quot;,(unsigned int)iphdr->ip_reserved_zero);
	//fprintf(logfile , &amp;quot;   |-Dont Fragment Field   : %d\n&amp;quot;,(unsigned int)iphdr->ip_dont_fragment);
	//fprintf(logfile , &amp;quot;   |-More Fragment Field   : %d\n&amp;quot;,(unsigned int)iphdr->ip_more_fragment);
	fprintf(logfile , &amp;quot;   |-TTL      : %d\n&amp;quot;,(unsigned int)iph->ttl);
	fprintf(logfile , &amp;quot;   |-Protocol : %d\n&amp;quot;,(unsigned int)iph->protocol);
	fprintf(logfile , &amp;quot;   |-Checksum : %d\n&amp;quot;,ntohs(iph->check));
	fprintf(logfile , &amp;quot;   |-Source IP        : %s\n&amp;quot; , inet_ntoa(source.sin_addr) );
	fprintf(logfile , &amp;quot;   |-Destination IP   : %s\n&amp;quot; , inet_ntoa(dest.sin_addr) );
}

void print_tcp_packet(const u_char * Buffer, int Size)
{
	unsigned short iphdrlen;
	
	struct iphdr *iph = (struct iphdr *)( Buffer  + sizeof(struct ethhdr) );
	iphdrlen = iph->ihl*4;
	
	struct tcphdr *tcph=(struct tcphdr*)(Buffer + iphdrlen + sizeof(struct ethhdr));
			
	int header_size =  sizeof(struct ethhdr) + iphdrlen + tcph->doff*4;
	
	fprintf(logfile , &amp;quot;\n\n***********************TCP Packet*************************\n&amp;quot;);	
		
	print_ip_header(Buffer,Size);
		
	fprintf(logfile , &amp;quot;\n&amp;quot;);
	fprintf(logfile , &amp;quot;TCP Header\n&amp;quot;);
	fprintf(logfile , &amp;quot;   |-Source Port      : %u\n&amp;quot;,ntohs(tcph->source));
	fprintf(logfile , &amp;quot;   |-Destination Port : %u\n&amp;quot;,ntohs(tcph->dest));
	fprintf(logfile , &amp;quot;   |-Sequence Number    : %u\n&amp;quot;,ntohl(tcph->seq));
	fprintf(logfile , &amp;quot;   |-Acknowledge Number : %u\n&amp;quot;,ntohl(tcph->ack_seq));
	fprintf(logfile , &amp;quot;   |-Header Length      : %d DWORDS or %d BYTES\n&amp;quot; ,(unsigned int)tcph->doff,(unsigned int)tcph->doff*4);
	//fprintf(logfile , &amp;quot;   |-CWR Flag : %d\n&amp;quot;,(unsigned int)tcph->cwr);
	//fprintf(logfile , &amp;quot;   |-ECN Flag : %d\n&amp;quot;,(unsigned int)tcph->ece);
	fprintf(logfile , &amp;quot;   |-Urgent Flag          : %d\n&amp;quot;,(unsigned int)tcph->urg);
	fprintf(logfile , &amp;quot;   |-Acknowledgement Flag : %d\n&amp;quot;,(unsigned int)tcph->ack);
	fprintf(logfile , &amp;quot;   |-Push Flag            : %d\n&amp;quot;,(unsigned int)tcph->psh);
	fprintf(logfile , &amp;quot;   |-Reset Flag           : %d\n&amp;quot;,(unsigned int)tcph->rst);
	fprintf(logfile , &amp;quot;   |-Synchronise Flag     : %d\n&amp;quot;,(unsigned int)tcph->syn);
	fprintf(logfile , &amp;quot;   |-Finish Flag          : %d\n&amp;quot;,(unsigned int)tcph->fin);
	fprintf(logfile , &amp;quot;   |-Window         : %d\n&amp;quot;,ntohs(tcph->window));
	fprintf(logfile , &amp;quot;   |-Checksum       : %d\n&amp;quot;,ntohs(tcph->check));
	fprintf(logfile , &amp;quot;   |-Urgent Pointer : %d\n&amp;quot;,tcph->urg_ptr);
	fprintf(logfile , &amp;quot;\n&amp;quot;);
	fprintf(logfile , &amp;quot;                        DATA Dump                         &amp;quot;);
	fprintf(logfile , &amp;quot;\n&amp;quot;);
		
	fprintf(logfile , &amp;quot;IP Header\n&amp;quot;);
	PrintData(Buffer,iphdrlen);
		
	fprintf(logfile , &amp;quot;TCP Header\n&amp;quot;);
	PrintData(Buffer+iphdrlen,tcph->doff*4);
		
	fprintf(logfile , &amp;quot;Data Payload\n&amp;quot;);	
	PrintData(Buffer + header_size , Size - header_size );
						
	fprintf(logfile , &amp;quot;\n###########################################################&amp;quot;);
}

void print_udp_packet(const u_char *Buffer , int Size)
{
	
	unsigned short iphdrlen;
	
	struct iphdr *iph = (struct iphdr *)(Buffer +  sizeof(struct ethhdr));
	iphdrlen = iph->ihl*4;
	
	struct udphdr *udph = (struct udphdr*)(Buffer + iphdrlen  + sizeof(struct ethhdr));
	
	int header_size =  sizeof(struct ethhdr) + iphdrlen + sizeof udph;
	
	fprintf(logfile , &amp;quot;\n\n***********************UDP Packet*************************\n&amp;quot;);
	
	print_ip_header(Buffer,Size);			
	
	fprintf(logfile , &amp;quot;\nUDP Header\n&amp;quot;);
	fprintf(logfile , &amp;quot;   |-Source Port      : %d\n&amp;quot; , ntohs(udph->source));
	fprintf(logfile , &amp;quot;   |-Destination Port : %d\n&amp;quot; , ntohs(udph->dest));
	fprintf(logfile , &amp;quot;   |-UDP Length       : %d\n&amp;quot; , ntohs(udph->len));
	fprintf(logfile , &amp;quot;   |-UDP Checksum     : %d\n&amp;quot; , ntohs(udph->check));
	
	fprintf(logfile , &amp;quot;\n&amp;quot;);
	fprintf(logfile , &amp;quot;IP Header\n&amp;quot;);
	PrintData(Buffer , iphdrlen);
		
	fprintf(logfile , &amp;quot;UDP Header\n&amp;quot;);
	PrintData(Buffer+iphdrlen , sizeof udph);
		
	fprintf(logfile , &amp;quot;Data Payload\n&amp;quot;);	
	
	//Move the pointer ahead and reduce the size of string
	PrintData(Buffer + header_size , Size - header_size);
	
	fprintf(logfile , &amp;quot;\n###########################################################&amp;quot;);
}

void print_icmp_packet(const u_char * Buffer , int Size)
{
	unsigned short iphdrlen;
	
	struct iphdr *iph = (struct iphdr *)(Buffer  + sizeof(struct ethhdr));
	iphdrlen = iph->ihl * 4;
	
	struct icmphdr *icmph = (struct icmphdr *)(Buffer + iphdrlen  + sizeof(struct ethhdr));
	
	int header_size =  sizeof(struct ethhdr) + iphdrlen + sizeof icmph;
	
	fprintf(logfile , &amp;quot;\n\n***********************ICMP Packet*************************\n&amp;quot;);	
	
	print_ip_header(Buffer , Size);
			
	fprintf(logfile , &amp;quot;\n&amp;quot;);
		
	fprintf(logfile , &amp;quot;ICMP Header\n&amp;quot;);
	fprintf(logfile , &amp;quot;   |-Type : %d&amp;quot;,(unsigned int)(icmph->type));
			
	if((unsigned int)(icmph->type) == 11)
	{
		fprintf(logfile , &amp;quot;  (TTL Expired)\n&amp;quot;);
	}
	else if((unsigned int)(icmph->type) == ICMP_ECHOREPLY)
	{
		fprintf(logfile , &amp;quot;  (ICMP Echo Reply)\n&amp;quot;);
	}
	
	fprintf(logfile , &amp;quot;   |-Code : %d\n&amp;quot;,(unsigned int)(icmph->code));
	fprintf(logfile , &amp;quot;   |-Checksum : %d\n&amp;quot;,ntohs(icmph->checksum));
	//fprintf(logfile , &amp;quot;   |-ID       : %d\n&amp;quot;,ntohs(icmph->id));
	//fprintf(logfile , &amp;quot;   |-Sequence : %d\n&amp;quot;,ntohs(icmph->sequence));
	fprintf(logfile , &amp;quot;\n&amp;quot;);

	fprintf(logfile , &amp;quot;IP Header\n&amp;quot;);
	PrintData(Buffer,iphdrlen);
		
	fprintf(logfile , &amp;quot;UDP Header\n&amp;quot;);
	PrintData(Buffer + iphdrlen , sizeof icmph);
		
	fprintf(logfile , &amp;quot;Data Payload\n&amp;quot;);	
	
	//Move the pointer ahead and reduce the size of string
	PrintData(Buffer + header_size , (Size - header_size) );
	
	fprintf(logfile , &amp;quot;\n###########################################################&amp;quot;);
}

void PrintData (const u_char * data , int Size)
{
	int i , j;
	for(i=0 ; i < Size ; i++)
	{
		if( i!=0 &amp;amp;&amp;amp; i%16==0)   //if one line of hex printing is complete...
		{
			fprintf(logfile , &amp;quot;         &amp;quot;);
			for(j=i-16 ; j<i ; j++)
			{
				if(data[j]>=32 &amp;amp;&amp;amp; data[j]<=128)
					fprintf(logfile , &amp;quot;%c&amp;quot;,(unsigned char)data[j]); //if its a number or alphabet
				
				else fprintf(logfile , &amp;quot;.&amp;quot;); //otherwise print a dot
			}
			fprintf(logfile , &amp;quot;\n&amp;quot;);
		} 
		
		if(i%16==0) fprintf(logfile , &amp;quot;   &amp;quot;);
			fprintf(logfile , &amp;quot; %02X&amp;quot;,(unsigned int)data[i]);
				
		if( i==Size-1)  //print the last spaces
		{
			for(j=0;j<15-i%16;j++) 
			{
			  fprintf(logfile , &amp;quot;   &amp;quot;); //extra spaces
			}
			
			fprintf(logfile , &amp;quot;         &amp;quot;);
			
			for(j=i-i%16 ; j<=i ; j++)
			{
				if(data[j]>=32 &amp;amp;&amp;amp; data[j]<=128) 
				{
				  fprintf(logfile , &amp;quot;%c&amp;quot;,(unsigned char)data[j]);
				}
				else 
				{
				  fprintf(logfile , &amp;quot;.&amp;quot;);
				}
			}
			
			fprintf(logfile ,  &amp;quot;\n&amp;quot; );
		}
	}
}
