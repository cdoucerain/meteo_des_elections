# :mortar_board: Météo des élections

[![License:
GPL-2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://choosealicense.com/licenses/gpl-2.0/)

*project description*

## TODO

- [] Write project description in README


## Content

This project is structured as follow:

```
.
├─ README.md                                  # Presentation of the project
├─ DESCRIPTION                                # Project metadata
├─ LICENSE.md                                 # License of the project
|
├─ data/                                      # Contains raw data
|  ├─ election_sciences_po/                   # data from sciences Po on presidential elections
|  |  └─ ...
|  |
|  └─ ???
|
├─ R/                                         # Contains R functions (only)
|  ├─ load_election_data.R                    # Functions to load csv files for election data
|  └─ ...                                     # 
|
├─ analyses/                                  # Contains R scripts
|  └─ pipeline.R                              # targets pipeline describing the whole workflow
|
├─ index.qmd                                  # Quarto report
├─ index.html                                 # Quarto result (html page)
|
└─ make.R                                     # Script to setup & run the project
```


> [!NOTE]  
> The folder **data/** is not present in this repository (listed in the `.gitignore`) 
> but we provide the code to locally download raw data.



## Installation

To install this compendium:

- [Fork](https://docs.github.com/en/get-started/quickstart/contributing-to-projects)
  this [repository](https://github.com/cdoucerain/meteo_des_elections.git) using the GitHub interface.
- Open [RStudio IDE](https://posit.co/products/open-source/rstudio/) and create a 
  **New Project** from **Version Control** to [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
  your fork.


## Usage

*compléter*

Open this project in RStudio IDE and launch analyses by running:

```r
source("make.R")
```

- All packages will be automatically installed and loaded
- Raw data will be saved in the `data/` directory


## License

The project is released under the GPL-2 license. 
See LICENSE.md for description of the license (https://choosealicense.com/licenses/gpl-2.0/)


## Citation



## References

