#' Convert an epub file into a data frame of plaintext chapters
#'
#' @param path path to epub
#' @export
#' @examples
#' epub_to_text(system.file("extdat", "augustine.epub", package="pubcrawl"))
epub_to_text <- function(path) {

  path <- path.expand(path)

  bk <- archive::archive(path)

  bk <- bk[stri_detect_fixed(bk$path, "html"),]

  bk$content <- vapply(bk$path, clean_epub, character(1), bk = path)

  class(bk) <- c("tbl_df", "tbl", "data.frame")

  bk

}
