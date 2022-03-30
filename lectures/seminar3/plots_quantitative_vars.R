# dart points data set, quantitative variables

library(archdata)
library(ggplot2)


# data prep ---------------------------------------------------------------

data("DartPoints")

sipky <- data.frame(DartPoints)


# explore data ------------------------------------------------------------

View(sipky)

head(sipky)
tail(sipky)

str(sipky)


# plots -------------------------------------------------------------------

# histogram ---------------------------------------------------------------

ggplot(sipky, aes(x = Length)) +
  geom_histogram()

p <- ggplot(sipky, aes(x = Length))

# počet binů - kategorií
p + geom_histogram(bins = 60)
p + geom_histogram(bins = 30)

# šířka binu
p + geom_histogram(binwidth = 10)
p + geom_histogram(binwidth = 6)

p + geom_histogram(binwidth = 6, fill = "white", color = "black")

# density plot ------------------------------------------------------------

p + geom_density()

q <- ggplot(sipky, aes(Width, color = Name, fill = Name))

q + geom_density(alpha = 0.2) # alpha value = průhlednost

# q + geom_histogram(alpha = 0.2)

# boxplots ----------------------------------------------------------------

b <- ggplot(sipky, aes(x = Name, y = Thickness, color = Name))

b + geom_boxplot()

# ggplot(sipky, aes(x = Thickness, y = Name)) +
#   geom_boxplot()


# descriptive stats -------------------------------------------------------

tloustka <- sipky$Thickness

hist(tloustka)

# průměr
mean(tloustka)

# medián
median(tloustka)

# rozpětí
max(tloustka) - min(tloustka)
range(tloustka)

# směrodatná odchylka / standard deviation
sd(tloustka)

# IQR
IQR(tloustka)


# experiment --------------------------------------------------------------

w <- ggplot(sipky, aes(x = Weight))

w + geom_histogram()

# průměr a medián
w_mean <- mean(sipky$Weight)
w_median <- median(sipky$Weight)

w + geom_density(fill = "white") +
  geom_vline(xintercept = w_mean, color = "red") +
  geom_vline(xintercept = w_median, color = "blue") +
  labs(title = "Můj krásný graf", x = "Hmotnost (g)")


# exporting plots ---------------------------------------------------------

ggsave(here::here("muj_krasny_graf.png"))
ggsave(here::here("muj_krasny_graf.pdf"))

ggsave(here::here("muj_krasny_graf.png"), width = 15)




