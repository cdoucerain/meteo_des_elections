
#' Download french circonscriptions shp files
#' 
#' @description 
#' This function downloads shp circonscriptions + unzip
#' The files won't be downloaded if already exist locally (except if 
#' `overwrite = TRUE`).
#' 
#' The folder `data/map/` will be created if required.
#' 
#' @param overwrite a `logical`. If `TRUE`, the files will be downloaded again 
#'   and the previous versions will be erased. Default is `FALSE`.
#'
#' @return No return value.
#' 
#' @export
#' 
#' @references
#' INSEE
#' URL: <https://www.insee.fr/fr/statistiques/6441661?sommaire=6436478>.


dl_map_data <- function(overwrite = FALSE) {
  
  # Define destination directory ---- 
  
  path <- here::here("data", "map")
  
  # Create destination directory ----
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  # Build GitHub base URL ----
  
  filename <- c("map_communes.zip")
  
  base_url <- c("https://www.insee.fr/fr/statistiques/fichier/6441661/contours_circonscriptions_legislatives_03052022.zip")
  
  ## Build local file path ----
  
  dest_file <- file.path(path, filename)
  
  ## Check if the file already exists ----
  
  if (file.exists(dest_file) && !overwrite) {
    
    ## Inform the user ----
    
    message("The filename '", filename, "' already exists. Use ", 
            "'overwrite = TRUE' to download it again and erase the previous ",
            "version.")
    
  } else {
    
    ## Download file ----
    
    utils::download.file(url      = base_url,
                         destfile = dest_file,
                         mode     = "wb")
    
    utils::unzip(zipfile=dest_file,exdir = path)
  }
  
  invisible(NULL) 
}
  
