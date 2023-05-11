# load packages ----
pacman::p_load(readxl, ggplot2, janitor, tidyverse)

source('./R/funs.R')

file <- 'sar1_missao_2019_2023.csv'

# Obter ficheiro CSV da pasta EarthEngine
lapply(file, my_function)

names <- c('bamite', 'bamite', 'bamite', 'eruro', 'eruro', 'eruro',
           'eblondom', 'eblondom', 'eblondom',
           'mangal', 'mangal', 'agua', 'agua', 'agua', 'tanne', 'tanne')

# Ler dados Google Earth engine ----
rawtab <- readr::read_csv(here::here('data-raw', file)) %>% 
  janitor::clean_names()
rawtab$nome <- names

tab <- rawtab %>%  
  select(-c(geo, system_index)) %>%
  pivot_longer(!nome, names_to = 'data')

tab$data_time <- ymd_hms(substr(tab$data, 18, 32))

# Grafico Radar VH backscatter ----
ggplot(tab, aes(x=data_time, y=value, colour = nome)) +
  stat_summary(fun = mean,
               geom = "line",
               linewidth = 1,
               aes(group = nome)) +
  scale_x_datetime(date_breaks = "1 month") +
  theme(axis.text.x = element_text(angle = 90, vjust = .5))
