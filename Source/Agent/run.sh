#!/bin/bash
docker run -e AZP_URL=https://dev.azure.com/dolittle -e AZP_TOKEN=<access token from Azure DevOps> -e AZP_AGENT_NAME=localagent dolittle/azure-devops-build-agent
