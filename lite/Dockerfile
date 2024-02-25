FROM vespaengine/vespa:latest

# because it's easier
USER root

# pre-deploy template application
ADD sample-app /root/sample-app 

RUN /usr/local/bin/start-container.sh & (sleep 20 && vespa deploy /root/sample-app) & sleep 60

EXPOSE 8080 19071 5005
