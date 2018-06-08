#' Convert an epub file into a data frame of plaintext chapters
#'
#' @param path path to epub
#' @param encoding Some content may require special handling of
#'        encodings. The default (`UTF-8`) can be overriden with this parameter.
#' @export
#' @examples
#' epub_to_text(system.file("extdat", "augustine.epub", package="pubcrawl"))
epub_to_text <- function(path, encoding = "UTF-8") {

  path <- path.expand(path)

  bk <- archive::archive(path)

  bk <- bk[stri_detect_regex(bk$path, "(\\.xhtml|\\.htm\\.html)"),]

  bk$content <- vapply(
    bk$path,
    clean_epub,
    character(1),
    bk = path, encoding = encoding
  )

  bk$content <- iconv(bk$content, "", to = encoding)

  class(bk) <- c("tbl_df", "tbl", "data.frame")

  bk

}

