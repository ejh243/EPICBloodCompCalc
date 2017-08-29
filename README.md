# EPICBloodCompCalc
This package provides DNA methylation reference data from FACs sorted purified blood cell typesprofiled using the Illumina Infinium MethylationEPIC BeadChip. Specifically it includes profiles for CD4 T cells, CD8 T cells, B cells, Monocytes and Granulocytes purified from 28 individuals. 
The package also includes a vignette to aid users estimate cellular proportions from their DNA methylation data applicable for DNA methylation data profiled in blood on either the Illumina 450K or EPIC BeadChip.



## Requirements

For the package to work it requires the following packages to also be installed
..*minfi
..*genefilter
..*quadprog
..*IlluminaHumanMethylationEPICmanifest
..*IlluminaHumanMethylation450kmanifest (if your data was profiled with the 450K array rather than the EPIC)

## Install the package


The commands below will install the package directly from GitHub.


```{r,eval=FALSE}

install.packages("devtools")
library("devtools")
install_github("ejh243/EPICBloodCompCalc")
library(EPICBloodCompCalc)
```

