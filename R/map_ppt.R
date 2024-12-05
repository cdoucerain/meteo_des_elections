
#' Map ppt France
#' 
#' @description 
#' This function plot ppt france

#' The folder `data/outcumes/figures` will be created if required.
#' 
#' @param 
#' @return No return value.
#' 
#' @export
#' 



map_ppt <- function(){
  
  fra <- rnaturalearth::ne_countries(type = "countries", scale = "large") |>
    dplyr::filter(sovereignt == "France",
                  type == "Country")
    
  
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
  
  path <- here::here("outputs","figures")
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  ggsave(file.path(path,"carte_circon.png"), p, 
         width = 7, height = 7)
  
}

