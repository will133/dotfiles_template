#!/bin/bash

docker run --name=cockroach -d -p 26257:26257 -p 26258:8080 cockroachdb/cockroach:v23.1.11 start-single-node --insecure
