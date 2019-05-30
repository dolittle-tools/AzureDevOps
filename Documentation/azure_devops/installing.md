---
title: Installing
description: Overview of how to add an a build badge to your README.md
keywords: Build
weight: 3
author: einari
---
When the pipeline is in place, we want to hook this up in Azure DevOps.
Note: You'll need to be authorized in the organization in order to do this.

Navigate to your organization, for instance for Dolittle open-source projects, that would
be [this](https://dev.azure.com/dolittle/Dolittle%20open-source%20repositories).

Add a build pipeline:

![Adding build pipeline](images/azure_devops_1.png)

Select GitHub as the source of the code:

![Selecting GitHub as source](images/azure_devops_2.png)

Find the repository you're hooking up:

![Find repository](images/azure_devops_3.png)

Verify that the suggestion is correct for the repository or select the correct repository and then
grant Azure DevOps access and install.

![Select repository in GitHub and grant access to Azure DevOps](images/azure_devops_4.png)

Verify that it is the pipeline you're expecting:

![Verify pipeline and run](images/azure_devops_5.png)

Here is a full video:

![Azure DevOps adding pipeline video](images/azure_devops.gif)
