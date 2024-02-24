# Vespa RAG "hack pack"

## What is this?
A "hack pack" to quickly get started with a RAG architecture chat bot built on Vespa and ollama.

## What do I need?
You must be able to download and run a container image, using e.g. Docker or Podman. To use the demo front-end, you need nodejs and some dependencies.

## How do I use it?
Pull the container image and run it (using Docker or Podman). Make sure to expose ports 8080, 19071 and 11434:

```bash
podman run --name vespa --hostname vespa-container \
  --publish 8080:8080 --publish 19071:19071 --publish 11434:11434 \
    quay.io/andreer/vespa-hack-pack
```

When the docker image is started you can start the nodejs-frontend:

```bash
cd nodejs-frontend && npm install && npm run dev
```

Now, try going to http://localhost:3000 and ask: "What is a Glorbofel?"

Feed in some relevant information with the command `vespa feed example-document.json` or
```bash
curl -X POST --data @example-document.json 'http://127.0.0.1:8080/document/v1/mynamespace/my_content/docid/example-document-id'
```

And try asking again!

## Some possible next steps

* Collect and feed in more information for the chatbot to use.
* Modify the prompt in the nodejs-frontend
* Change the way relevant information is selected (by modifying the [Vespa query](https://docs.vespa.ai/en/query-language.html) or the [ranking function](https://docs.vespa.ai/en/ranking-expressions-features.html)
* Write another front-end to do something entirely different
* Test, find and fix bugs (there are usually some ...)

## Security warning
Beware: No concern at all has been taken for security in this proof of concept, nothing is encrypted and all ports are wide open.
