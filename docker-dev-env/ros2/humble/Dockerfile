# Use the official ros:humble-ros-base image as a starting point
FROM ros:humble-ros-base

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Set the working directory
WORKDIR /root

# Update packages and install required software in a single RUN command
RUN echo 'root:ubuntu' | chpasswd && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install --fix-missing -y && \
    apt-get install -y --no-install-recommends \
      python3-pip \
      nodejs \
      ros-humble-rosbridge-suite \
      python3-rosdep \
      python3-opencv \
      ros-humble-image-publisher \
      curl \
      wget \
      vim \
      git \
      htop \
      zsh 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN wget -O ~/lunarvim_install.sh https://raw.githubusercontent.com/ohsirawat/.oh-dev-tools/master/lvim/install.sh

RUN rm -rf /var/lib/apt/lists/*

# Set the default shell
CMD ["/bin/zsh"]
