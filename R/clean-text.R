# @param doc parsed or character xml / html doc
# @param encoding encoding
# @return a single element character vector (hopefully) devoid of markup
clean_text <- function(doc, encoding = "UTF-8") {

  if (!inherits(doc, "html_document")) {
    doc <- xml2::read_html(charToRaw(doc), encoding = encoding)
  }

  cleaner <- xml2::read_xml(system.file("xslt/justthetext.xslt", package="pubcrawl"))

  doc_tmp <- xslt::xml_xslt(doc, cleaner, )
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
# @param encoding encoding
# @return a single element character vector (hopefully) devoid of markup
clean_epub <- function(bk, .x, encoding = "UTF-8") {

  con <- archive::archive_read(bk, .x)
  out <- readLines(con, warn = FALSE, encoding = encoding)
  close(con)

  out <- paste0(out, collapse = "\n")
  out <- clean_text(out, encoding)

  out

}