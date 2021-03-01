FROM alpine:3.13
MAINTAINER HSOWW <hsoww@hsoww.net>

ENV HUGO_VERSION=0.81.0
ENV HUGO_SHA=3c7d034405c67bf571b6d8f001d5a9c49dd87dbfa32b3b19d16e898c46f8f5e2

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
