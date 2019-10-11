#!/bin/bash
if [ -z "$1" ]; then
    echo "You MUST provide an image-tag when deploying Docker images, and it should be a semantic version number."
    exit 1
fi
TAG="$1"
PATCH='{"spec": { "template": { "spec": { "containers": [{ "name":"build-agent", "image": "dolittle/$"}] }}}}'
kubectl patch --namespace application-79a5f2f8-bd91-de33-4e9b-73b87b418124 statefulset azure-devops-build-agent -p "${PATCH//\$/azure-devops-build-agent:$TAG}"