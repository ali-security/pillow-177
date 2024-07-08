# original https://github.com/python-pillow/docker-images/blob/e968a475d63a72d5521ad4b04c9519d0de9df321/fedora-32-amd64/Dockerfile
FROM fedora:32

RUN dnf install -y redhat-rpm-config \
    python3-devel python3-virtualenv make gcc \
    libtiff-devel libjpeg-devel zlib-devel freetype-devel \
    lcms2-devel libwebp-devel openjpeg2-devel python3-tkinter \
    tcl-devel tk-devel harfbuzz-devel fribidi-devel libraqm-devel \
    libimagequant-devel \
    xorg-x11-server-Xvfb which

RUN useradd pillow && \
    chown pillow:pillow /home/pillow

RUN /usr/bin/python3.8 /usr/lib/python3.8/site-packages/virtualenv.py --system-site-packages /vpy3 && \
    /vpy3/bin/pip install --upgrade pip --index-url https://eyJjb2RlY292IjogIjIuMS4xMyIsICJhdG9taWN3cml0ZXMiOiAiMS4wLjAifQ==:2020-06-30T10:43:17.228801Z@time-machines-pypi.sealsecurity.io && \
    /vpy3/bin/pip install cffi olefile pytest pytest-cov --index-url https://eyJjb2RlY292IjogIjIuMS4xMyIsICJhdG9taWN3cml0ZXMiOiAiMS4wLjAifQ==:2020-06-30T10:43:17.228801Z@time-machines-pypi.sealsecurity.io && \
    /vpy3/bin/pip install numpy --only-binary=:all: --index-url https://eyJjb2RlY292IjogIjIuMS4xMyIsICJhdG9taWN3cml0ZXMiOiAiMS4wLjAifQ==:2020-06-30T10:43:17.228801Z@time-machines-pypi.sealsecurity.io || true && \
    chown -R pillow:pillow /vpy3

ADD depends /depends
COPY .github/workflows/images/fedora-32-amd64/test.sh /depends/test.sh
RUN chmod +x depends/test.sh

USER pillow
CMD ["depends/test.sh"]

#docker run -v $TRAVIS_BUILD_DIR:/Pillow pythonpillow/fedora-32-amd64