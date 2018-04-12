
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

    ## # A tibble: 10 x 4
    ##    path                                                                      size date                content          
    ##    <chr>                                                                    <dbl> <dttm>              <chr>            
    ##  1 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-0.htm.html 63804 2017-10-02 07:00:00 "THE CONFESSIONS…
    ##  2 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-1.htm.html 68504 2017-10-02 07:00:00 "BOOK III\nTo Ca…
    ##  3 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-2.htm.html 80192 2017-10-02 07:00:00 "BOOK V\nAccept …
    ##  4 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-3.htm.html 51898 2017-10-02 07:00:00 "O crooked paths…
    ##  5 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-4.htm.html 80194 2017-10-02 07:00:00 "Anubis, barking…
    ##  6 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-5.htm.html 80718 2017-10-02 07:00:00 "The boy then be…
    ##  7 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-6.htm.html 65956 2017-10-02 07:00:00 "And Thou knowes…
    ##  8 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-7.htm.html 57022 2017-10-02 07:00:00 "BOOK XII\nMy he…
    ##  9 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-8.htm.html 69513 2017-10-02 07:00:00 "BOOK XIII\nI ca…
    ## 10 OEBPS/@public@vhost@g@gutenberg@html@files@3296@3296-h@3296-h-9.htm.html 21223 2017-10-02 07:00:00 "The Confessions…

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
