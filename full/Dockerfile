FROM vespaengine/vespa:latest

# because it's easier
USER root

# download and install ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# download the llama2 model
RUN ollama serve & (sleep 20 && ollama pull llama2) # wait for ollama to be ready before pulling

# run ollama on container start
RUN sed -i "s/wait/OLLAMA_HOST=0.0.0.0 ollama serve/" /usr/local/bin/start-container.sh

# pre-deploy template application
ADD sample-app /root/sample-app 

RUN /usr/local/bin/start-container.sh & (sleep 20 && vespa deploy /root/sample-app) & sleep 60

EXPOSE 8080 19071 5005 11434
