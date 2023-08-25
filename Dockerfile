FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
  apt upgrade -y && \
  apt install -y -qq \
  sudo \
  unzip \
  locales \
  openjdk-17-jre-headless \
  curl \
  git \
  software-properties-common \
  python3-dev \
  python3-pip

#RUN add-apt-repository -y ppa:neovim-ppa/unstable && \
#  apt update && \
#  apt install -y neovim

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
  chmod a+x nvim.appimage && \
  ./nvim.appimage --appimage-extract && \
  sudo mv squashfs-root /usr/local/nvim.squashfs-root && \
  sudo ln -s /usr/local/nvim.squashfs-root/AppRun /usr/local/bin/nvim && \
  rm ./nvim.appimage

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"

RUN pip3 install --upgrade neovim && \
  rm -rf ~/.cache && \
  rm -rf ~/.local

RUN curl -fsSL https://deno.land/x/install/install.sh | sh
RUN cp /root/.deno/bin/deno /usr/local/bin

ENTRYPOINT ["tail", "-f"]
