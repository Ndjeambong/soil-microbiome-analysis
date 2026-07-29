# =========================================================
# Genus-level PCoA of PhD microbiome data
# Analysis: Genotype-associated soil communities
# Package: vegan
#
# Purpose:
# Descriptive analysis of genus-level microbial community
# composition using Bray-Curtis dissimilarity and PCoA.
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

genus_abundance <- data.frame(
  Acidovorax = c(0, 0, 55, 280),
  Allorhizobium_Neorhizobium_Pararhizobium_Rhizobium =
    c(0, 0, 20, 70),
  Bacillus = c(77, 125, 269, 196),
  Ensifer = c(0, 0, 65, 200),
  Methanocella = c(0, 70, 192, 0),
  Pseudomonas = c(0, 0, 228, 41),
  Sphingobium = c(0, 0, 91, 425),
  Streptomyces = c(0, 0, 164, 112),
  Terrabacter = c(0, 0, 60, 169),
  Not_Assigned = c(19442, 18685, 80440, 67180)
)

rownames(genus_abundance) <- c(
  "BulkSoil_Ca",
  "BulkSoil_Go",
  "Pusa_Shyamala",
  "Solanum_Torvum"
)

# ---------------------------------------------------------
# 2. Exclude unassigned reads
# ---------------------------------------------------------

genus_assigned <- genus_abundance[
  ,
  !colnames(genus_abundance) %in% "Not_Assigned"
]

# ---------------------------------------------------------
# 3. Relative abundance
# ---------------------------------------------------------

relative_abundance <- decostand(
  genus_assigned,
  method = "total"
)

print(relative_abundance)

# ---------------------------------------------------------
# 4. Bray-Curtis dissimilarity
# ---------------------------------------------------------

bray_dist <- vegdist(
  genus_assigned,
  method = "bray"
)

print(bray_dist)

# ---------------------------------------------------------
# 5. Principal Coordinates Analysis
# ---------------------------------------------------------

pcoa_result <- cmdscale(
  bray_dist,
  k = 2,
  eig = TRUE
)

print(pcoa_result$points)

# ---------------------------------------------------------
# 6. Percentage of variation explained
# ---------------------------------------------------------

positive_eigenvalues <- pcoa_result$eig[
  pcoa_result$eig > 0
]

pcoa_percent <- 100 * positive_eigenvalues /
  sum(positive_eigenvalues)

print(pcoa_percent)

# ---------------------------------------------------------
# 7. Prepare PCoA plot
# ---------------------------------------------------------

pcoa_plot <- data.frame(
  Sample = rownames(pcoa_result$points),
  Axis1 = pcoa_result$points[, 1],
  Axis2 = pcoa_result$points[, 2]
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
  main = "Genus-Level Microbiome Composition",
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
