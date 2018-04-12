
# pubcrawl

Convert ‘epub’ Files to Text

## Description

Convert ‘epub’ Files to Text

## What’s Inside The Tin

The following functions are implemented:

  - `epub_to_text`: Convert an epub file into a data frame of plaintext
    chapters

## TODO

Refactor so there aren’t so many heavy dependencies

## Installation

``` r
devtools::install_github("hrbrmstr/pubcrawl")
```

## Usage

``` r
library(pubcrawl)
library(tidyverse)

# current verison
packageVersion("pubcrawl")
```

    ## [1] '0.1.0'

``` r
epub_to_text("~/Data/R Packages.epub")
```

    ## # A tibble: 26 x 4
    ##    path                          size date                content                                                      
    ##    <chr>                        <dbl> <dttm>              <chr>                                                        
    ##  1 OEBPS/cover.html              315. 2015-03-24 21:49:16 Cover                                                        
    ##  2 OEBPS/titlepage01.html        466. 2015-03-24 21:49:16 "R Packages\n\nHadley Wickham"                               
    ##  3 OEBPS/copyright-page01.html  3286. 2015-03-24 21:49:16 "R Packages\n\nby Hadley  Wickham\n\n\n\nPrinted in the Unit…
    ##  4 OEBPS/toc01.html            17557. 2015-03-24 21:49:16 "navPrefaceIn This Book\n\nConventions Used in This Book\n\n…
    ##  5 OEBPS/preface01.html        17784. 2015-03-24 21:49:16 "Preface\n\n\nIn This Book\n\nThis book will guide you from …
    ##  6 OEBPS/part01.html             444. 2015-03-24 21:49:16 Getting Started                                              
    ##  7 OEBPS/ch01.html             12007. 2015-03-24 21:49:16 "Introduction\n\nIn R, the fundamental unit of shareable cod…
    ##  8 OEBPS/ch02.html             28633. 2015-03-24 21:49:18 "Package Structure\n\nThis chapter will start you on the roa…
    ##  9 OEBPS/part02.html             454. 2015-03-24 21:49:18 Package Components                                           
    ## 10 OEBPS/ch03.html             28629. 2015-03-24 21:49:18 "R Code\n\nThe first principle of using a package is that al…
    ## # ... with 16 more rows
