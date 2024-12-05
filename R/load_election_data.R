#' loads a csv file located in fodler data/
read_data_file <- function(filename){
  data <- read.table(here::here("data",filename), header=T, sep=',')
  return(data)
}

#' loads election data from a given year, from the two rounds
load_election_circ <- function(year){
  file_t1 <- paste0("cdsp_presi", year, "t1_circ.csv") # 1er tour
  file_t2 <- paste0("cdsp_presi", year, "t2_circ.csv") # 2nd tour
  
  data <- list(
    t1 = read_data_file(file_t1),
    t2 = read_data_file(file_t2)
  )
  return(data)
}

#' pas fonctionelle : il manque la transormation des candidats en partis
merge_years <- function(list_years){
  
  data_all <- data.frame()
  for (yr in list_years){
    # load data from both rounds
    data_yr <- load_election_circ(yr)
    
    # add info on the round
    data_yr$t1$tour <- 1
    data_yr$t2$tour <- 2
    # merge the two rounds
    
    # NEED TO TRANSFORM CANDIDATE NAMES TO PARTIES
    
    data_yr <- rbind(data_yr$t1, data_yr$t2)
    data_yr$annee <- yr
    
    # merge with other years
    rbind(data_all, data_yr)
  }
  return(data_all)
}


