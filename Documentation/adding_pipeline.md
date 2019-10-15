---
title: Adding pipeline
description: Overview of how to add an a pipeline
keywords: Build
weight: 1
author: einari
aliases: /tools/azuredevops/adding_pipeline
---
Start by adding a file called `azure-pipelines.yml` at the root of the
repository you want to use.

```yaml
trigger:
- master

resources:
  repositories:
    - repository: templates
      type: github
      name: dolittle-tools/Build
      endpoint: dolittle-tools

jobs:
- template: Source/DotNet/framework.yml@templates
```

As you can see, the file refer to a job template. You'll find the different
available templates in the [repository](https://github.com/dolittle-tools/Build).

## Cascades

It is possible to cascade to a pipeline for another project. This feature is
basically to make versioning for things like NuGet to work properly and guarantee
that the correct versions are being used when one project is dependent on the other.
This might not be important to you, but for some of the Dolittle projects, this is
vital - as we rely on wildcard for minor and patch in versioning and trust our own
commitment to [versioning](https://dolittle.io/contributing/guidelines/versioning/).

You simply add a parameter called `CASCADES`to the job, this can hold one or more
projects to cascade to - space separated. The format is [GitHub Organization]/[Repository].

```yaml
jobs:
- template: Source/DotNet/framework.yml@templates
  parameters:
    CASCADES: dolittle-runtime/DotNET.SDK
```
