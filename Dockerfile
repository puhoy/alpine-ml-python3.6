FROM python:alpine3.6

# todo: clean this up

# building scipy from https://github.com/abn/scipy-docker-alpine/blob/master/Dockerfile

RUN apk update \
    && apk upgrade \
    && apk add \
    bash \
    build-base \
    python3-dev \
    musl-dev \
    libxml2-dev \
    libxslt-dev \
    libffi-dev \
    libgcc \
    libc-dev \
    curl \
    jpeg-dev \
    zlib-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    tk-dev \
    tcl-dev \
    && pip install virtualenv \
    && apk add --virtual scipy-build \
        build-base python-dev openblas-dev freetype-dev pkgconfig gfortran \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install --no-cache-dir numpy \
    && pip install --no-cache-dir matplotlib \
    && pip install --no-cache-dir scipy \
    && pip install --no-cache-dir gensim \
    && pip install --no-cache-dir sklearn \
    && apk add --virtual scipy-runtime \
        freetype libgfortran libgcc libpng  libstdc++ musl openblas tcl tk \
    && rm -rf /var/cache/apk/*
