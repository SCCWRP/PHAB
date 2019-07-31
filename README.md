
# PHAB

#### *Marcus W. Beck, <marcusb@sccwrp.org>, Raphael D. Mazor, <raphaelm@sccwrp.org>, Andrew C. Rehn, <andy.rehn@wildlife.ca.gov>*

[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/SCCWRP/PHAB?branch=master&svg=true)](https://ci.appveyor.com/project/SCCWRP/PHAB)
[![Travis-CI Build
Status](https://travis-ci.org/SCCWRP/PHAB.svg?branch=master)](https://travis-ci.org/SCCWRP/PHAB)
[![DOI](https://zenodo.org/badge/108920024.svg)](https://zenodo.org/badge/latestdoi/108920024)

The PHAB package contains materials to calculate an index of physical
integrity (IPI) for California streams. This index is estimated using
site-specific data and available metrics of physical habitat to describe
overall integrity.

This tutorial assumes that the user is familiar with basic operations in
the R programming language, such as data import, export, and
manipulation. Although not required, we recommend using an integrated
development environment for R, such as R-studio, which can be downloaded
at <http://www.rstudio.com>. New users are encouraged to pursue training
opportunities, such as those hosted by local R user groups. A list of
such groups may be found here:
<http://blog.revolutionanalytics.com/local-r-groups.html>. R training
material developed by SCCWRP can also be found online:
<https://sccwrp.github.io/SCCWRP_R_training/>

# Installation

Install the package as follows:

``` r
install.packages('devtools')
library(devtools)
install_github('SCCWRP/PHAB')
library(PHAB)
```

# Basic usage

The core function is `IPI` that requires station and phab data as input.

``` r
IPI(stations, phab)
```

    ##   StationCode SampleDate SampleAgencyCode             PHAB_SampleID
    ## 1   105PS0107  9/14/2009            SWAMP 105PS0107_9/14/2009_SWAMP
    ## 2   205PS0157  6/19/2012            SWAMP 205PS0157_6/19/2012_SWAMP
    ## 3   305PS0057  6/16/2009            SWAMP 305PS0057_6/16/2009_SWAMP
    ## 4   504PS0147  6/23/2008            SWAMP 504PS0147_6/23/2008_SWAMP
    ## 5   632PS0007  7/23/2008            SWAMP 632PS0007_7/23/2008_SWAMP
    ## 6   901PS0057  5/14/2008            SWAMP 901PS0057_5/14/2008_SWAMP
    ##   Ev_FlowHab H_AqHab H_SubNat PCT_RC PCT_SAFN XCMG
    ## 1       0.85    1.59     1.57      0        6   99
    ## 2       0.96    1.42     1.41      2       51  131
    ## 3       0.50    1.32     0.49      0       83  152
    ## 4       0.28    1.24     0.98      0        1   55
    ## 5       0.90    1.51     1.80      0       14  126
    ## 6       0.70    1.52     1.80      3       40  122
    ## 'data.frame':    6 obs. of  10 variables:
    ##  $ StationCode     : chr  "105PS0107" "205PS0157" "305PS0057" "504PS0147" ...
    ##  $ SampleDate      : chr  "9/14/2009" "6/19/2012" "6/16/2009" "6/23/2008" ...
    ##  $ SampleAgencyCode: chr  "SWAMP" "SWAMP" "SWAMP" "SWAMP" ...
    ##  $ PHAB_SampleID   : chr  "105PS0107_9/14/2009_SWAMP" "205PS0157_6/19/2012_SWAMP" "305PS0057_6/16/2009_SWAMP" "504PS0147_6/23/2008_SWAMP" ...
    ##  $ Ev_FlowHab      : num  0.85 0.96 0.5 0.28 0.9 0.7
    ##  $ H_AqHab         : num  1.59 1.42 1.32 1.24 1.51 1.52
    ##  $ H_SubNat        : num  1.57 1.41 0.49 0.98 1.8 1.8
    ##  $ PCT_RC          : num  0 2 0 0 0 3
    ##  $ PCT_SAFN        : num  6 51 83 1 14 40
    ##  $ XCMG            : num  99 131 152 55 126 122
    ## NULL

    ##   StationCode SampleDate SampleAgencyCode             PHAB_SampleID  IPI
    ## 1   105PS0107  9/14/2009            SWAMP 105PS0107_9/14/2009_SWAMP 1.16
    ## 2   205PS0157  6/19/2012            SWAMP 205PS0157_6/19/2012_SWAMP 1.04
    ## 3   305PS0057  6/16/2009            SWAMP 305PS0057_6/16/2009_SWAMP 0.79
    ## 4   504PS0147  6/23/2008            SWAMP 504PS0147_6/23/2008_SWAMP 0.78
    ## 5   632PS0007  7/23/2008            SWAMP 632PS0007_7/23/2008_SWAMP 1.10
    ## 6   901PS0057  5/14/2008            SWAMP 901PS0057_5/14/2008_SWAMP 1.08
    ##   IPI_percentile Ev_FlowHab Ev_FlowHab_score H_AqHab H_AqHab_pred
    ## 1           0.90       0.85             0.89    1.59         1.11
    ## 2           0.62       0.96             1.00    1.42         1.35
    ## 3           0.04       0.50             0.51    1.32         1.42
    ## 4           0.03       0.28             0.28    1.24         1.30
    ## 5           0.79       0.90             0.95    1.51         1.41
    ## 6           0.74       0.70             0.73    1.52         1.38
    ##   H_AqHab_score H_SubNat H_SubNat_score PCT_SAFN PCT_RC PCT_SAFN_pred
    ## 1          1.00     1.57           0.83        6      0         24.60
    ## 2          0.80     1.41           0.74       51      2         22.06
    ## 3          0.70     0.49           0.26       83      0         29.51
    ## 4          0.72     0.98           0.52        1      0         34.38
    ## 5          0.82     1.80           0.95       14      0         13.49
    ## 6          0.84     1.80           0.95       40      3         34.46
    ##   PCT_SAFN_score XCMG XCMG_pred XCMG_score IPI_qa Ev_FlowHab_qa H_AqHab_qa
    ## 1           1.00   99     93.64       0.78   1.00             1          1
    ## 2           0.40  131    104.72       0.90   1.00             1          1
    ## 3           0.12  152    106.05       1.00   1.00             1          1
    ## 4           1.00   55     95.41       0.51   1.00             1          1
    ## 5           0.79  126    123.10       0.76   1.00             1          1
    ## 6           0.69  122    102.16       0.86   0.95             1          1
    ##   H_SubNat_qa PCT_SAFN_qa XCMG_qa
    ## 1           1           1    1.00
    ## 2           1           1    1.00
    ## 3           1           1    1.00
    ## 4           1           1    1.00
    ## 5           1           1    1.00
    ## 6           1           1    0.95

# Detailed usage

The PHAB package can be installed from the R console with just a few
lines of code. The current version of the package can be found on
SCCWRP’s GitHub page [here](https://github.com/SCCWRP/PHAB) and can be
installed using the devtools package. The devtools package must be
installed first before the PHAB package can be installed. Start by
installing and loading devtools:

``` r
install.packages('devtools')
library(devtools)
```

Now the `install_github()` function from devtools can be used to install
PHAB from GitHub. The package can be loaded after installation.

``` r
install_github('SCCWRP/PHAB')
library(PHAB)
```

The installation process may take a few seconds. Both the devtools and
PHAB packages depend on other R packages, all of which are installed
together. If an error is encountered during installation, an informative
message is usually printed in the R console. This information can help
troubleshoot the problem, such as identifying which dependent packages
may need to be installed separately. Please contact SCCWRP staff if
additional errors are encountered.

After the package is successfully installed, you will be able to view
the help file for the PHAB core function:

``` r
?IPI
```

## Preparing input data

The IPI is estimated using station and PHAB metric data as input.
Station GIS data can be obtained using the GIS insructions that
accompany this document and PHAB metric data can be obtained from the
state of California SWAMP reporting module. Sample data are provided
with the PHAB package to demonstrate the required format and are loaded
automatically once the package is installed and loaded (i.e., just type
the name of the sample data in the R console to view). You can view the
`stations` and `phab` example data from the R console:

``` r
head(stations)
```

    ##   StationCode MAX_ELEV  AREA_SQKM ELEV_RANGE MEANP_WS  New_Long SITE_ELEV
    ## 1   105PS0107     2587 2002.90397    2050.96 882.4179 -123.0173    536.04
    ## 2   205PS0157     1111  600.95071    1074.00 604.9312 -121.8352     37.00
    ## 3   305PS0057     1152 1261.70747    1107.36 544.3272 -121.5114     44.64
    ## 4   504PS0147     2144 1954.62572    2059.52 781.2332 -122.2178     84.48
    ## 5   632PS0007     3348   98.66497    1240.06 962.0929 -119.5937   2107.94
    ## 6   901PS0057     1734   92.31964    1671.43 495.7878 -117.6696     62.57
    ##    KFCT_AVE  New_Lat MINP_WS PPT_00_09
    ## 1 0.1776000 41.71375 10.9294   54996.9
    ## 2 0.2927333 37.30141  0.7059   40023.9
    ## 3 0.2840000 36.95052  0.6623   42432.2
    ## 4 0.2181000 39.77572  2.7024   53740.0
    ## 5 0.1217000 38.53335 17.9569   67846.9
    ## 6 0.2854000 33.52814  0.5268   29440.0

``` r
head(phab)
```

    ##   StationCode SampleDate SampleAgencyCode      Variable Result Count_Calc
    ## 1   105PS0107  9/14/2009            SWAMP  W1_HALL_EMAP   0.00         11
    ## 2   105PS0107  9/14/2009            SWAMP W1_HALL_SWAMP   0.00         14
    ## 3   105PS0107  9/14/2009            SWAMP      PCT_CPOM  24.00        105
    ## 4   105PS0107  9/14/2009            SWAMP      Ev_AqHab   0.77          8
    ## 5   105PS0107  9/14/2009            SWAMP    Ev_FlowHab   0.85          4
    ## 6   105PS0107  9/14/2009            SWAMP     Ev_SubNat   0.75          8

The `stations` data include site-specific information derived from
geospatial analysis. These data are in wide format where one row
corresponds to data for one site. The following fields are required:

  - `StationCode` unique station identifier
  - `MAX_ELEV` maximum elevation in the watershed in meters
  - `AREA_SQKM` watershed area in square kilometers
  - `ELEV_RANGE` elevation range of the watershed in meters
  - `MEANP_WS` mean phosphorus geology from the watershed
  - `New_Long` site longitude, decimal degrees
  - `SITE_ELEV` site elevation
  - `KFCT_AVE` average soil erodibility factor
  - `New_Lat` site latitude, decimal degrees
  - `MINP_WS` minimum phosphorus geology from the watershed
  - `PPT_00_09` average precipitation (2000 to 2009) at the sample
    point, in hundredths of millimeters

The `phab` data include calculated physical habitat metrics that are
compiled along with the `stations` data to get the IPI score. These data
are in long format where multiple rows correspond to physical habitat
metric values for a single site. The following fields are required:

  - `StationCode` unique station identifier
  - `SampleDate` date of the sample
  - `SampleAgencyCode` the sample agency code that collected the data
  - `Variable` name of the PHAB metric
  - `Result` resulting metric value
  - `Count_Calc` number of unique observations that were used to
    estimate the value in `Result`

Values in the `Variable` column of the `phab` data indicate which PHAB
metric was measured that corresponds to values in the `Result` column.
The required PHAB metrics that should be provided for every unique
sampling event specified by `StationCode` and `SampleDate` are as
follows:

  - `XSLOPE` mean slope of reach
  - `XBKF_W` mean bankfull width
  - `H_AqHab` Shannon diversity of aquatic habitat types
  - `PCT_SAFN` percent sand and fine (\<2 mm) substrate particles
  - `XCMG` riparian cover sum of three layers
  - `Ev_FlowHab` evenness of flow habitat types
  - `H_SubNat` Shannon diversity of natural substrate types
  - `XC` mean upper canopy trees and saplings
  - `PCT_POOL` percent pools in reach
  - `XFC_ALG` mean filamentous algae cover
  - `PCT_RC` percent concrete/asphalt

Each PHAB metric serves a specific purpose in the calculation and
reporting of the IPI. Some metrics (i.e., `H_AqHab`, `PCT_SAFN`, `XCMG`,
`Ev_FlowHab`, and `H_SubNat`) are used to assess habitat condition.
Other metrics (i.e., `XSLOPE`, `XBKF_W`, and `PCT_RC`) are used as
predictors or score modifiers for components of the IPI. Finally, some
metrics (i.e., the `XC`, `PCT_POOL`, and `XFC_ALG`) are required because
they are used for quality assurance checks.

All required fields for the `stations` and `phab` data are
case-sensitive and must be spelled correctly. The order of the fields
does not matter. All `StationCode` values must be shared between the
datasets. As described below, the `IPI()` function automatically checks
the format of the input data prior to estimating scores.

## Detailed metric descriptions

Five of the required PHAB metrics in the input data are used directly
for scoring the IPI, whereas the remainder serve a supporting role as
predictors or modifiers for different parts of the complete index.
Understanding what each of five core metrics describe about stream
condition and how they vary with disturbance is critical for
interpreting the index. Below is a detailed description of each metric
(excerpted from the [tech
memo](https://www.waterboards.ca.gov/water_issues/programs/swamp/bioassessment/docs/physical_habitat_index_technical_memo.pdf),
click for more detail).

*Shannon diversity of natural instream cover*. `H_AqHab` measures the
relative quantity and variety of natural structures in the stream, such
as cobble, large and small boulders, fallen trees, logs and branches,
and undercut banks available as refugia, or as sites for feeding or
spawning and nursery functions of aquatic macrofauna. A wide variety
and/or abundance of submerged structures in the stream provides
macroinvertebrates and fish with a large number of niches, thus
increasing habitat diversity. When variety and abundance of cover
decreases (e.g., due to hydromodification, increased sedimentation, or
active stream clearing), habitat structure becomes monotonous, diversity
decreases, and the potential for recovery following disturbance
decreases. Snags and submerged logs—especially old logs that have
remained in-place for several years–are among the most productive
habitat structure for macroinvertebrate colonization and fish refugia in
low-gradient streams.

*Percent sand and fine substrate*. `PCT_SAFN` measures the amount of
small-grained sediment particles (i.e., \<2 mm) that have accumulated in
the stream bottom as a result of deposition. Deposition may result from
soil disturbance in the catchment, landslides, and bank erosion.
Sediment deposition may cause the formation of islands or point bars,
filling of runs and pools, and embeddedness of gravel, cobble, and
boulders and snags, with larger substrate particles covered or sunken
into the silt, sand, or mud of the stream bottom. As habitat provided by
cobbles or woody debris becomes embedded, and as interstitial spaces
become inundated by sand or silt, the surface area available to
macroinvertebrates and fish is decreased. High levels of sediment
deposition are symptoms of an unstable and continually changing
environment that becomes unsuitable for many organisms. Although human
activity may deplete sands and fines (e.g., by upstream dam operations),
and this depletion may harm aquatic life, the IPI treats only increases
in this metric as a negative impact on habitat quality, although a
*post-hoc* correction was made whereby the metric percent concrete
(`PCT_RC`) is added to `PCT_SAFN` before scoring.

*Shannon diversity of natural substrate types*. `H_SubNat` measures the
diversity of natural substrate types, assessing how well multiple size
classes (e.g., gravel, cobble and boulder particles) are represented. In
a stream with high habitat quality for benthic macroinvertebrates,
layers of cobble and gravel provide diversity of niche space. Occasional
patches of fine sediment, root mats and bedrock also provide important
habitat for burrowers or clingers, but do not dominate the streambed.
Lack of substrate diversity, e.g., where \>75% of the channel bottom is
dominated by one particle size or hard-pan, or with highly compacted
particles with no interstitial space, represents poor physical
conditions. Riffles and runs with a diversity of particle sizes often
provide the most stable habitat in many small, high-gradient streams.

*Evenness of flow habitat types*. `Ev_FlowHab` measures the evenness of
riffles, pools, and other flow microhabitat types. Optimal physical
conditions include a relatively even mix of velocity/depth regimes, with
regular alternation between riffles (fast-shallow), runs (fast-deep),
glides (slow-shallow) and pools (slow-deep). Poor conditions occur when
a single microhabitat dominates (usually glides, with pools and riffles
absent). A stream that has a uniform flow regime will typically support
far fewer types of organisms than a stream that has a variety of
alternating flow regimes. Riffles in particular are a source of
high-quality habitat and diverse fauna, and their regular occurrence
along the length of a stream greatly enhances the diversity of the
stream community. Pools are essential for many fish and amphibians.

*Riparian vegetation cover, sum of three layers*. `XCMG` measures the
amount of vegetative protection afforded to the stream bank and the
near-stream portion of the riparian zone. The root systems of plants
growing on stream banks help hold soil in place, thereby reducing the
amount of erosion likely to occur. The vegetative zone also serves as a
buffer to pollutants entering a stream from runoff and provides shading
and habitat and nutrient input into the stream. Banks that have full,
multi-layered, natural plant growth are better for fish and
macroinvertebrates than are banks without vegetative protection or those
shored up with concrete or riprap. Vegetative removal and reduced
riparian zones occur when roads, parking lots, fields, lawns, bare soil,
riprap, or buildings are near the stream bank. Residential developments,
urban centers, golf courses, and high grazing pressure from livestock
are the common causes of anthropogenic degradation of the riparian zone.
Even in undeveloped areas, upstream hydromodification and invasion by
non-native species can reduce the cover and quality of riparian zone
vegetation.

## Using the `IPI()` function

The IPI score for a site is estimated from the station and PHAB data.
The score is estimated automatically by the `IPI()` function in the
package following several steps. First, reference expectations for a
site are estimated for predictive metrics using the station data. Then,
observed data values are compared to reference expectations for
predictive metrics and the differences between observed and predicted
(i.e., metric residuals) are used for scoring. For metrics that are not
predicted, raw metric values are used for scoring. Metric scores are
based on the upper and lower percentiles of either metric residuals or
raw metric values observed at reference and high-activity sites. The
metric scores are then summed and standardized (i.e., divided) by the
mean sum of scores at reference sites to obtain the final IPI score.

The `IPI()` function can be used on station and PHAB data that are
correctly formatted as shown above. The `stations` and `phab` example
data are in the correct format and are loaded automatically with the
PHAB package. These data are used here to demonstrate use of the `IPI()`
function.

``` r
IPI(stations, phab)
```

    ##   StationCode SampleDate SampleAgencyCode             PHAB_SampleID
    ## 1   105PS0107  9/14/2009            SWAMP 105PS0107_9/14/2009_SWAMP
    ## 2   205PS0157  6/19/2012            SWAMP 205PS0157_6/19/2012_SWAMP
    ## 3   305PS0057  6/16/2009            SWAMP 305PS0057_6/16/2009_SWAMP
    ## 4   504PS0147  6/23/2008            SWAMP 504PS0147_6/23/2008_SWAMP
    ## 5   632PS0007  7/23/2008            SWAMP 632PS0007_7/23/2008_SWAMP
    ## 6   901PS0057  5/14/2008            SWAMP 901PS0057_5/14/2008_SWAMP
    ##   Ev_FlowHab H_AqHab H_SubNat PCT_RC PCT_SAFN XCMG
    ## 1       0.85    1.59     1.57      0        6   99
    ## 2       0.96    1.42     1.41      2       51  131
    ## 3       0.50    1.32     0.49      0       83  152
    ## 4       0.28    1.24     0.98      0        1   55
    ## 5       0.90    1.51     1.80      0       14  126
    ## 6       0.70    1.52     1.80      3       40  122
    ## 'data.frame':    6 obs. of  10 variables:
    ##  $ StationCode     : chr  "105PS0107" "205PS0157" "305PS0057" "504PS0147" ...
    ##  $ SampleDate      : chr  "9/14/2009" "6/19/2012" "6/16/2009" "6/23/2008" ...
    ##  $ SampleAgencyCode: chr  "SWAMP" "SWAMP" "SWAMP" "SWAMP" ...
    ##  $ PHAB_SampleID   : chr  "105PS0107_9/14/2009_SWAMP" "205PS0157_6/19/2012_SWAMP" "305PS0057_6/16/2009_SWAMP" "504PS0147_6/23/2008_SWAMP" ...
    ##  $ Ev_FlowHab      : num  0.85 0.96 0.5 0.28 0.9 0.7
    ##  $ H_AqHab         : num  1.59 1.42 1.32 1.24 1.51 1.52
    ##  $ H_SubNat        : num  1.57 1.41 0.49 0.98 1.8 1.8
    ##  $ PCT_RC          : num  0 2 0 0 0 3
    ##  $ PCT_SAFN        : num  6 51 83 1 14 40
    ##  $ XCMG            : num  99 131 152 55 126 122
    ## NULL

    ##   StationCode SampleDate SampleAgencyCode             PHAB_SampleID  IPI
    ## 1   105PS0107  9/14/2009            SWAMP 105PS0107_9/14/2009_SWAMP 1.16
    ## 2   205PS0157  6/19/2012            SWAMP 205PS0157_6/19/2012_SWAMP 1.04
    ## 3   305PS0057  6/16/2009            SWAMP 305PS0057_6/16/2009_SWAMP 0.79
    ## 4   504PS0147  6/23/2008            SWAMP 504PS0147_6/23/2008_SWAMP 0.78
    ## 5   632PS0007  7/23/2008            SWAMP 632PS0007_7/23/2008_SWAMP 1.10
    ## 6   901PS0057  5/14/2008            SWAMP 901PS0057_5/14/2008_SWAMP 1.08
    ##   IPI_percentile Ev_FlowHab Ev_FlowHab_score H_AqHab H_AqHab_pred
    ## 1           0.90       0.85             0.89    1.59         1.11
    ## 2           0.62       0.96             1.00    1.42         1.35
    ## 3           0.04       0.50             0.51    1.32         1.42
    ## 4           0.03       0.28             0.28    1.24         1.30
    ## 5           0.79       0.90             0.95    1.51         1.41
    ## 6           0.74       0.70             0.73    1.52         1.38
    ##   H_AqHab_score H_SubNat H_SubNat_score PCT_SAFN PCT_RC PCT_SAFN_pred
    ## 1          1.00     1.57           0.83        6      0         24.60
    ## 2          0.80     1.41           0.74       51      2         22.06
    ## 3          0.70     0.49           0.26       83      0         29.51
    ## 4          0.72     0.98           0.52        1      0         34.38
    ## 5          0.82     1.80           0.95       14      0         13.49
    ## 6          0.84     1.80           0.95       40      3         34.46
    ##   PCT_SAFN_score XCMG XCMG_pred XCMG_score IPI_qa Ev_FlowHab_qa H_AqHab_qa
    ## 1           1.00   99     93.64       0.78   1.00             1          1
    ## 2           0.40  131    104.72       0.90   1.00             1          1
    ## 3           0.12  152    106.05       1.00   1.00             1          1
    ## 4           1.00   55     95.41       0.51   1.00             1          1
    ## 5           0.79  126    123.10       0.76   1.00             1          1
    ## 6           0.69  122    102.16       0.86   0.95             1          1
    ##   H_SubNat_qa PCT_SAFN_qa XCMG_qa
    ## 1           1           1    1.00
    ## 2           1           1    1.00
    ## 3           1           1    1.00
    ## 4           1           1    1.00
    ## 5           1           1    1.00
    ## 6           1           1    0.95

A data frame of IPI scores estimated at each site on each unique sample
date is returned. The output data are in wide format with one row for
each sample date at a site. Detailed information for each output column
is as follows:

  - `StationCode` unique station identifier
  - `SampleDate` date of the site visit
  - `PHAB_SampleID` unique identifier of the sampling event. Typically,
    the station code and sample data are sufficient to determine unique
    sampling events.
  - `IPI` score for the index of physical integrity
  - `IPI_percentile` the percentile of the IPI score relative to scores
    at reference sites
  - `Ev_FlowHab` evenness of flow habitat types, from the raw PHAB
    metric
  - `Ev_FlowHab_score` IPI score for evenness of flow habitat types
  - `H_AqHab` Shannon diversity of natural instream cover types, from
    the raw PHAB metric
  - `H_AqHab_pred` predicted Shannon diversity of natural instream cover
    types
  - `H_AqHab_score` scored Shannon diversity of natural instream cover
    types
  - `H_SubNat` Shannon Diversity of natural substrate types, from the
    raw PHAB metric
  - `H_SubNat_score` scored Shannon diversity of natural substrate types
  - `PCT_SAFN` percent sand and fine substrate, from the raw PHAB metric
  - `PCT_RC` percent concrete/asphalt, from the raw PHAB metric and is
    combined with `PCT_SAFN` to provide an overall estimate of substrate
    with poor suitability for macrofauna
  - `PCT_SAFN_pred` predicted percent sand and fine substrate
  - `PCT_SAFN_score` scored percent sand and fine substrate, includes
    `PCT_RC`
  - `XCMG` riparian cover as sum of three layers, from the raw PHAB
    metric
  - `XCMG_pred` predicted riparian cover as sum of three layers
  - `XCMG_score` scored riparian cover as sum of three layers
  - `IPI_qa` quality assurance for the IPI score
  - `Ev_FlowHab_qa` quality assurance for evenness of flow habitat types
  - `H_AqHab_qa` quality assurance for Shannon diversity of aquatic
    habitat types
  - `H_SubNat_qa` quality assurance for Shannon diversity of natural
    substrate types
  - `PCT_SAFN_qa` quality assurance for percent sand and fine substrate
  - `XCMG_qa` quality assurance for riparian cover as sum of three
    layers

Metrics are included in the output as observed PHAB metrics, predicted
metrics (where applicable), and scored metrics. Observed PHAB metrics
are returned as-is from the input data. Some PHAB metrics include a
predicted column that shows the modelled metric value based on the
environmental setting at a site. Scored PHAB metrics are obtained
following the description above.

The last five columns include quality assurance information for the IPI
score and select metrics. QA values less than one indicate less quality
assurance, usually resulting from metric values being calculated from
fewer measurements from a sample than specified by field protocols.
`IPI_qa` (the overall QA value for the IPI) is based on the lowest score
among all metrics. At this time, there is no criterion for flagging an
IPI score based on QA measurements; analysts are advised to use their
personal judgment when evaluating IPI scores with low QA measurements.

## Interpreting IPI scores

The IPI was calibrated during its development so that the mean score of
reference sites is 1; IPI scores near 1 represent locations with
conditions similar to reference sites. Scores that approach 0 indicate
great departure from reference condition and degradation of physical
condition. Scores \> 1 can be interpreted to indicate greater physical
complexity than predicted for a site given its natural environmental
setting. All metric scores are weighted equally to determine the overall
IPI score. For observed and scored PHAB metrics, all are expected to
decrease under degraded physical conditions, except PCT\_SAFN which is
expected to increase in response to degradation.

## Calibration data

An additional data file is available within the PHAB package that shows
calibration data for scoring the IPI metrics. This file is called
`refcal` and includes observed and predicted scores at reference and
high-activity (or “stressed”) sites for the five PHAB metrics. Metrics
are scored based on deviation from the 5th and 95th percentile of scores
at reference or calibration sites. The `refcal` dataset includes
observations at these sites that were used to identify percentile
cutoffs for estimating metric scores (the dataset is loaded
automatically with the PHAB package, just type the name in the console
to view).

``` r
head(refcal)
```

    ##     Variable StationCode      SampleID2   SiteSet Result Predicted
    ## 1 Ev_FlowHab   000CAT228 000CAT22840400    RefCal   0.77 0.6498149
    ## 2 Ev_FlowHab   101WE1111 101WE111137474 StressCal   0.94 0.6535123
    ## 3 Ev_FlowHab   103CDCHHR 103CDCHHR40435    RefCal   0.63 0.7295132
    ## 4 Ev_FlowHab   103WER026 103WER02637831    RefCal   0.75 0.6590854
    ## 5 Ev_FlowHab   103WER029 103WER02937832    RefCal   0.94 0.7125525
    ## 6 Ev_FlowHab   105BVCAGC 105BVCAGC40442    RefCal   0.84 0.6973526

  - `Variable` name of the PHAB metric
  - `StationCode` unique station identifier
  - `SampleID2` unique identifier of the sampling event
  - `SiteSet` indicating if a site was reference or stressed
  - `Result` resulting metric value
  - `Predicted` predicted metric value

## Error checks for input data

The `IPI()` function will evaluate both the `stations` and `phab` input
datasets for correct format before estimating IPI scores. IPI scores
will not be calculated if any errors are encountered. The following
checks are made:

  - No duplicate station codes in `stations`. That is, input data have
    one row per station.
  - All station codes in `stations` are in `phab`, and vice-versa
  - All required fields are present in `stations` and `phab` (see above)
  - All required PHAB metrics are present in the `variable` field of
    `phab` for each station and sample date (see above). An exception is
    made for `XC`, `PCT_POOL`, and `XFC_ALG`, which are not necessary
    for calculating the IPI but are used for optional quality assurance
    checks.
  - No duplicate results for PHAB variables at each station and sample
    date. That is, one row per station, date, and phab metric.
  - All input variables for `stations` and `phab` are non-negative,
    excluding elevation variables in `stations` which may be negative if
    below sea level (i.e., some locations in southeast California).
    Moreover, the variables `XBKF_W` and `Ev_FlowHab` in `phab` must
    also be greater than zero.

The `IPI()` function will print informative messages to the R console if
any of these errors are encountered. It is the responsibility of the
analyst to correct any errors in the raw data before proceeding.
