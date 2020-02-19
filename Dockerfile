FROM alpine

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ENV RTTYS_USERNAME="admin"
ENV RTTYS_PASSWORD="admin"
ENV RTTYS_TOKEN=""

ARG RTTYS_VERSION="3.1.1"
ARG RTTYS_RELEASE="4192264"
ARG RTTYS_CHECKSUM="2cbf983c05b19f4c16a81902e82b797c87ab57faa0a6db219049b4b3462f731a"

EXPOSE 5912 5913

ADD https://github.com/zhaojh329/rttys/files/${RTTYS_RELEASE}/rttys-linux-amd64.tar.gz /tmp/rttys.tar.gz

RUN if [ "${RTTYS_TOKEN}" == "" ]; then RTTYS_TOKEN=$(date +%s%N | md5sum | head -c 32); fi \
  && echo "Username: ${RTTYS_USERNAME}" \
  && echo "Password: ${RTTYS_USERNAME}" \
  && echo "Token: ${RTTYS_TOKEN}" \
  && echo "Version: ${RTTYS_VERSION}" \
  && echo "Release: ${RTTYS_RELEASE}" \
  && echo "CheckSum: ${RTTYS_CHECKSUM}" \
  && if [ "${RTTYS_CHECKSUM}" != "$(sha256sum /tmp/rttys.tar.gz | awk '{print $1}')" ]; then exit 1; fi \
  && rm -rf /rttys \
  && mkdir /rttys \
  && tar -zxf /tmp/rttys.tar.gz -C /rttys --strip-components 1 \
  && rm -rf /tmp/rttys.tar.gz \
  && echo "http-username: ${RTTYS_USERNAME}" > /rttys/rttys.conf \
  && echo "http-password: ${RTTYS_PASSWORD}" >> /rttys/rttys.conf \
  && echo "token: ${RTTYS_TOKEN}" >> /rttys/rttys.conf

WORKDIR /rttys

ENTRYPOINT ["/rttys/rttys"]
