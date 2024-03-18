# Skript z úlohy z lekce 2024-03-13
# Predmet: AES_707: Statistics seminar for archaeology students
# Autori: Peter Tkáč, Petr Pajdla
# Dátum: 2024-03-13
# Dátum poslednej aktualizácie: 2024-03-13

# pozn.: do hlavičky vyššie si môžete uložiť akékoľvek údaje,
# ktoré vám pomôžu orientovať sa vo svojich skriptoch


# Packages ----------------------------------------------------------------

library(here)
library(ggplot2)


# Data --------------------------------------------------------------------

# načíta tabuľku a uloží ju ako objekt "cups"
cups <- read.csv(here("bacups.csv")) 



# Prehled datasetu --------------------------------------------------------

# štruktúra datasetu
str(cups) 
colnames(cups) # názvy premenných / stĺpcov

# sumarizácie hodnot pre výšku nádoby
summary(cups$H)


# Distribuce --------------------------------------------------------------

# histogram
ggplot(data = cups) +
  aes(x = H) +
  # argument "binwidth" upraví šírku stĺpcov
  geom_histogram(binwidth = 1) 

# boxplot
ggplot(cups) + 
  aes(x = Phase, y = H) +
  geom_boxplot() +
  # "geom_jitter" zobrazí jednotlivé body, v tomto prípade výšky pohárov
  # argument "width" nastaví mieru rozptylu bodov po horizontálnej ose 
  geom_jitter(width = 0.02, color = "grey50", alpha = 0.5, size = 3) + 
  theme_light()



# Vztah výšky a priemeru okraja nádoby ------------------------------------

# korelace
cor(cups$H, cups$RD)
# existuje veľká korelácia medzi výškou nádoby a priemerom okraja


# bodový graf
ggplot(cups) +
  aes(x = H, y = RD, color = Phase) +
  geom_point(size = 3, alpha = 0.5) +
  # pri arumente "method" je zvolený lineárny model ("lm")
  # argument "se" upravuje viditeľnosť alebo, v tomto prípade neviditelnosť štandartnej chyby 
  geom_smooth(method = "lm", se = FALSE) + 
  labs(x = "Výška (cm)", y = "Priemer okraja (cm)", color = "Datovanie",
       title = "Vzťah výšky a priemeru okraja nádob z doby bronzovej z Talianska",
       caption = "Lukesh S. S. - S. Howe 1978") +
  theme_light()

# alternativa
ggplot(cups) +
  aes(x = H, y = RD, color = Phase) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  # funkcia "facet_wrap" rozdelí graf na viac, podľa daného kľúča
  # v tomto prípade podľa datovania - premenná "Phase"
  facet_wrap(~Phase) + 
  labs(x = "Výška (cm)", y = "Priemer okraja (cm)", color = "Datovanie",
       title = "Vzťah výšky a priemeru okraja nádob z doby bronzovej z Talianska",
       caption = "Lukesh S. S. - S. Howe 1978") +
  theme_light()

# ak neviete napísať tildu (~) tak môžete namiesto nej použiť argument "vars()"
ggplot(cups)+
  aes(x = H, y = RD, color = Phase)+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = "lm", se = FALSE)+
  facet_wrap(vars(Phase))+ # alternatívne použitie argumentu vars()
  labs(x = "Výška (cm)", y = "Priemer okraja (cm)", color = "Datovanie",
       title = "Vzťah výšky a priemeru okraja nádob z doby bronzovej z Talianska",
       caption = "Lukesh S. S. - S. Howe 1978") +
  theme_light()



# Export grafu ------------------------------------------------------------

# týmto spôsobom uložíte posledný graf ktorí ste vyrobili
ggsave(filename = here("posledny_graf.png")) 

# ak chcete uložiť iný než posledný graf, 
# musíte si ten uložiť ako objekt pomocou starého známeho "<-"
muj_boxplot1 <- ggplot(cups) + 
  aes(x = Phase, y = H)+
  geom_boxplot()+
  geom_jitter(width = 0.02, color = "grey50", alpha = 0.5, size = 3)+
  theme_light()

# všimnite si že je podľa ďalších argumentov možné 
# nastaviť veľkosť obrázku či jeho rozlíšenie
ggsave(plot = muj_boxplot1, filename = here("muj_boxplot.jpg"), 
       width = 10, height = 10, units = "cm", dpi = 300)

