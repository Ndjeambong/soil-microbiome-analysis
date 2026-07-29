# =========================================================
# Genus-level PCoA of PhD microbiome data
# Analysis: Microbial niche
# Package: vegan
#
# Purpose:
# Descriptive comparison of genus-level microbial community
# composition across soil and plant-associated niches.
#
# Data note:
# The dataset represents aggregated PhD microbiome observations.
# Biological replicates are not available in this table.
# Therefore, no inferential PERMANOVA is performed.
#
# Data are not included in the public GitHub repository.
# =========================================================

library(vegan)

# ---------------------------------------------------------
# 1. Genus-level abundance data
# ---------------------------------------------------------

genus_niche <- data.frame(
  Acidovorax = c(0, 0, 312, 23),
  Allorhizobium_Neorhizobium_Pararhizobium_Rhizobium =
    c(0, 0, 90, 0),
  Bacillus = c(77, 125, 148, 317),
  Ensifer = c(0, 0, 233, 32),
  Methanocella = c(0, 70, 0, 192),
  Pseudomonas = c(0, 0, 157, 112),
  Sphingobium = c(0, 0, 473, 43),
  Streptomyces = c(0, 0, 271, 5),
  Terrabacter = c(0, 0, 213, 16),
  Not_Assigned = c(19442, 18685, 71196, 76424)
)

rownames(genus_niche) <- c(
  "BulkSoil_Ca",
  "BulkSoil_Go",
  "Endophytes",
  "Epiphytes"
)

# ---------------------------------------------------------
# 2. Exclude unassigned reads
# ---------------------------------------------------------

genus_niche_assigned <- genus_niche[
  ,
  !colnames(genus_niche) %in% "Not_Assigned"
]

# ---------------------------------------------------------
# 3. Relative abundance
# ---------------------------------------------------------

relative_niche <- decostand(
  genus_niche_assigned,
  method = "total"
)

print(relative_niche)

# ---------------------------------------------------------
# 4. Bray-Curtis dissimilarity
# ---------------------------------------------------------

bray_niche <- vegdist(
  genus_niche_assigned,
  method = "bray"
)

print(bray_niche)

# ---------------------------------------------------------
# 5. Principal Coordinates Analysis
# ---------------------------------------------------------

pcoa_niche <- cmdscale(
  bray_niche,
  k = 2,
  eig = TRUE
)

print(pcoa_niche$points)

# ---------------------------------------------------------
# 6. Percentage of variation explained
# ---------------------------------------------------------

positive_eigenvalues <- pcoa_niche$eig[
  pcoa_niche$eig > 0
]

pcoa_percent <- 100 * positive_eigenvalues /
  sum(positive_eigenvalues)

print(pcoa_percent)

# ---------------------------------------------------------
# 7. Prepare PCoA plot
# ---------------------------------------------------------

pcoa_plot <- data.frame(
  Sample = rownames(pcoa_niche$points),
  Axis1 = pcoa_niche$points[, 1],
  Axis2 = pcoa_niche$points[, 2]
)

# ---------------------------------------------------------
# 8. PCoA visualization
# ---------------------------------------------------------

plot(
  pcoa_plot$Axis1,
  pcoa_plot$Axis2,
  xlab = paste0(
    "PCoA Axis 1 (",
    round(pcoa_percent[1], 1),
    "%)"
  ),
  ylab = paste0(
    "PCoA Axis 2 (",
    round(pcoa_percent[2], 1),
    "%)"
  ),
  main = "Microbiome Composition by Microbial Niche",
  pch = 19,
  cex = 1.5
)

text(
  pcoa_plot$Axis1,
  pcoa_plot$Axis2,
  labels = pcoa_plot$Sample,
  pos = 3,
  cex = 0.8
)

# =========================================================
# End of analysis
# =========================================================
