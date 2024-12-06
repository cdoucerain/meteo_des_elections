
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

map_ppt_cons <- function(){
  
  circon_ppt_1
  p<- ggplot() +
    geom_sf(data= world, color= "white",fill= "grey80")+
    geom_sf(data = circon_ppt_1 |> dplyr::filter(!is.na(ppt_med)),aes(fill= log(ppt_med)),col = "black", lwd= 0.1) +
    scale_fill_gradient(name = "Médiane précipitations\n (log mm)",
                        low = "white",
                        high = "darkblue", 
                        na.value = "white",
                        limits=c(0,7),
                        breaks = c(0, 2, 4, 6))+
    theme_classic()+
    xlim(-7,11.5)+
    ylim(41,51)+
    theme(#legend.position = "none",
      panel.background = element_rect(fill = "grey99",
                                      colour = "grey99"),
      plot.title = element_text(hjust = 0.5)) +
    ggtitle("Précipitation par circonscription le 26 avril 2002")
  p
  path <- here::here("outputs","figures")
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  ggsave(file.path(path,"carte_circon_ppt_26042002.png"), p, 
         width = 7, height = 7)
  
  
y= c(circon, c("mean","quantile"), quantiles=c(0.5))
circon_ppt_2

ggplot() +
  geom_sf(data= world, color= "white",fill= "grey80")+
  geom_sf(data = circon_ppt_2 |> dplyr::filter(!is.na(ppt_med)),aes(fill= log(ppt_med)),col = "black", lwd= 0.1) +
  scale_fill_gradient(name = "Médiane précipitations\n (log mm)",
                      low = "white",
                      high = "darkblue", 
                      na.value = "white",
                      limits=c(0,7),
                      breaks = c(0, 2, 4, 6))+
  theme_classic()+
  xlim(-7,11.5)+
  ylim(41,51)+
  theme(#legend.position = "none",
    panel.background = element_rect(fill = "grey99",
                                    colour = "grey99"),
    plot.title = element_text(hjust = 0.5)) +
  ggtitle("Précipitations par circonscription le 05 mai 2002")

path <- here::here("outputs","figures")

dir.create(path, showWarnings = FALSE, recursive = TRUE)

ggsave(file.path(path,"carte_circon_ppt_05052002.png"), p, 
       width = 7, height = 7)

}

