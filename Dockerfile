FROM java
#CMD java "hello world"
# Run command as root user
RUN apt-get install -y git 
#RUN nvm install 6.10.1

USER root

#RUN jenkins ALL=(ALL) NOPASSWD: ALL
# Add user vagrant
RUN useradd -d /home/vagrant -ms /bin/bash vagrant
# SUDO passwordless entry
#RUN mkdir -p /home/vagrant/java
RUN echo "%vagrant ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN  mkdir -p /site/javaTest
#RUN mkdir -p /site/java
RUN chown vagrant:vagrant /site/
USER vagrant

WORKDIR /site
#RUN git clone 'https://github.com/kriru/firstJava'
#RUN git clone https://github.com/Dur09/javaTest.git


RUN echo "Image has been built"
USER root
