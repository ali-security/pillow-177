# original from https://github.com/python-pillow/docker-images/blob/e968a475d63a72d5521ad4b04c9519d0de9df321/centos-6-amd64/Dockerfile
FROM centos:6

RUN sed -i 's/^mirrorlist/\#mirrorlist/' /etc/yum.repos.d/*
RUN sed -i 's/^\#baseurl=http:\/\/mirror.centos.org\/centos\/\$releasever\//baseurl=https:\/\/vault.centos.org\/6.10\//' /etc/yum.repos.d/*

RUN cat <<EOT >> /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo 
[centos-sclo-rh]
name=CentOS-6.10 - SCLo rh
baseurl=http://vault.centos.org/centos/6.10/sclo/\$basearch/rh/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo

[centos-sclo-sclo]
name=CentOS-6.10 - SCLo sclo
baseurl=http://vault.centos.org/centos/6.10/sclo/\$basearch/sclo/
gpgcheck=1
enabled=1
EOT

# RUN rm -rf /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo

RUN yum install --nogpgcheck -y epel-release centos-release-scl

RUN yum install --nogpgcheck -y rh-python36 rh-python36-python-virtualenv \
    gcc xorg-x11-server-Xvfb ghostscript sudo \
    libtiff-devel libjpeg-devel zlib-devel freetype-devel \
    lcms2-devel libwebp-devel openjpeg2-devel tkinter \
    tcl-devel tk-devel libffi-devel

RUN useradd --uid 1000 pillow

RUN bash -c "source /opt/rh/rh-python36/enable && \
    /opt/rh/rh-python36/root/usr/bin/virtualenv -p python3.6 --system-site-packages /vpy3 && \
    /vpy3/bin/pip install --upgrade pip && \
    /vpy3/bin/pip install cffi olefile pytest pytest-cov --index-url https://eyJjb2RlY292IjogIjIuMS4xMyIsICJhdG9taWN3cml0ZXMiOiAiMS4wLjAifQ==:2020-06-30T10:43:17.228801Z@time-machines-pypi.sealsecurity.io && \
    /vpy3/bin/pip install numpy --only-binary=:all:  --index-url https://eyJjb2RlY292IjogIjIuMS4xMyIsICJhdG9taWN3cml0ZXMiOiAiMS4wLjAifQ==:2020-06-30T10:43:17.228801Z@time-machines-pypi.sealsecurity.io || true && \
    cat /opt/rh/rh-python36/enable /vpy3/bin/activate > /vpy3/bin/activate3.6 && \
    mv /vpy3/bin/activate3.6 /vpy3/bin/activate && \
    chown -R pillow:pillow /vpy3"

ADD depends /depends


COPY .github/workflows/images/ubuntu-20.04-focal-amd64/test.sh /depends/test.sh
RUN chmod +x depends/test.sh
ADD .github/workflows/images/docker_install.sh /tmp/docker_install.sh
RUN bash /tmp/docker_install.sh

USER pillow
CMD ["depends/test.sh"]
