#' projet: A Research Compendium
#' 
#' @description 
#' A paragraph providing a full description of the project and describing each 
#' step of the workflow.
#' 
#' @author Carole Doucerain \email{carole.doucerain@gmail.com}
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

### visualize workflow ----

targets::tar_visnetwork()

### run workflow ----

targets::tar_make()




