
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Graphs

<!-- badges: start -->
<!-- badges: end -->

The goal of Graphs is to …

## Installation

You can install the development version of Graphs from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("edgar-treischl/Graphs")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Graphs)
## basic example code
plotgraph("datasaurus.R")
```

<img src="man/figures/README-example-1.png" width="100%" />

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

``` r
plotgraph()
#> Error: Please run `plotgraph()` with a valid name as an argument.
#> Valid examples are: 'anscombe_quartet.R', 'boxplot_illustration.R', 'boxplot_pitfalls.R', 'data_joins.R', 'datasaurus.R', 'gapminder.R', 'pacman.R', 'simpson.R', 'ucb_admission.R'
```

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
