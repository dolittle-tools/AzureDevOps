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

Please refer to the SemVer v2 if you need to understand the syntax. Also refer to our page on [versioning](https://dolittle.io/contributing/guidelines/versioning/).

- **major, minor** and **patch** are respectively Labels to update the major, minor or patch version, 
  depending on the changes that have been done on the package.
  If you put several Lablels, only the most impacting one will be updated (e.g major over minor).

- **preview** and **new** are both used when working with pre-releases.
  **preview** label must be added in the pull request every time you work with a preview.
  Adding **new** Label with the **preview** label will create a new preview version. The version will
  be based on the last version. (e.g 3.4.7 >> 4.0.0-preview.1 ).
  Adding **major** label with the **preview** label will do the opposite and create a release version
  based on the preview. (e.g 4.0.0-preview.23 >> 4.0.0)
  Using **preview** only is for updating the last existing preview version. (4.0.0-preview.1 >> 4.0.0-preview.2)
  
![Labels in pull request](../images/labels_pr.png)



## DotNet building

If you are contributing to the Dolittle's dotnet packages you can use our pipeline though for this.

*Please refer to [adding pipeline](https://dolittle.io/tooling/azuredevops/adding_pipeline/) if you are creating
a new repository or if this one is not linked yet with azure pipeline*.

Our Dotnet pipeline allows us to build, test, set the version and release our packages on NuGet automatically. To use it we use
pull requests on github in accordance with the **versioning** part. We also use versioning labels.

### Cascading

*You also can refer to [adding pipeline](https://dolittle.io/tooling/azuredevops/adding_pipeline/).*

Our dotNet building pipeline also allow us to build dependants projects from the principal project pipeline.
This feature that we call cascade simplify the dependency build between several projects, automatically.

For instance: *I want to build our "Fundamentals" project using pipeline to make it easier and faster, but
"Fundamentals" has projects that depends on it. So in the **azure-pipeline.yml** file from Fundamentals,
i put all the packages that are built on Fundamentals and all the packages that are dependents on these ones.*

After that, all the packages under *CASCADE* will be built on the new version of the main project. That leads 
to a new *patch* version of each packages.

```yaml
jobs:
- template: Source/DotNet/framework.yml@templates
  parameters:
    CASCADES:
      - 'dolittle-runtime/Runtime'
      - 'dolittle-extensions/ReadModels.MongoDB'
      - 'dolittle-runtime/Runtime.Events.MongoDB'
      - 'dolittle-runtime/Runtime.Events.Azure'
      - 'dolittle-runtime/DotNET.SDK'
      - 'dolittle-interaction/AspNetCore'
```

***Note: Cascades are not triggered on a 'major' or 'preview' update, considered as a breaking change***
