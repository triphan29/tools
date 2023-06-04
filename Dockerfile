FROM debian:11

RUN apt update 
RUN apt install -y apt-utils git wget net-tools build-essential openssl
RUN apt install -y sudo

#Create user
ARG USER=itisme
ARG UID
ARG GID

RUN groupadd -g $GID $USER

RUN useradd -rm \
	-s /bin/bash \
	-d /home/$USER \
	-g $GID \
	-u $UID $USER
	#-p "$(openssl passwd -1 khoai)"

RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#Set default user for container
USER ${UID}:${GID}
WORKDIR /home/${USER}

RUN git clone --recursive https://github.com/triphan29/tools.git
CMD ["bash"]
