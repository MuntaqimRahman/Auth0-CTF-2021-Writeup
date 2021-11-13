#!/bin/bash
docker rm -f web_swift_jobs
docker build -t web_swift_jobs . && \
docker run --name=web_swift_jobs --rm -p1337:1337 -it web_swift_jobs