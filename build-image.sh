#!/bin/bash
# cd into "lite" or "full" (with ollama in container) first
cp -r ../sample-app .
podman build -t vespa-hack-pack-`basename $(pwd)` .
