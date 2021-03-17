FROM alpine

RUN echo "*** Install packages" \ 
  &&apk --no-cache add curl \
    aws-cli \
    bash \
  && aws --version \
  && curl --version \
  && echo "*** Configure cronjobs" \
  && echo mkdir -p /etc/periodic/5min \
  && echo "*/1    *       *      *       *           run-parts /etc/periodic/1min" >> /etc/crontabs/root

ENV PATH="${PATH}:/opt/route53-updater"

COPY route53-updater /opt/route53-updater/route53-updater
COPY update-record.sh /etc/periodic/1min/update-record

# CMD [ "crond", "-f", "-l", "0" ]
# CMD ["crond", "-b", "-l", "8", "&&", "/bin/bash"]
