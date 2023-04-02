FROM --platform=$BUILDPLATFORM ros:foxy-ros-base-focal

# ----------------------------------------------------------------------------
# Software
# ----------------------------------------------------------------------------
# Package installation - Prerequirements
RUN : \
  && apt-get update \
  && apt-get install -y \
    apt-transport-https \
    software-properties-common \
    wget
    
# Powershell source (yes, the project uses a lot of ps1 scripts!) 
RUN wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
RUN dpkg -i packages-microsoft-prod.deb

# Package installation - Main
RUN : \
  && apt-get update \
  && apt-get install -y \
        mc \
        openssh-server \
        tmux \
        python3-opencv \
        libopencv-dev \
        ros-foxy-image-transport \
        libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools \
        gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio \
        libgstreamer-plugins-base1.0-dev
        
# ----------------------------------------------------------------------------
# Configuration        
# ----------------------------------------------------------------------------
# Users
RUN echo 'root:aliveos' | chpasswd
RUN adduser --disabled-password --gecos "" aliveos
RUN adduser aliveos sudo
RUN echo 'aliveos:aliveos' | chpasswd

# SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# ----------------------------------------------------------------------------
# Environment
# ----------------------------------------------------------------------------

COPY aliveos_entrypoint.sh /aliveos_entrypoint.sh
RUN chmod +x /aliveos_entrypoint.sh
RUN echo "source /opt/ros/foxy/setup.bash --" >> /home/aliveos/.bashrc
RUN echo "export DISPLAY=host.docker.internal:0.0" >> /home/aliveos/.bashrc
RUN echo "export LIBGL_ALWAYS_INDIRECT=0" >> /home/aliveos/.bashrc

WORKDIR /home/aliveos

# ----------------------------------------------------------------------------
# Start
# ----------------------------------------------------------------------------
ENTRYPOINT ["/aliveos_entrypoint.sh"]
CMD [ "/bin/bash" ]
