FROM node:15.6.0-alpine3.12
MAINTAINER HSOWW <hsoww@hsoww.net>

ENV HUGO_VERSION=0.80.0
ENV HUGO_SHA=8405248a7234af657979a209d6778afaabd9b40857b7274649ee952ce2937bed

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
  
RUN npm i -g netlify-cli

EXPOSE 1313

CMD ["/usr/local/bin/hugo"]
