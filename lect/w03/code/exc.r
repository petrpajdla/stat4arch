library(dplyr)
library(ggplot2)

grave <- read.csv(here::here("lect/w03/data/graves.csv")) %>%
  as_tibble()

artefact <- read.csv(here::here("lect/w03/data/artefacts.csv")) %>%
  as_tibble()
