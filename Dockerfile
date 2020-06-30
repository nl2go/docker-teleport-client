FROM alpine:3.12.0

LABEL MAINTAINER=<ops@newsletter2go.com>

ENV TELEPORT_VERSION=2.2.7

RUN apk add --no-cache \
  libc6-compat \
  openssh-client

RUN wget -O /tmp/teleport.tgz "https://github.com/gravitational/teleport/releases/download/v${TELEPORT_VERSION}/teleport-v${TELEPORT_VERSION}-linux-amd64-bin.tar.gz" \
  && tar xvfz /tmp/teleport.tgz -C /usr/local/ \
  && ln -s /usr/local/teleport/tsh /usr/local/bin/tsh \
  && ln -s /usr/local/teleport/tctl /usr/local/bin/tctl \
  && ln -s /usr/local/teleport/teleport /usr/local/bin/teleport \
  && rm -f /tmp/teleport.tgz

COPY .docker/ /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/ash"]
