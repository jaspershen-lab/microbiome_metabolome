###this code is run in the workstation
## RPLC positive
###data processing
setwd("G:/hmp_data/metabolomics/RPLC/MS1/mzxml/POS")
library(xcms)
library(MSnbase)
library(metflow2)


processData(path = ".",
            polarity = "positive",
            ppm = 15,
            peakwidth = c(5, 30),
            snthresh = 10,
            prefilter = c(3, 500),
            fitgauss = FALSE,
            integrate = 2,
            mzdiff = 0.01,
            noise = 500,
            threads = 30,
            binSize = 0.025,
            bw = 5,
            output.tic = TRUE,
            output.bpc = TRUE,
            output.rt.correction.plot = TRUE,
            min.fraction = 0.5,
            fill.peaks = FALSE,
            output.peak.eic = TRUE,
            group.for.figure = "QC")

## RPLC negative
###data processing
setwd("G:/hmp_data/metabolomics/RPLC/MS1/mzxml/NEG")
library(xcms)
library(MSnbase)
library(metflow2)

processData(path = ".",
            polarity = "negative",
            ppm = 15,
            peakwidth = c(5, 30),
            snthresh = 10,
            prefilter = c(3, 500),
            fitgauss = FALSE,
            integrate = 2,
            mzdiff = 0.01,
            noise = 500,
            threads = 30,
            binSize = 0.025,
            bw = 5,
            output.tic = TRUE,
            output.bpc = TRUE,
            output.rt.correction.plot = TRUE,
            min.fraction = 0.5,
            fill.peaks = FALSE,
            output.peak.eic = TRUE,
            group.for.figure = "QC")
