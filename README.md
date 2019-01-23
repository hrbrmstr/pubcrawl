#  ***  IMPORTANT ***

No further development will occur in this package as it has been supeseded by the actively maintained and quite spiffy! [`epubr`](https://github.com/ropensci/epubr) package.

--------------

[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/pubcrawl.svg?branch=master)](https://travis-ci.org/hrbrmstr/pubcrawl)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/pubcrawl?branch=master&svg=true)](https://ci.appveyor.com/project/hrbrmstr/pubcrawl)
[![Coverage
Status](https://img.shields.io/codecov/c/github/hrbrmstr/pubcrawl/master.svg)](https://codecov.io/github/hrbrmstr/pubcrawl?branch=master)

# pubcrawl

Convert ‘epub’ Files to Text

## Description

Convert ‘epub’ Files to Text

The ‘epub’ file format is really just a structured ‘ZIP’ archive with
metadata, graphics and (usually) ‘HTML’ text. Tools are provided to turn
an ‘epub’ file into a tidy data frame.

## What’s Inside The Tin

The following functions are implemented:

  - `epub_to_text`: Convert an epub file into a data frame of plaintext
    chapters

## NOTE

There are edge cases I’ve totally not covered yet. Feel free to jump in
and make this a real, useful package\!

## TODO

  - \[X\] Refactor so there aren’t so many heavy dependencies
  - <strike> \[ \] Try to get `hgr` on CRAN so it’s not a GH
    dep</strike> Moved the cleaner code into here
  - \[ \] Better docs
  - \[X\] Embed some epubs for examples and tests
  - \[X\] Setup Travis, Appveyor, code coverage

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

### An O’Reilly epub

``` r
epub_to_text("~/Data/R Packages.epub")
```

    ## # A tibble: 26 x 4
    ##    path                         size date                content                                                       
    ##    <chr>                       <dbl> <dttm>              <chr>                                                         
    ##  1 OEBPS/cover.html              315 2015-03-24 21:49:16 Cover                                                         
    ##  2 OEBPS/titlepage01.html        466 2015-03-24 21:49:16 "R Packages\n\nHadley Wickham"                                
    ##  3 OEBPS/copyright-page01.html  3286 2015-03-24 21:49:16 "R Packages\n\nby Hadley  Wickham\n\n\n\nPrinted in the Unite…
    ##  4 OEBPS/toc01.html            17557 2015-03-24 21:49:16 "navPrefaceIn This Book\n\nConventions Used in This Book\n\nU…
    ##  5 OEBPS/preface01.html        17784 2015-03-24 21:49:16 "Preface\n\n\nIn This Book\n\nThis book will guide you from b…
    ##  6 OEBPS/part01.html             444 2015-03-24 21:49:16 Getting Started                                               
    ##  7 OEBPS/ch01.html             12007 2015-03-24 21:49:16 "Introduction\n\nIn R, the fundamental unit of shareable code…
    ##  8 OEBPS/ch02.html             28633 2015-03-24 21:49:18 "Package Structure\n\nThis chapter will start you on the road…
    ##  9 OEBPS/part02.html             454 2015-03-24 21:49:18 Package Components                                            
    ## 10 OEBPS/ch03.html             28629 2015-03-24 21:49:18 "R Code\n\nThe first principle of using a package is that all…
    ## # ... with 16 more rows

### A Project Gutenberg epub that comes with the package

``` r
epub_to_text(system.file("extdat", "augustine.epub", package="pubcrawl")) %>% 
  mutate(path = abbreviate(path))
```

    ## # A tibble: 10 x 4
    ##    path                             size date                content                                                   
    ##    <chr>                           <dbl> <dttm>              <chr>                                                     
    ##  1 OEBPS/@@@@@@@3296@3296-@3296--0 63804 2017-10-02 07:00:00 "THE CONFESSIONS\nOF\nSAINT AUGUSTINE\n\nBy Saint Augusti…
    ##  2 OEBPS/@@@@@@@3296@3296-@3296--1 68504 2017-10-02 07:00:00 "BOOK III\nTo Carthage I came, where there sang all aroun…
    ##  3 OEBPS/@@@@@@@3296@3296-@3296--2 80192 2017-10-02 07:00:00 "BOOK V\nAccept the sacrifice of my confessions from the …
    ##  4 OEBPS/@@@@@@@3296@3296-@3296--3 51898 2017-10-02 07:00:00 "O crooked paths! Woe to the audacious soul, which hoped,…
    ##  5 OEBPS/@@@@@@@3296@3296-@3296--4 80194 2017-10-02 07:00:00 "Anubis, barking Deity, and all         The monster Gods …
    ##  6 OEBPS/@@@@@@@3296@3296-@3296--5 80718 2017-10-02 07:00:00 "The boy then being stilled from weeping, Euodius took up…
    ##  7 OEBPS/@@@@@@@3296@3296-@3296--6 65956 2017-10-02 07:00:00 "And Thou knowest how far Thou hast already changed me, w…
    ##  8 OEBPS/@@@@@@@3296@3296-@3296--7 57022 2017-10-02 07:00:00 "BOOK XII\nMy heart, O Lord, touched with the words of Th…
    ##  9 OEBPS/@@@@@@@3296@3296-@3296--8 69513 2017-10-02 07:00:00 "BOOK XIII\nI call upon Thee, O my God, my mercy, Who cre…
    ## 10 OEBPS/@@@@@@@3296@3296-@3296--9 21223 2017-10-02 07:00:00 "The Confessions of Saint Augustine, by Saint Augustine\n…

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
