#' Convert 'epub' Files to Text
#'
#' The 'epub' file format is really just a structured 'ZIP' archive with
#' metadata, graphics and (usually) 'HTML' text. Tools are provided to turn an 'epub'
#' file into a tidy data frame.
#'
#' @md
#' @name pubcrawl
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import stringi
#' @import archive
#' @import xslt
#' @importFrom rvest html_text
#' @importFrom xml2 read_html read_xml
NULL
