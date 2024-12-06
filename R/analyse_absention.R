data <- load_election_circ("2002")
data_1 <- create_code_circo(data[[1]])

data_2 <- create_code_circo(data[[2]])


path_data <- here::here("process_data")

filename_shp <- c("ppt_circo.shp")

dest_file_shp <- file.path(path_data, filename_shp)

ppt_circo_shp <- sf::read_sf(dest_file_shp) 

ppt_circo <- ppt_circo_shp |> sf::st_drop_geometry()


meteo_vote <- dplyr::left_join(ppt_circo, data_1) |>
  dplyr::filter(!is.na(Inscrits))


meteo_vote <- meteo_vote |>
  dplyr::mutate(n_abs = Inscrits - Votants, 
                prop_abs = round((n_abs / Inscrits)*100, 1))


ggplot(meteo_vote, 
       aes(x= log(ppt_med_1+1), y=prop_abs))+
  geom_point()
summary(lm(data= meteo_vote, prop_abs~log(ppt_med_1+1)))
