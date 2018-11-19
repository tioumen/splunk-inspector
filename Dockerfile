FROM python:2 AS appinspect

# Mounting volume where app is taking place
VOLUME /src

ENV APPINSPECT_VERSION="1.6.0"

# Installing app-inspect bin
RUN wget http://download.splunk.com/misc/appinspect/splunk-appinspect-1.6.0.tar.gz -O /tmp/splunk-appinspect.tar.gz && \
    pip install --no-cache /tmp/splunk-appinspect.tar.gz && \
    rm /tmp/splunk-appinspect.tar.gz && \
    apt-get update && apt-get -y install vim

# For appinspect further ... 
WORKDIR /src

# Starting appinspect against your app
CMD splunk-appinspect inspect /src/
