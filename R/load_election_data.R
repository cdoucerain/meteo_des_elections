#' loads a csv file located in fodler data/
read_data_file <- function(filename){
  data <- read.csv(here::here("data", "elections_sciences_po",filename), header=TRUE, sep=',', dec='.')
  return(data)
}

#' @title Load presidential election results
#' @description loads election data from a given year, from the two rounds, per circonscription
#' @param year year of the election
#' @return list of 2 dataframes, one for each round of the election (`t1`and `t2`), containing the results of the election per circonscription
#' @export
load_election_circ <- function(year){
  file_t1 <- paste0("elections_sciences_po/","cdsp_presi", year, "t1_circ.csv")
  file_t2 <- paste0("elections_sciences_po/","cdsp_presi", year, "t2_circ.csv")

  data <- list(
    t1 = read_data_file(file_t1),
    t2 = read_data_file(file_t2)
  )
  
  #Remove ultramarin circos
  for (i in seq_along(data)){
    data[[i]] <- data[[i]] |> 
      dplyr::filter(stringr::str_detect(Code.département, "^\\d{1,2}$"))
  }
  return(data)
}

