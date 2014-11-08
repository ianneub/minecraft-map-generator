FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes minecraft-overviewer wget

ENV VERSION 1.8

RUN wget --no-check-certificate https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/${VERSION}.jar -P ~/.minecraft/versions/${VERSION}/
RUN wget http://ianneubert.com/temp/minecraft/1.8/textures/Sphax%20PureBDcraft%20128x%20MC18.zip -O /my_texture_pack.zip

ENTRYPOINT ["overviewer.py"]
CMD ["/minecraft/world", "/www"]
