
<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meps.hc`
===============

[![Travis-CI Build Status](https://travis-ci.org/jjchern/meps.hc.svg?branch=master)](https://travis-ci.org/jjchern/meps.hc) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jjchern/meps.hc?branch=master&svg=true)](https://ci.appveyor.com/project/jjchern/meps.hc) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/meps.hc)](https://cran.r-project.org/package=meps.hc)

The goal of `meps.hc` is to wrap the Annual Consolidated Data Files from the Medical Expenditure Panel Survey (`meps`) Household Component (`hc`) in an R data package. All variable labels and value labels are included.

For more information about the consolidated MEPS-HC files, see [the AHRQ webpages](https://meps.ahrq.gov/mepsweb/data_stats/download_data_files_results.jsp?cboDataYear=All&cboDataTypeY=1%2CHousehold+Full+Year+File&buttonYearandDataType=Search&cboPufNumber=All&SearchTitle=Consolidated+Data), or the example code from the [`HHS-AHRQ/MEPS` repo](https://github.com/HHS-AHRQ/MEPS) by [`@e-mitchell`](https://github.com/e-mitchell).

For another attempt of downloading the MEPS data, see [the `ajdamico/asdfree` repo](https://github.com/ajdamico/asdfree/tree/master/Medical%20Expenditure%20Panel%20Survey) by [`@ajdamico`](https://github.com/ajdamico).

Currently the package includes data from 2011-2014. The rest of the files (1996-2010) will be packaged soon.

All MEPS-Related R data packages:
=================================

-   Full Year Consolidated Files: [`meps.hc`](https://github.com/jjchern/meps.hc)
-   Person Round Plan Files: [`meps.prpl`](https://github.com/jjchern/meps.prpl)
-   Two-Years Longitudinal Files: [`meps.panel`](https://github.com/jjchern/meps.panel)

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/meps.hc")

# To uninstall the package, use:
# remove.packages("meps.hc")
```

Usage
=====

``` r
# Load tibble for better printout
library(tibble)

meps.hc::f2014
#> # A tibble: 34,875 x 1,838
#>     duid   pid dupersid       panel famid31 famid42 famid53 famid14
#>    <dbl> <dbl>    <chr>      <fctr>  <fctr>  <fctr>  <fctr>  <fctr>
#>  1 40001   101 40001101 18 panel 18       A       A       A       A
#>  2 40001   102 40001102 18 panel 18       A       A       A       A
#>  3 40001   103 40001103 18 panel 18       A       A       A       A
#>  4 40001   104 40001104 18 panel 18       A       A       A       A
#>  5 40002   101 40002101 18 panel 18       A       A       A       A
#>  6 40004   101 40004101 18 panel 18       A       A       A       A
#>  7 40004   102 40004102 18 panel 18       A       A       A       A
#>  8 40004   103 40004103 18 panel 18       A       A       A       A
#>  9 40004   104 40004104 18 panel 18       A       A       A       A
#> 10 40004   105 40004105 18 panel 18       A       A       A       A
#> # ... with 34,865 more rows, and 1830 more variables: famidyr <fctr>,
#> #   cpsfamid <fctr>, fcsz1231 <dbl>, fcrp1231 <fctr>, ruletr31 <fctr>,
#> #   ruletr42 <fctr>, ruletr53 <fctr>, ruletr14 <fctr>, rusize31 <fctr>,
#> #   rusize42 <fctr>, rusize53 <fctr>, rusize14 <fctr>, ruclas31 <fctr>,
#> #   ruclas42 <fctr>, ruclas53 <fctr>, ruclas14 <fctr>, famsze31 <fctr>,
#> #   famsze42 <fctr>, famsze53 <fctr>, famsze14 <dbl>, fmrs1231 <fctr>,
#> #   fams1231 <dbl>, famszeyr <dbl>, famrfpyr <fctr>, region31 <fctr>,
#> #   region42 <fctr>, region53 <fctr>, region14 <fctr>, refprs31 <dbl>,
#> #   refprs42 <dbl>, refprs53 <dbl>, refprs14 <dbl>, resp31 <fctr>,
#> #   resp42 <fctr>, resp53 <fctr>, resp14 <fctr>, proxy31 <fctr>,
#> #   proxy42 <fctr>, proxy53 <fctr>, proxy14 <fctr>, intvlang <fctr>,
#> #   begrfm31 <fctr>, begrfy31 <fctr>, endrfm31 <fctr>, endrfy31 <fctr>,
#> #   begrfm42 <fctr>, begrfy42 <fctr>, endrfm42 <fctr>, endrfy42 <fctr>,
#> #   begrfm53 <fctr>, begrfy53 <fctr>, endrfm53 <fctr>, endrfy53 <fctr>,
#> #   endrfm14 <fctr>, endrfy14 <fctr>, keyness <fctr>, inscop31 <fctr>,
#> #   inscop42 <fctr>, inscop53 <fctr>, inscop14 <fctr>, insc1231 <fctr>,
#> #   inscope <fctr>, elgrnd31 <fctr>, elgrnd42 <fctr>, elgrnd53 <fctr>,
#> #   elgrnd14 <fctr>, pstats31 <fctr>, pstats42 <fctr>, pstats53 <fctr>,
#> #   rurslt31 <fctr>, rurslt42 <fctr>, rurslt53 <fctr>, age31x <dbl>,
#> #   age42x <dbl>, age53x <dbl>, age14x <dbl>, agelast <dbl>, dobmm <fctr>,
#> #   dobyy <fctr>, sex <fctr>, racev1x <fctr>, racev2x <fctr>,
#> #   raceax <fctr>, racebx <fctr>, racewx <fctr>, racethx <fctr>,
#> #   hispanx <fctr>, hispncat <fctr>, marry31x <fctr>, marry42x <fctr>,
#> #   marry53x <fctr>, marry14x <fctr>, spouid31 <fctr>, spouid42 <fctr>,
#> #   spouid53 <fctr>, spouid14 <fctr>, spouin31 <fctr>, spouin42 <fctr>,
#> #   spouin53 <fctr>, spouin14 <fctr>, ...
```
