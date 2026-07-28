# PERMANOVA example for soil microbiome community data
# Package: vegan
# Purpose: Demonstration of a reproducible PERMANOVA workflow
#
# Note:
# The dataset below is an example dataset created for learning.
# It does not represent experimental data from a research study.

# Install vegan once if necessary:
# install.packages("vegan")

library(vegan)

# ---------------------------------------------------------
# 1. Example microbial community abundance data
# ---------------------------------------------------------
# Rows represent soil samples.
# Columns represent microbial taxa.
# Values represent example abundance counts.

community <- data.frame(
  Taxon_A = c(10, 12, 8, 30, 28, 35),
  Taxon_B = c(20, 18, 22, 5, 7, 4),
  Taxon_C = c(5, 7, 6, 25, 22, 27),
  Taxon_D = c(12, 10, 14, 8, 9, 7)
)

# Assign sample names
rownames(community) <- paste0("Sample_", 1:6)

# ---------------------------------------------------------
# 2. Experimental grouping
# ---------------------------------------------------------

metadata <- data.frame(
  Treatment = factor(c(
    "Control",
    "Control",
    "Control",
    "Treatment",
    "Treatment",
    "Treatment"
  ))
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
# 4. Perform PERMANOVA
# ---------------------------------------------------------

permanova_result <- adonis2(
  bray_dist ~ Treatment,
  data = metadata,
  permutations = 999
)

# Display results
print(permanova_result)
