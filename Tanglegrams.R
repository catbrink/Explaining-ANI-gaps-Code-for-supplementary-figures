#Code was written using the following programmes and packakges:
  #language = R (v4.3.2)
  #packages = ape (v5.7.1), dendextend (v1.17.1) and phylogram (v2.1.0)


#please note that the tanglegrams in R do not allow for much customisation. The final figures displayed in the paper were edited in Adobe Illustrator.

#set working directory - the code assumes the necessary Newick files are located here. If necessary, specify hard paths to the tree files
setwd('/path/to/working/directory/')

#load the packages
library(ape)
library(dendextend)
library(phylogram)

#read in the two newick trees, set tree labels
#make sure the Newick trees have been rooted before reading them into the programme. 
#There are many softwares available to do this such as MEGA or FigTree
dend1 <- read.dendrogram(file = "./tree_1.nwk")
title1 <- "Left tree"

dend2 <- read.dendrogram(file = "./tree_2.nwk")
title2 <- "Right tree"

#create a list of dendrogram objects
dl <- dendlist(dend1, dend2)

#create the tanglegram and save it as a pdf file that can be loaded into and edited in Adobe Illustration
pdf(file = './tanglegram.pdf', width = 25, height = 17) #width and height in inches
tanglegram(dl, sort=TRUE, #sorts tree labels
            main_left=title1, cex_main_left=3, main_right=title2, cex_main_right=3, lab.cex=0.8, #title and label customisation
            common_subtrees_color_lines=TRUE, highlight_distinct_edges=FALSE, highlight_branches_lwd=FALSE, #visit https://www.rdocumentation.org/packages/dendextend/versions/1.17.1/topics/tanglegram for details about tanglegram customisation
            columns_width=c(6,3,6), lwd=2, margin_outer=3, margin_inner=5, axes=FALSE)
dev.off()
