FROM google/cloud-sdk:249.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
      vim kubectl && \
    apt-get clean

COPY curl-deployments.sh /root/
CMD "/root/curl-deployments.sh"
