#!/bin/bash
cp -r ../sample-app .
podman build -t vespa-hack-pack-lite .
