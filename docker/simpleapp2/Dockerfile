FROM python:latest
ADD ./ /Host
WORKDIR /Host
#
RUN apt-get -y update && apt-get -y install apt-utils && apt-get -y upgrade 
#apt-get install -y build-essential && 
RUN pip install -r requirements.txt
CMD ["python","mytest.py"]
