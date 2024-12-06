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


## Global Variables ----

# You can list global variables here (or in a separate R script)


## Run Project ----

# List all R scripts in a sequential order and using the following form:
# source(here::here("analyses", "script_X.R"))



## targets setup ----

targets::tar_config_set(
  store = 'outputs/pipeline', # where to store outputs created by targets
  script = 'analyses/pipeline.R' # contains the workflows
)
targets::

## workflow ----

targets::tar_make()

