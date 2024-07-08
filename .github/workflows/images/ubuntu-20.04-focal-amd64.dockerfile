# originally from https://github.com/python-pillow/docker-images/blob/e968a475d63a72d5521ad4b04c9519d0de9df321/ubuntu-20.04-focal-amd64/Dockerfile
FROM ubuntu:focal

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y \
    install sudo xvfb \
    git wget virtualenv python3-numpy python3-scipy netpbm \
    ghostscript libffi-dev libjpeg-turbo-progs \
    python3-setuptools \
    python3-dev cmake  \
    libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev \
    python3-tk \
    libharfbuzz-dev libfribidi-dev && apt-get clean

RUN useradd pillow && addgroup pillow sudo && \
    mkdir /home/pillow && chown pillow:pillow /home/pillow

RUN virtualenv -p /usr/bin/python3.8 --system-site-packages /vpy3 && \
    /vpy3/bin/pip install --upgrade pip && \
    /vpy3/bin/pip install cffi olefile pytest pytest-cov && \
    chown -R pillow:pillow /vpy3

ADD depends /depends
RUN cd /depends && ./install_imagequant.sh && ./install_raqm.sh


ADD .github/workflows//images/docker_install.sh /tmp/docker_install.sh
RUN /tmp/docker_install.sh

USER pillow


CMD ["depends/test.sh"]
