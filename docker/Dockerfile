FROM osrf/ros:foxy-desktop

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
        powershell

# ----------------------------------------------------------------------------
# Environment
# ----------------------------------------------------------------------------

# Workdir
RUN mkdir /opt/aliveos
WORKDIR /opt/aliveos

#Dev repo
ADD . /opt/aliveos/dev

# To run GUI on a local machine
ENV DISPLAY=host.docker.internal:0.0  
ENV LIBGL_ALWAYS_INDIRECT=0

# ----------------------------------------------------------------------------
# Start
# ----------------------------------------------------------------------------
ENTRYPOINT [ "/ros_entrypoint.sh" ]
CMD [ "/bin/bash" ]
