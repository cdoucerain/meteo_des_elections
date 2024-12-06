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
  #data <- load_election_circ(2002)[[2]]
  data$Code.département <- ifelse(
    nchar(trimws(data$Code.département)) == 1, 
    paste0("0", trimws(data$Code.département)), 
    trimws(data$Code.département)
  )
  data$circonscription <- ifelse(
    nchar(trimws(data$circonscription)) == 1, 
    paste0("0", trimws(data$circonscription)), 
    trimws(data$circonscription)
  )
  data$id_circo <- paste(data$Code.département, data$circonscription, sep="")

  return(data)
}
