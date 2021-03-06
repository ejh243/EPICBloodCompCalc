% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimateCellCountsEPIC.r
\name{estimateCellCountsEPIC}
\alias{estimateCellCountsEPIC}
\title{Function to load reference data included in this package and process with user supplied DNA methylation data to estimate cell composition for blood. This is an implementaion of the Houseman et al (2012) regression calibration approach algorithm for deconvoluting heterogeneous tissue sources like blood. This function is adapted from the minfi package. This function will take an RGChannelSet from a DNA methylation (DNAm) study of blood, and return the relative proportions of CD4+ and CD8+ T-cells, monocytes, granulocytes, and b-cells in each sample. The function requires an RGChannelSet as prior to the estimation step, it normalises the referecne data and user supplied data together. Although the reference data was generated with the Illumina EPIC microarray, users can provde 450K datasets for estimation.}
\usage{
estimateCellCountsEPIC(userData, EPIC = TRUE, processMethod = "auto",
  probeSelect = "auto", cellTypes = c("Bcells", "CD4Tcells", "CD8Tcells",
  "Monocytes", "Granulocytes"), returnAll = FALSE, meanPlot = FALSE,
  verbose = TRUE)
}
\arguments{
\item{userData}{is an RGChannelSet}

\item{EPIC}{is logical indicate whether userData were profiled with the 450K array}

\item{processMethod}{Specify how the user and reference data should be processed together. Default input "auto" will use preprocessQuantile in line with the existing literature. Set it to the name of a preprocessing function as a character if you want to override it, like "preprocessFunnorm". See minfi for available options.}

\item{probeSelect}{Specify how probes should be selected to distinguish cell types. Options include "both", which selects an equal number (50) of probes (with F-stat p-value < 1E-8) with the greatest magnitude of effect from the hyper- and hypo-methylated sides, and "any", which selects the 100 probes (with F-stat p-value < 1E-8) with the greatest magnitude of difference regardless of direction of effect. Default input "auto" will use "both" for blood, in line with previous versions of this function and/or our recommendations.}

\item{cellTypes}{A vector to specify which cell types the user wants to estimate. A subset of c("CD8T","CD4T", "Bcell","Mono","Gran") is allowed.}

\item{returnAll}{Logical inicating whether the composition table and the normalized user supplied data be returned.}

\item{meanPlot}{Logical indicating whether to plot the average DNA methylation across the cell-type discrimating probes within the mixed and sorted samples. This should be used to check for large batch effects in the data, reducing the confidence placed in the composition estimates.}

\item{verbose}{Should the function be verbose?}
}
\value{
A matrix containing the estimated proportion of each cell type for each sample. Columns contain cell types while rows contain samples.

If returnAll=TRUE a list of a count matrix (see previous paragraph), a composition table and the normalized user data in form of a GenomicMethylSet.

If meanPlot=TRUE A plot depicting the average DNA methylation across the cell-type discrimating probes in both the provided and sorted data is produced. The means from the provided heterogeneous samples should be within the range of the sorted samples. If the sample means fall outside the range of the sorted means, the cell type estimates will inflated to the closest cell type. Note that we quantile normalize the sorted data with the provided data to reduce these batch effects.
}
\description{
Function to load reference data included in this package and process with user supplied DNA methylation data to estimate cell composition for blood. This is an implementaion of the Houseman et al (2012) regression calibration approach algorithm for deconvoluting heterogeneous tissue sources like blood. This function is adapted from the minfi package. This function will take an RGChannelSet from a DNA methylation (DNAm) study of blood, and return the relative proportions of CD4+ and CD8+ T-cells, monocytes, granulocytes, and b-cells in each sample. The function requires an RGChannelSet as prior to the estimation step, it normalises the referecne data and user supplied data together. Although the reference data was generated with the Illumina EPIC microarray, users can provde 450K datasets for estimation.
}
\examples{
\dontrun{ 
counts<-estimateCellCountsEPIC(RGSet, EPIC=TRUE, cellTypes=c("Bcells", "CD4Tcells", "CD8Tcells", "Monocytes", "Granulocytes"))
}
}
