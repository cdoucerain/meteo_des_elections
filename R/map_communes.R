
#' Map french circonscriptions
#' 
#' @description 
#' This function map the circonscriptions
#' 
#' The folder `data/outputs/figures` will be created if required.
#' 
#' @param 
#' @return No return value.
#' 
#' @export


map_circon <- function(){
  
  domtom <- c("976","974","973","972","971")
  circon <- sf::read_sf("./data/map/circonscriptions_legislatives_030522.shp") |>
    dplyr::filter(!(dep %in% domtom))
  
  world <- rnaturalearth::ne_countries(type = "countries", scale = "large")

  p <- ggplot() +
    geom_sf(data= world, color= "white",fill= "grey80")+
    geom_sf(data = circon, aes(fill= id_circo), col = "black", lwd= 0.1) +
    theme_classic()+
    xlim(-7,11.5)+
    ylim(41,51)+
    theme(legend.position = "none",
          panel.background = element_rect(fill = "grey99",
                                          colour = "grey99"),
          plot.title = element_text(hjust = 0.5)) +
    ggtitle("Carte des circonscriptions de France continentale + Corse")
  p
  path <- here::here("outputs","figures")
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  ggsave(file.path(path,"carte_circon.png"), p, 
         width = 7, height = 7)
  
}








