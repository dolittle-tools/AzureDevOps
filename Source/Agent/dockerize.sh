#!/bin/bash
export VERSION=$(git tag --sort=-version:refname | head -1)
docker build -t dolittle/azure-devops-build-agent .
docker tag dolittle/azure-devops-build-agent dolittle/azure-devops-build-agent:$VERSION
