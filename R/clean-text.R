# @param doc parsed or character xml / html doc
# @return a single element character vector (hopefully) devoid of markup
clean_text <- function(doc) {

  if (!inherits(doc, "html_document")) doc <- xml2::read_html(doc)

  cleaner <- xml2::read_xml(system.file("xslt/justthetext.xslt", package="pubcrawl"))

  doc_tmp <- xslt::xml_xslt(doc, cleaner)
  doc_tmp <- rvest::html_text(doc_tmp)
  doc_tmp <- stri_trim_both(doc_tmp)

  if (nchar(doc_tmp) == 0) {
    doc_tmp <- rvest::html_text(doc)
    doc_tmp <- stri_trim_both(doc_tmp)
  }

  doc_tmp

}


# @param bk is the epub book file opened with archive::archive
# @param .x is the path to slurp up from the book connection
# @return a single element character vector (hopefully) devoid of markup
clean_epub <- function(bk, .x) {

  con <- archive::archive_read(bk, .x)
  out <- readLines(con, warn = FALSE)
  close(con)

  out <- paste0(out, collapse = "\n")
  out <- clean_text(out)

  out

}