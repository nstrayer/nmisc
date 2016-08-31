# nmisc
Blatant copy of Frank Harrell's hmisc package

to install:

```r
install.packages("devtools")
library("devtools")
devtools::install_github("nstrayer/nmisc")
```
Right now it mostly just loads my favorite data cleaning packages and has some
nice vectorized functions for dealing with cleaning such as `superNumeric`.

```r
superNumeric("$23,424.90")
> 23424.90
```
