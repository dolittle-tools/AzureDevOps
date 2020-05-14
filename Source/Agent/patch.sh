#!/bin/bash
export VERSION=$(git tag --sort=-version:refname | head -1)
PATCH='{"spec": { "template": { "spec": { "containers": [{ "name":"build-agent", "image": "dolittle/$"}] }}}}'
if [[ "$VERSION" = \v* ]] ; then
    VERSION=${VERSION:1}
fi
kubectl patch --namespace application-79a5f2f8-bd91-de33-4e9b-73b87b418124 statefulset azure-devops-build-agent -p "${PATCH//\$/azure-devops-build-agent:$VERSION}"