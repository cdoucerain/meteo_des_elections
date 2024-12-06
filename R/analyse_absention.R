merge_df <- function(){
  
  data_1 <- create_code_circo(data[[1]])
  
  
  data_2 <- create_code_circo(data[[2]])
  
  
  path_data <- here::here("process_data")
  filename_shp <- c("ppt_circo.shp")
  
  dest_file_shp <- file.path(path_data, filename_shp)
  
  ppt_circo_shp <- sf::read_sf(dest_file_shp) 
  
  ppt_circo <- ppt_circo_shp |> sf::st_drop_geometry()
  
  
  meteo_vote <- dplyr::left_join(ppt_circo, data_1) |>
    dplyr::filter(!is.na(Inscrits)) |>
    dplyr::select(id_circo, ppt_med_1, ppt_med_2, 
                  Inscrits_1 = Inscrits,
                  Votants_1 = Votants, 
                  Exprimés_1 = Exprimés)
  
  meteo_vote <- dplyr::left_join(meteo_vote, data_2) |>
    dplyr::filter(!is.na(Inscrits)) |>
    dplyr::rename(Inscrits_2 = Inscrits,
                  Votants_2 = Votants, 
                  Exprimés_2 = Exprimés,
                  chirac_2 = CHIRAC..UMP.,
                  lepen_2 = LE.PEN..FN.)
  
  
  meteo_vote <- meteo_vote |>
    dplyr::mutate(n_abs_1 = Inscrits_1 - Votants_1, 
                  prop_abs_1 = round((n_abs_1 / Inscrits_1)*100, 1)) |>
    dplyr::mutate(n_abs_2 = Inscrits_2 - Votants_2, 
                  prop_abs_2 = round((n_abs_2 / Inscrits_2)*100, 1))
  
  
  write.table(meteo_vote, "./process_data/meteo_vote.csv")
  
}


model_df <- function(){
  
  meteo_vote_df <- read.table("./process_data/meteo_vote.csv")
  
  return(summary(lm(data= meteo_vote_df, 
                    prop_abs_2~ppt_med_2)))
  
}


df_plot_model <- function(){
  
  
  meteo_vote_df <- read.table("./process_data/meteo_vote.csv")
  
  
  p <- ggplot(meteo_vote, 
         aes(x= ppt_med_2, y=prop_abs))+
    geom_point() +
    theme_bw()
  
  ggplot(meteo_vote, 
         aes(x= ppt_med_2, y=prop_abs_2))+
    geom_point() +
    labs(x="Median precipitation", 
         y= "Proportion absentéisme")+
    geom_smooth(method= "lm")+
    theme_bw()
  
  ggsave("./outputs/figures/regression_2nd_tour.png", p, 
         width = 7, height = 7)
  
}

