FROM alpine:3.14
MAINTAINER HSOWW <hsoww@hsoww.net>

ENV HUGO_VERSION=0.104.2
ENV HUGO_SHA=3f69db03190ee41718a766633a51032152ac9ff0c5931bdc6cf27f95523d2ad1

# Install HUGO
RUN set -eux && \
    apk add --update --no-cache \
      ca-certificates \
      openssl \
      libc6-compat \
      libstdc++ \
      git && \
  wget -O ${HUGO_VERSION}.tar.gz https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  echo "${HUGO_SHA}  ${HUGO_VERSION}.tar.gz" | sha256sum -c && \
  tar xf ${HUGO_VERSION}.tar.gz && chmod +x hugo && mv hugo* /usr/local/bin/hugo && \
  rm -r ${HUGO_VERSION}.tar.gz && \
  ## rm /var/cache/apk/* 
  hugo version

EXPOSE 1313

CMD ["/usr/local/bin/hugo"]
