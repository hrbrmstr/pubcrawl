#' Convert an epub file into a data frame of plaintext chapters
#'
#' @param path path to epub
#' @export
#' @examples \dontrun{
#' epub_to_text("~/Data/R Packages.epub")
#' }
epub_to_text <- function(path) {

  path <- path.expand(path)

  bk <- archive::archive(path)

  dplyr::filter(bk, stri_detect_fixed(path, "html")) %>%
    dplyr::mutate(content = map_chr(path, ~{
      archive::archive_read(bk, .x) %>%
        readr::read_lines() %>%
        paste0(collapse = "\n") %>%
        hgr::clean_text()
    }))

}