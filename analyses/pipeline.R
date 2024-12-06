library(targets)

targets::tar_source() # loads functions in R/

# define workflow
list(
  tar_target(name = data_2002, command = load_election_circ(2002), format = "file"),
  
  tar_target(name = format_2002_t1, command = create_code_circo(data_2002[[1]])),
  
  # list all targets
  tar_target(data_election_2002, load_election_circ(2002))
  # targets::tar_quarto(report, "index.qmd")
)
