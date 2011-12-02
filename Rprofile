#!/usr/bin/env Rscript

## Don't echo anything from init
sink("/dev/null")

addrepo <- function(...) {
  options(repos=unique(c(getOption("repos"), c(...))))
}

addrepo("http://cran.cnr.Berkeley.edu")
# Stop asking me which repo to use every time I try to install
# something. (Simply adding a repo is not enough)
options(repos=Filter(function(x) x != "@CRAN@", getOption("repos")))

# Don't spam large amounts of data at me
options(max.print = 100)

# Add r-forge repo
addrepo("http://r-forge.r-project.org")

## All calls to "library" here are done with "logical.return=TRUE", so
## if they aren't installed, things can still continue without them.

## Useful utils, especially peek
suppressMessages(library(futile, logical.return=TRUE))

## Lattice plots are better-looking in general
suppressPackageStartupMessages(library(lattice, logical.return=TRUE))

suppressPackageStartupMessages(library(stringr, logical.return=TRUE))

## Define some functions that I tend to want for interactive use a lot

## perldoc perlop
qw <- function(...)
  unlist(strsplit(c(...), split="\\s+", perl=TRUE))

## perldoc -f say
say <- function(...) {
  stuff <- unlist(list(...))
  string <- paste(c(stuff, "\n"),collapse="")
  cat(string)
}

## perldoc -f quotemeta; perldoc perlre
## Note: Requires "stringr" to work
quotemeta <- function(string) {
  ## Please don't ask why you need the number of backslashes that you
  ## do. I have no idea.
  str_replace_all(string, "(\\W)", "\\\\\\1")
}

## Get the source code for an object. Don't use this on large objects.
sourcecode <- function(x) {
  say(deparse(x), sep="\n")
}

## http://www.bioconductor.org/
## Load BiocLite.R the first time it is needed
biocLite <- function(...) {
  ## Save this function under a temporary name
  biocLite.saved <- biocLite
  rm(list="biocLite", envir=.GlobalEnv)
  success <- tryCatch({
    ## Try to source biocLite.R
    source("http://bioconductor.org/biocLite.R")
    TRUE
  }, error=function (...) {
    ## If we failed, put this function back to the original name, so
    ## we can try again later.
    message("Unable to source biocLite.R. Check your network connection and try again.")
    biocLite <<- biocLite.saved
    FALSE
  })
  ## If we succeeded act like a wrapper and call the real function
  if (success) {
    biocLite(...)
  }
}

sink(NULL)
