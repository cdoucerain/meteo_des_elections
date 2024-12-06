#' projet: La météo des élections
#' 
#' @description 
#' The project analyses the influence of weather conditions on the 
#' voting participation and results to the French presidential elections.
#' 
#' As an example, we only consider a single election, 
#' represented by the global variable `year`.
#' 
#' HERE DESCRIBE DIFFERENT STEPS OF WORKFLOW
#' 
#' 
#' @author Carole Doucerain \email{carole.doucerain@cefe.cnrs.fr}
#' @author Alycia Frochot \email{alycia.frochot@cefe.cnrs.fr}
#' @author Etienne Henry \email{etienne.henry@cefe.cnrs.fr}
#' @author Léo Streith \email{leo.streith@cefe.cnrs.fr}
#' 
#' @date 2024/12/05


## Install Dependencies (listed in DESCRIPTION) ----

devtools::install_deps()

## Load Project Addins (R Functions and Packages) ----

devtools::load_all()

## Create function documentation ----

devtools::document()

## Global Variables ----

year <- 2002

## Run Project with Targets ----

### targets setup ----

targets::tar_config_set(
  store = 'outputs/pipeline', # where to store outputs created by targets
  script = 'analyses/pipeline.R' # contains the workflows
)
targets::

### visualize workflow ----

targets::tar_visnetwork()

### run workflow ----

targets::tar_make()




