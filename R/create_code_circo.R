#' Create circonscription codes
#'
#' @description 
#' This fonction create circonscription codes in all the files `cdsp_presiXXXXtY_circ`
#' 
#' With XXXX the year of the election and Y the round
#' 
#' @param overwrite a logical. If `TRUE`, the file will be downloaded again and
#'   the previous version will be erased. Default is `FALSE`.
#'
#' @return 
#' 
#' @export
#' 
#'

create_code_circo <- function(data) {
  data <- load_election_circ(2002)[[2]]
  data$Code.département <- sprintf("%02s", data$Code.département)
  data$id_circo
}
