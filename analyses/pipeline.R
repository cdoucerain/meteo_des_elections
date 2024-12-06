library(targets)
library(ggplot2)

targets::tar_source() # loads functions in R/

# define workflow
list(
  #Load data
  tar_target(name = data_2002, 
             command = load_election_circ("2002")),
  
  #Format data
  
  tar_target(name = meteo_vote, 
             command = merge_df(data_2002))
  
  ,tar_target(name = sum_models, command = model_df(meteo_vote))
  # not working? 
  
  ,tar_target(name = plot_models, command = df_plot_model(meteo_vote))
  
  # targets::tar_quarto(report, "index.qmd")
)

 