FROM ruby:2.5.1-alpine3.7

RUN apk --update --no-cache add \
    build-base \
    coreutils \
    libffi-dev \
    libressl-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    readline-dev \
    ruby-dev \
    tzdata \
    zlib-dev \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.0 libssl1.0 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family \
 && gem install activesupport slim wicked_pdf

WORKDIR /app
COPY ./ /app

COPY wkhtmltopdf /bin

WORKDIR /data
