library(tidyverse)
source("https://bioconductor.org/biocLite.R")
biocLite("phyloseq")
library(phyloseq)

#Reloading updated data files as tables
metadata = read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t")
OTU = read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t")

#Loading object that combines OTU, metadata, taxonomy, and taxonomic tree all in one
load("phyloseq_object.RData")

#Plot depth by oxygen, but no actual data
ggplot(metadata, aes(x=O2_uM, y=Depth_m))

#Specify geom to add data
ggplot(metadata, aes(x=O2_uM, y=Depth_m)) +
  geom_point()

ggplot(metadata) +
  geom_point(aes(x=O2_uM, y=Depth_m))

#Modify colour (outline and fill), shape, size of points
ggplot(metadata, aes(x=O2_uM, y=Depth_m, color="blue")) +
  geom_point()

#Colour was red, why? 
#Cannot specify attributes associated with geom in ggplot function
ggplot(metadata, aes(x=O2_uM, y=Depth_m)) +
  geom_point(color="blue")

ggplot(metadata, aes(x=O2_uM, y=Depth_m)) +
  geom_point(shape=15)

ggplot(metadata, aes(x=O2_uM, y=Depth_m)) +
  geom_point(size=10)

#Adding third variables as colours, shapes, or sizes of dots
ggplot(metadata, aes(x=O2_uM, y=Depth_m, size=OxygenSBE_V)) +
  geom_point()

#Exercise 1
ggplot(metadata, aes(x=PO4_uM, y=Depth_m)) +
  geom_point(color="purple", shape=17)

#Exercise 2
metadata %>%
  mutate(Temperature_F = 1.8*Temperature_C + 32) %>%
  ggplot() + geom_point(aes(x=Temperature_F, y=Depth_m))

#ggplot with phyloseq 
physeq

#Plotting phylum level communities by depth by specifying the fill
plot_bar(physeq, fill="Phylum")

#Transform sample counts function to modify OTU table to be percentages
#Function applies given equation: (100*x/sum(x)) to every cell
physeq_percent = transform_sample_counts(physeq, function(x) 100 * x/sum(x))
plot_bar(physeq_percent, fill="Phylum")

#Black lines that separate OTUs is problem for low abundance OTU due to colour blockage
#Specify stat as "identity" instead of default "stat_count"
#R won't see OTUs as separate data so lines won't occur
plot_bar(physeq_percent, fill="Phylum") + 
  geom_bar(aes(fill=Phylum), stat="identity")

#Exercise 3
plot_bar(physeq_percent, fill="Class") + 
  geom_bar(aes(fill=Phylum), stat="identity") +  
  ggtitle("Classes from 10-200m in Saanich Inlet") +
  xlab("Sample depth") + ylab("Percent relative abundance")

#Faceting
#Separate complex data (with low abundance taxa and similar colours) into multiple panels to clearly see patterns
plot_bar(physeq_percent, fill="Phylum") + 
  geom_bar(aes(fill=Phylum), stat="identity") +
  facet_wrap(~Phylum)

#Let R scale y-axis independently for each panel
#Remove legend because each facet is labeled
plot_bar(physeq_percent, fill="Phylum") +
  geom_bar(aes(fill=Phylum), stat="identity") +
  facet_wrap(~Phylum, scales="free_y") +
  theme(legend.position="none")

#Exercise 4
#Gather(new variable, variable values, column names)
#Geom_line to connect data points
metadata %>% 
  gather(Nutrients_uM, uM, NH4_uM, NO2_uM, NO3_uM, O2_uM, PO4_uM, SiO2_uM, na.rm = FALSE, convert = FALSE) %>%
  ggplot() +geom_point(aes(x=Depth_m, y=uM)) + geom_line(aes(x=Depth_m, y=uM)) +
  facet_wrap(~Nutrients_uM, scales="free_y")
