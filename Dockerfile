FROM ubuntu:20.04
LABEL maintainer="TiagoTi2 <tiagoandroidti@gmail.com>"

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Bootstrapping packages needed for installation
RUN \
  apt-get update && \
  apt-get install -yqq \
  locales \
  lsb-release \
  software-properties-common && \
  apt-get clean

# Set locale to UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  /usr/sbin/update-locale LANG=$LANG

# Install dependencies
# `universe` is needed for ruby
# `security` is needed for fontconfig and fc-cache

# RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe security" && \
#   add-apt-repository ppa:aacebedo/fasd

RUN  apt-get update && \
  apt-get -yqq install \
  autoconf \
  build-essential \
  curl \
  fasd \
  fontconfig \
  git \
  python3 \
  python-setuptools \
  python3-dev \
  ruby-full \
  sudo \
  tmux \
  tmuxinator \
  vim \
  wget \
  zsh

RUN  gem install pry && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch 200323155805.txt

# Install dotfiles
COPY . /root/.yadr

WORKDIR /root/.yadr
# Let the container know that there is no tty
ENV DEBIAN_FRONTEND readline
# RUN rake install

# Run a zsh session
CMD [ "/bin/zsh" ]
