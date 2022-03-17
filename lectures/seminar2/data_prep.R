library(archdata)

data("DartPoints", package = "archdata")

head(DartPoints)

plot(DartPoints$Length, DartPoints$Weight)
cor(DartPoints$Length, DartPoints$Weight)

library(tidyverse)

DartPoints %>% 
  as_tibble() %>%
  ggplot(aes(Length, Width, size = Weight)) +
  geom_point(data = select(DartPoints, -"Name"), alpha = 0.2) +
  geom_point(aes(fill = Name), shape = 21) +
  scale_fill_brewer(palette = "Set1") +
  scale_x_log10() +
  scale_y_log10() +
  facet_wrap(~Name) +
  theme_bw() +
  theme(legend.position = c(0.72, 0.28)) +
  labs(x = "Length (mm, log scale)", 
       y = "Width (mm, log scale)",
       size = "Weight (g)")

ggsave("lectures/seminar2/fig/dartpoints_scatter.png", scale = 1.4)  


DartPoints %>% 
  write_csv(here::here("lectures/seminar2/data/dartPoints03.csv"))
DartPoints %>% 
  write_csv2(here::here("lectures/seminar2/data/dartPoints01.csv"))
DartPoints %>% 
  write_tsv(here::here("lectures/seminar2/data/dartPoints02.txt"))
DartPoints %>% 
  write_delim(here::here("lectures/seminar2/data/dartPoints04.txt"), delim = "#")
DartPoints %>% 
  write_excel_csv(here::here("lectures/seminar2/data/dartPoints00.csv"))

readxl::excel_sheets(here::here("lectures/seminar2/data/dartPoints00.xlsx"))
readxl::read_excel(here::here("lectures/seminar2/data/dartPoints00.xlsx"), sheet = "dartPoints00") %>% View()

read_csv2(here::here("lectures/seminar2/data/dartPoints01.csv"))
read_tsv(here::here("lectures/seminar2/data/dartPoints02.txt"))
read_csv(here::here("lectures/seminar2/data/dartPoints03.csv"))
read_delim(here::here("lectures/seminar2/data/dartPoints04.txt"), delim = "#")
read_csv(here::here("lectures/seminar2/data/dartPoints05.csv"), na = "-")

unzip(here::here("lectures/seminar2/data/exData.zip"))
