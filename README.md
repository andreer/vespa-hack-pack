# Vespa [Retrieval Augmented Generation](https://arxiv.org/abs/2005.11401) "hack pack"

## What is this?
A "hack pack" to quickly get started with a RAG architecture chat bot built on [Vespa](vespa.ai) and [Ollama](https://ollama.com).

## What do I need?
* You must be able to download and run a container image, using e.g. [Podman](https://podman.io) or [Docker](https://www.docker.com).
* You need [Node.js](https://nodejs.org/en) to run the demo front-end.

## How do I use it?

Clone this git repo, and cd into it.
```bash
git clone git@github.com:andreer/vespa-hack-pack.git && cd vespa-hack-pack
```

Install Ollama with the `llama2` model on your laptop: go to https://ollama.com to download and install it. If you don't want to, see the section at the end.

Pull the container image and run it using Docker or Podman.

Make sure to allow 4GB+ RAM for Docker/Podman, and expose ports 8080 and 19071.

```bash
podman run --name vespa --hostname vespa-container \
  --publish 8080:8080 --publish 19071:19071 \
    quay.io/andreer/vespa-hack-pack-lite-intel
```

(remove the `-intel` suffix if you have an ARM cpu.)

When the docker image is started you can start the Node.js frontend:

```bash
cd nodejs-frontend && npm install && npm run dev
```

Now, try going to http://localhost:3000 and ask the following question:
```
What is a Glorbofel?
```

Feed in some relevant information with the command `vespa feed example-document.json`(Vespa CLI) or
```bash
curl -X POST --data @example-document.json 'http://127.0.0.1:8080/document/v1/mynamespace/my_content/docid/example-document-id'
```

And then try asking the same question again!

## Some possible next steps

* Collect and feed in more information for the chatbot to use. See vespa-facts.jsonl for how to feed many documents efficiently.
* Modify the prompt in the nodejs-frontend.
* Understand what is happening in the retrieval stage - see [the function in generate.js](https://github.com/andreer/vespa-hack-pack/blob/main/nodejs-frontend/pages/api/generate.js#L9-L31)
* Install the [Vespa CLI](https://docs.vespa.ai/en/vespa-cli.html) so you can do more Vespa things
* Change the way relevant information is selected (by modifying the [Vespa query](https://docs.vespa.ai/en/query-language.html) or the [ranking function](https://docs.vespa.ai/en/ranking-expressions-features.html) in the [schema](https://docs.vespa.ai/en/schemas.html) in `sample-app/schemas/my_content.sd` (you'll have to use `vespa deploy` for these changes to take effect)
* Write another front-end to do something entirely different
* Select another [model](https://ollama.com/library) (`in nodejs-frontend/pages/api/generate.js`) - or modify nodejs-frontend/.env to use OpenAI
* Test, find and fix bugs (there are usually some ...)

## Security warning
Beware: No concern at all has been taken for security in this proof of concept, nothing is encrypted and all ports are wide open.
