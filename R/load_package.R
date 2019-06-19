#' Loads and installs package from CRAN or github
#'
#' @param package_name Character vector with package name to install.
#' @param repo Character vector with github repo name to install. Default is
#' \code{NULL}, which forces a CRAN install.
#' @param branch Character vector with branch name to install. Default is
#' \code{NULL} which install from master if \code{repo} is not \code{NULL}.
#'
#' @author Pippo Baudo, Giovanni Laudanno, Pedro Neves
#'
#' @return something
#' @export
#'
#' @examples
#' load_package("beepr")
load_package <- function(
  package_names
) {
  testit::assert(is.character(package_names))

  max_rep <- 2
  for (package_name in package_names) {
    rep <- 0
    while (!require(
      # gsub(
      #   pattern = "[1]",
      #   replacement = "",
      #   x = capture.output(print(package_name))
      # )
      get(
        gsub(
          x = gsub("[^\\p{L}0-9\\s]","",capture.output(print(package_name)), perl = TRUE),
          pattern = "1 ",
          replacement = ""
        )
      )
    ) && rep < max_rep) {
      if (grepl(pattern = "/", x = package_name)) {
        devtools::install_github(package_name)
        next
      }
      print(package_name)
      install.packages(package_name)
      rep <- rep + 1
    }
  }

}
