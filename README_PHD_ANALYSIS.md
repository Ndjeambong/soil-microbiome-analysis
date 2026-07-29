# PhD Microbiome Analysis

This document describes the R-based community ecology analyses developed using aggregated microbiome data from my doctoral research.

## Analytical focus

The analyses were performed at the genus level and focused on descriptive characterization of microbial community composition using:

- Bray-Curtis dissimilarity
- Principal Coordinates Analysis (PCoA)
- Relative abundance transformation
- Exclusion of unassigned taxonomic reads

## Analysis 1: Genotype-associated microbiome composition

Script:

`phd_genus_pcoa.R`

The analysis compares genus-level community composition among:

- BulkSoil_Ca
- BulkSoil_Go
- Pusa_Shyamala
- Solanum_Torvum

Bray-Curtis dissimilarities were calculated using genus-level abundance data, followed by PCoA.

After exclusion of the `Not_Assigned` category, the first two PCoA axes explained approximately 93.3% of the variation.

## Analysis 2: Microbial niche composition

Script:

`phd_niche_pcoa.R`

The analysis compares genus-level microbial community composition among:

- BulkSoil_Ca
- BulkSoil_Go
- Endophytes
- Epiphytes

Bray-Curtis dissimilarities were calculated using assigned genus-level abundance data, followed by PCoA.

The first two PCoA axes explained approximately 94.2% of the variation.

## Interpretation

The ordination analyses provide descriptive visualization of differences in genus-level community composition among the aggregated sample categories.

The genotype-associated analysis showed separation between bulk-soil observations and genotype-associated observations.

The microbial-niche analysis showed separation between bulk-soil and plant-associated microbial communities, with further differentiation between endophytic and epiphytic communities.

## Statistical limitation

The datasets represented in these scripts consist of aggregated observations rather than biological replicates.

Therefore, these analyses are presented as descriptive ordination analyses. Inferential statistical testing of genotype or niche effects is not performed on these aggregated observations.

PERMANOVA should be conducted only when appropriate biological or experimental replication and corresponding sample-level metadata are available.

## Data availability

The underlying doctoral research dataset is not included in this public repository.

The scripts document the analytical workflow while avoiding public distribution of the underlying research data.

## Reproducibility

The analyses were implemented in R using the `vegan` package.

The scripts contain documented analytical steps to facilitate transparent and reproducible community ecology workflows.

## Software

- R
- vegan
- Bray-Curtis dissimilarity
- Principal Coordinates Analysis (PCoA)
