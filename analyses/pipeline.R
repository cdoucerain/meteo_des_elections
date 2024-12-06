library(targets)

targets::tar_source() # loads functions in R/

# define workflow
list(
  #Load data
  tar_target(name = data_2002, command = load_election_circ(year), format = "file"),
  
  #Format data
  tar_target(name = format_2002_t1, command = create_code_circo(data_2002[[1]])),
  tar_target(name = format_2002_t2, command = create_code_circo(data_2002[[2]]))
  
  
  # targets::tar_quarto(report, "index.qmd")
)
