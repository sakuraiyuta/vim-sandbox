FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
  apt upgrade -y && \
  apt install -y -qq \
  sudo \
  locales \
  openjdk-17-jre-headless \
  curl \
  git \
  software-properties-common \
  python3-dev \
  python3-pip

RUN add-apt-repository -y ppa:neovim-ppa/unstable && \
  apt update && \
  apt install -y neovim


ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"

RUN pip3 install --upgrade neovim && \
  rm -rf ~/.cache && \
  rm -rf ~/.local

ENTRYPOINT ["tail", "-f"]
