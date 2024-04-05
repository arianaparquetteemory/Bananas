#load data
library(pacman)
p_load(here, readxl, janitor)

here::i_am("cleandata/cleandata.R")
bananas <- read_xlsx("raw_data/bananaindex.xlsx")
janitor::clean_names(bananas)