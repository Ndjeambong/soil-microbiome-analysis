# Soil Microbiome Analysis

This repository contains reproducible R examples related to soil microbiome and community ecology analysis.

## Current workflow

The `permanova_example.R` script demonstrates a basic multivariate community analysis workflow using the `vegan` package.

The workflow includes:

1. Simulated microbial community abundance data
2. Sample metadata and treatment grouping
3. Bray-Curtis dissimilarity
4. PERMANOVA using `adonis2()`
5. 999 permutations
6. Assessment of multivariate dispersion using `betadisper()`
7. Permutation testing of dispersion using `permutest()`

## R package

- `vegan`

## Reproducibility

A fixed random seed is used in the script, and the analysis is documented in a single R script to facilitate reproducibility.

## Purpose

This repository is part of my ongoing development of R-based skills for reproducible microbiome and community ecology research.

## Data note

The dataset included in this repository is a simulated dataset created for learning and demonstration purposes. It does not represent unpublished experimental data or data from a specific research study.

This is what I did
