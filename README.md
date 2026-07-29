 # Soil Microbiome Analysis

This repository contains reproducible R workflows developed for soil microbiome and microbial community ecology analysis.

## Repository overview

The repository includes both a simulated PERMANOVA workflow and descriptive PCoA workflows developed using aggregated microbiome observations from my doctoral research.

## Workflows

### 1. PERMANOVA demonstration

`permanova_example.R`

A reproducible example using the `vegan` package to demonstrate:

- Bray-Curtis dissimilarity
- PERMANOVA using `adonis2()`
- 999 permutations
- multivariate dispersion using `betadisper()`
- permutation testing using `permutest()`

The dataset used in this script is simulated for learning and demonstration purposes.

### 2. Genus-level PCoA

`phd_genus_pcoa.R`

A descriptive genus-level community analysis using:

- Bray-Curtis dissimilarity
- exclusion of unassigned reads
- Principal Coordinates Analysis (PCoA)
- ordination visualization

The analysis compares aggregated microbiome observations associated with different soil/genotype categories from my doctoral research.

### 3. Microbial niche PCoA

`phd_niche_pcoa.R`

A descriptive genus-level community analysis comparing aggregated observations from:

- Bulk soil
- Endophytes
- Epiphytes

The workflow uses Bray-Curtis dissimilarity and PCoA to visualize differences in microbial community composition.

## Reproducibility

The workflows are implemented in R using the `vegan` package and are documented step-by-step to facilitate transparent and reproducible community ecology analyses.

## Data availability

The underlying doctoral research dataset is not included in this public repository.

The PhD-related scripts document the analytical workflow while avoiding public distribution of the underlying research dataset.

## Statistical note

The PhD-related datasets represented in this repository consist of aggregated observations without biological replicates. Therefore, these analyses are presented as descriptive ordination analyses rather than inferential statistical tests.

Inferential PERMANOVA should be conducted when appropriate biological replication and sample-level metadata are available.

## Detailed PhD analysis documentation

See [`README_PHD_ANALYSIS.md`](README_PHD_ANALYSIS.md) for further information about the doctoral research-related workflows and their interpretation.

## Software

- R
- vegan
- Bray-Curtis dissimilarity
- Principal Coordinates Analysis (PCoA)
- PERMANOVA
