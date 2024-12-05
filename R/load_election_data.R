#' add doc
read_data_file <- function(filename){
  data <- read.csv(here::here("data",filename), header=TRUE, sep=',', dec='.')
  return(data)
}

#' add doc
load_election_circ <- function(year){
  file_t1 <- paste0("cdsp_presi", year, "t1_circ.csv") # 1er tour
  file_t2 <- paste0("cdsp_presi", year, "t2_circ.csv") # 2nd tour
  
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

