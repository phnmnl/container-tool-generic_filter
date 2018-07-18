<!-- Guidance: see https://github.com/phnmnl/phenomenal-h2020/wiki/The-Guideline-for-Container-GitHub-Respository-README.md-Creation -->

![Logo](w4m.png)

# W4M - Generic Filter
Version: phenomenal_2017.12.12

## Short description

<!-- 
This should only be 20 to 40 words, hopefully a single sentence.
-->

Allows to remove all samples and/or variables corresponding to specific values regarding designated factors or numerical variables.

## Description

A Galaxy module from the [Workflow4metabolomics](http://workflow4metabolomics.org) infrastructure. 

The generic filter tool allows you to remove rows in sample dataset or variable dataset. You select the rows you want to remove by specifying a column to check (column name) and a value or a numerical range to satisfy.
With this filter, it is also possible to remove NA values.

For further informations please refer to the project's [GitHub page](https://github.com/workflow4metabolomics/tool-generic_filter). 

## Key features

- Generic Filter

## Functionality


## Approaches

- Metabolomics / Untargeted
  
## Instrument Data Types

## Screenshots

## Tool Authors

- Marion Landi (INRA, PFEM)
- Melanie Petera (INRA, PFEM)

## Container Contributors

- Nils Paulhe (INRA, PFEM)

## Website

- http://workflow4metabolomics.org

## Git Repository

- https://github.com/workflow4metabolomics/tool-generic_filter.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/tool-generic_filter
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/tool-generic_filter ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
IMPORTANT: Publications section must be placed at the end and cannot be emptied!
-->

- Giacomoni F, Le corguillé G, Monsoor M, et al. Workflow4Metabolomics: a collaborative research infrastructure for computational metabolomics. Bioinformatics. 2015;31(9):1493-5. doi:10.1093/bioinformatics/btu813

<!-- 
Template used: https://github.com/phnmnl/container-rnmr/blob/master/README.md
Tool used for AMA citation formatting: https://mickschroeder.com/citation/?
--->
