library(ape)
library(phytools)

# Making a random tree
set.seed(123)  # Setting seed for reproducibility
random_tree <- rtree(n = 1000)  # n is the number of tips (species) in the tree

# Assign random continuous traits to the tips
random_traits <- runif(n = 1000, min = 0, max = 100)
names(random_traits) <- random_tree$tip.label

# Reconstruct ancestral character states
ancestral_states <- ace(random_traits, random_tree, type = "continuous")

# Plot the randoom tree
plot(random_tree,type="fan", show.tip.label = FALSE, use.edge.length = TRUE)  # Plot the random phylogeny

# Map continuous traits using contMap
cont_map <- contMap(random_tree, random_traits, plot = FALSE)

cMap<-setMap(cont_map,c("yellow","orange","red","black"))
plot(cMap,type="phylogram", show.tip.label = FALSE, ftype="off", outline=FALSE, lwd=1, use.edge.length = FALSE)

