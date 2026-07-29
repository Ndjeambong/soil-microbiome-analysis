# =========================================================
# PERMANOVA example for soil microbiome community data
# Package: vegan
# Purpose: Demonstration of a reproducible PERMANOVA workflow
# =========================================================

# Note:
# This is a simulated dataset created for learning and demonstration.
# It does not represent experimental data from a research study.

# Install vegan once if necessary:
# install.packages("vegan")

library(vegan)

# Set seed for reproducibility
set.seed(123)

# ---------------------------------------------------------
# 1. Simulated microbial community abundance data
# ---------------------------------------------------------

# Rows represent soil samples.
# Columns represent microbial taxa.
# Values represent simulated abundance counts.

community <- data.frame(
  Taxon_A = c(10, 12, 8, 11, 9, 13, 30, 28, 35, 32, 31, 34),
  Taxon_B = c(20, 18, 22, 21, 19, 23, 7, 5, 4, 6, 8, 5),
  Taxon_C = c(5, 7, 6, 8, 5, 7, 25, 22, 27, 24, 26, 23),
  Taxon_D = c(12, 10, 14, 13, 11, 9, 8, 9, 7, 10, 8, 9),
  Taxon_E = c(15, 13, 16, 14, 12, 15, 18, 20, 17, 19, 21, 18)
)

# Assign sample names
rownames(community) <- paste0("Sample_", 1:12)

# ---------------------------------------------------------
# 2. Experimental grouping
# ---------------------------------------------------------

metadata <- data.frame(
  Treatment = factor(
    c(
      "Control", "Control", "Control",
      "Control", "Control", "Control",
      "Treatment", "Treatment", "Treatment",
      "Treatment", "Treatment", "Treatment"
    )
  )
)

rownames(metadata) <- rownames(community)

# Check the data
print(community)
print(metadata)

# ---------------------------------------------------------
# 3. Calculate Bray-Curtis dissimilarity
# ---------------------------------------------------------

bray_dist <- vegdist(
  community,
  method = "bray"
)

print(bray_dist)

# ---------------------------------------------------------
# 4. PERMANOVA
# ---------------------------------------------------------

permanova_result <- adonis2(
  bray_dist ~ Treatment,
  data = metadata,
  permutations = 999
)

# Display PERMANOVA results
print(permanova_result)

# ---------------------------------------------------------
# 5. Test homogeneity of multivariate dispersion
# ---------------------------------------------------------

dispersion <- betadisper(
  bray_dist,
  metadata$Treatment
)

# Test whether dispersion differs between groups
dispersion_test <- permutest(
  dispersion,
  permutations = 999
)

print(dispersion_test)

# ---------------------------------------------------------
# 6. Optional: inspect group dispersion
# ---------------------------------------------------------

print(anova(dispersion))

# =========================================================
# End of analysis
# =========================================================
