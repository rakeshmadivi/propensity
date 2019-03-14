install_logstash()
{
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
	sudo apt-get install apt-transport-https
	echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
	sudo apt-get update && sudo apt-get install logstash
}

logstash_docker()
{
	docker pull docker.elastic.co/logstash/logstash:6.6.2
}

install_elasticsearch()
{
	wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
	echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
	sudo apt-get update
	sudo apt-get install elasticsearch
}

#install_logstash
install_elasticsearch
