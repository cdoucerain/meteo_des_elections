#' add doc
read_data_file <- function(filename){
  data <- read.table(here::here("data",filename), header=T, sep=',')
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
  return(data)
}

