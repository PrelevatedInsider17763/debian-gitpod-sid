FROM debian:unstable
RUN apt update && apt upgrade -y && apt install sudo git -y
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
RUN LANG=C perl -e exit
ENV HOME=/home/gitpod
WORKDIR $HOME
USER gitpod
