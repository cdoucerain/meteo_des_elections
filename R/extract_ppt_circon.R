
#' Extract mean and med precipitation per circonscription 
#' 
#' @description 
#' This function extract mean &m median level of precipipation per continental french circon 

#' The folder `data/outcumes/process_data` will be created if required.
#' 
#' @param 
#' @return No return value.
#' 
#' @export
#' 


extract_ppt_cons <- function(){
  
  path_raster <- here::here("data","ppt")
  
  world <- rnaturalearth::ne_countries(type = "countries", scale = "large")
  
  fra <- world |>
    dplyr::filter(sovereignt == "France",
                  type == "Country")
  
  raster_ppt <- terra::rast("./data/ppt/CHELSA_EUR11_pr_day_2002_V1.1.nc")
  
  # 1er tour 21 avril = 111eme jour
  raster_1er <- raster_ppt$Band1_111
  
  domtom <- c("976","974","973","972","971")
  circon <- sf::read_sf("./data/map/circonscriptions_legislatives_030522.shp") |>
    dplyr::filter(!(dep %in% domtom))
  
  circon_1 <- sf::st_transform(circon,terra::crs(raster_1er))
  
  e <- as(raster::extent(-7, 41, 11.5, 51), 'SpatialPolygons')
  terra::crs(e) <- "+proj=longlat +datum=WGS84 +no_defs"
  r1 <- raster::crop(raster_1er, e)
  
  circon_ppt_1 <- circon_1
  circon_ppt_1[, c("ppt_mean_1", "ppt_med_1")] <- exactextractr::exact_extract(x=r1, 
                                                                           y= circon, c("mean","quantile"), quantiles=c(0.5))
  
  circon_ppt_1 <- circon_ppt_1 |> 
    dplyr::select(id_circo, ppt_mean_1, ppt_med_1)
  # 2er tour 5 mai = 125 eme jour
  raster_2er <- raster_ppt$Band1_125
  
  circon_2 <- sf::st_transform(circon,terra::crs(raster_2er))
  
  r2 <- raster::crop(raster_2er, e)
  
  circon_ppt_2 <- circon_2
  circon_ppt_2[, c("ppt_mean_2", "ppt_med_2")] <- exactextractr::exact_extract(x=r2,y= circon, c("mean","quantile"),
                                                                               quantiles=c(0.5))
  # Fuse both
  circon_ppt_2 <- circon_ppt_2 |> 
    sf::st_drop_geometry() |>
    dplyr::select(id_circo, ppt_mean_2, ppt_med_2)
  
  
  circon_ppt <- dplyr::left_join(circon_ppt_1,circon_ppt_2) |>
    dplyr::select(id_circo, ppt_mean_1, ppt_med_1, ppt_mean_2, ppt_med_2, geometry)
  
  path_data <- here::here("process_data")
  
  dir.create(path_data, showWarnings = FALSE, recursive = TRUE)
  
  filename_shp <- c("ppt_circo.shp")
  
  dest_file_shp <- file.path(path_data, filename_shp)
  
  #Save data
  
  sf::st_write(circon_ppt,dsn = dest_file_shp)
  
}