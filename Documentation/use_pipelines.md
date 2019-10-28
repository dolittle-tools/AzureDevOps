---
title: Using pipelines
description: Overview of existing pipelines and how to use them
keywords: Build
weight: 2
author: medaly
aliases: /tools/azuredevops/use_pipelines
---

We have several pipelines already built and some yet to build. This page shows you how to use them.

## Versioning

Our pipelines are almost all hooked up to out versioning pipeline that automatically sets the version
to our packages when built. We follow the Semantic Versioning v2.
To be able to control the versioning of our packages we use pull requests in GitHub, and we add Labels 
in those pull requests, depending on the version we need to update. You must use them if you are building 
a project with versions using our pipelines.

*Version can be something like 3.0.9 or 2.0.11-preview.55* 

Please refer to the SemVer v2 if you need to understand the syntax.

- **major, minor** and **patch** are respectively Labels to update the major, minor or patch version, 
  depending on the changes that have been done on the package.
  If you put several Lablels, only the most impacting one will be updated (e.g major over minor).

- **preview** and **new** are both used when working with pre-releases.
  **preview** label must be added in the pull request every time you work with a preview.
  Adding **new** Label with the **preview** label will create a new preview version. The version will
  be based on the last version. (e.g 3.4.7 >> 4.0.0-preview.1 ).
  Adding **major** label with the **preview** label will do the opposite and create a release version
  based on the preview. (e.g 4.0.0-preview.23 >> 4.0.0)
  
![Labels in pull request](../images/labels_pr.png)
