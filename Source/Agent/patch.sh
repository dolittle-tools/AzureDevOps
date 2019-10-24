#!/bin/bash
export VERSION=$(git tag --sort=-version:refname | head -1)
kubectl patch --namespace application-79a5f2f8-bd91-de33-4e9b-73b87b418124 statefulset azure-devops-build-agent -p "${PATCH//\$/azure-devops-build-agent:$VERSION}"