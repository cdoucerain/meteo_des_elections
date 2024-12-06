data <- load_election_circ("2002")
data_1 <- create_code_circo(data[[1]])

data_1 <- create_code_circo(data[[2]])


path_data <- here::here("process_data")

filename_shp <- c("ppt_circo.shp")

dest_file_shp <- file.path(path_data, filename_shp)

ppt_circo_shp <- sf::read_sf(dest_file_shp) 

ppt_circo <- ppt_circo_shp |> sf::st_drop_geometry()


