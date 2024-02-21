# packages installed only once
# install.packages("archdata")
# install.packages("dplyr")
# install.packages("ggplot2")

# loading packages from the library, where it is installed
# archdata: package with archaeological datasets
library(archdata)
# dplyr: package for data manipulation
library(dplyr)
# gglot2: package for plotting
library(ggplot2)

# getting help
?archdata
help("archdata")

# loading dataset DartPoints from archdata package
data("DartPoints")

?DartPoints

# exploring what is in the dataset
head(DartPoints)
tail(DartPoints)

# count of dart points by groups
DartPoints %>% 
  group_by(Name) %>% 
  count()

# mean length of dart points
DartPoints %>% 
  summarise(prumer_delka = mean(Length))

# mean length of dart points in groups
DartPoints %>% 
  group_by(Name) %>% 
  summarise(prumer_delka = mean(Length))

# histogram of dart points lengths
DartPoints %>% 
  ggplot() +
  aes(x = Length) +
  geom_histogram()

# scatter plots of length/width by groups with linear models
DartPoints %>% 
  ggplot() +
  aes(x = Length, y = Width, color = Name, size = Weight) +
  geom_point() +
  stat_smooth(method = "lm") +
  facet_wrap(vars(Name)) +
  labs(x = "Délka", y = "Šířka")
