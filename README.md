
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Graphs

<!-- badges: start -->
<!-- badges: end -->

Graphs is a personal package and a vehicle for graphs made with R.

## Installation

You can install the development version of Graphs from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("edgar-treischl/Graphs")
```

## Example

This is a basic example which shows that the `plotgraph()` returns
graphs made with R. For example, the `datasaurus` plot.

``` r
library(Graphs)
## basic example code
plotgraph("datasaurus.R")
```

<img src="man/figures/README-example-1.png" width="100%" />

Without input, the `plotgraph()` function returns all available graphs.

``` r
plotgraph()
#> Error: Please run `plotgraph()` with a valid name as an argument.
#> Valid examples are: 'anscombe_quartet.R', 'boxplot_illustration.R', 'boxplot_pitfalls.R', 'data_joins.R', 'datasaurus.R', 'gapminder.R', 'pacman.R', 'simpson.R', 'ucb_admission.R'
```

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
