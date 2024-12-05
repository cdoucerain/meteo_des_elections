library(targets)

targets::tar_source() # loads functions in R/

# define workflow
list(
  # list all targets
  tar_target(data_election_2002, load_election_circ(2002))
  # targets::tar_quarto(report, "index.qmd")
)
