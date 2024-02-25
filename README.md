# Vespa RAG "hack pack"

## What is this?
A "hack pack" to quickly get started with a RAG architecture chat bot built on [Vespa](vespa.ai) and ollama.

## What do I need?
* You must be able to download and run a container image, using e.g. [Podman](https://podman.io) or [Docker](https://www.docker.com).
* You need [nodejs](https://nodejs.org/en) to run the demo front-end.

## How do I use it?

Clone this git repo, and cd into it.
```bash
git clone git@github.com:andreer/vespa-hack-pack.git && cd vespa-hack-pack
```

Install Ollama with the `llama2` model on your laptop: go to https://ollama.com to download and install it. If you don't want to, see the section at the end.

Pull the container image and run it using Docker or Podman.

Make sure to expose ports 8080 and 19071:

```bash
podman run --name vespa --hostname vespa-container \
  --publish 8080:8080 --publish 19071:19071 \
    quay.io/andreer/vespa-hack-pack
```

When the docker image is started you can start the nodejs-frontend:

```bash
cd nodejs-frontend && npm install && npm run dev
```

Now, try going to http://localhost:3000 and ask: "What is a Glorbofel?"

Feed in some relevant information with the command `vespa feed example-document.json`(Vespa CLI) or
```bash
curl -X POST --data @example-document.json 'http://127.0.0.1:8080/document/v1/mynamespace/my_content/docid/example-document-id'
```

And try asking again!

## Some possible next steps

* Collect and feed in more information for the chatbot to use. See vespa-facts.jsonl for how to feed many documents efficiently.
* Modify the prompt in the nodejs-frontend.
* Change the way relevant information is selected (by modifying the [Vespa query](https://docs.vespa.ai/en/query-language.html) or the [ranking function](https://docs.vespa.ai/en/ranking-expressions-features.html)
* Write another front-end to do something entirely different
* Select another [model](https://ollama.com/library) (`in nodejs-frontend/pages/api/generate.js`) - or modify nodejs-frontend/.env to use OpenAI
* Test, find and fix bugs (there are usually some ...)

## Using the docker image with Ollama included (5.9GiB):

```bash
podman run --name vespa --hostname vespa-container \
  --publish 8080:8080 --publish 19071:19071 --publish 11434:11434 \
    quay.io/andreer/vespa-hack-pack
```

## Security warning
Beware: No concern at all has been taken for security in this proof of concept, nothing is encrypted and all ports are wide open.
