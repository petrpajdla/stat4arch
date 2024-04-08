####################x
## Stat4arch
## Kód k cvičeniu z 7. lekcie
## 2024-04-05
## Autory: Peter Tkáč, Petr Pajdla
#########################x


# Balíky ------------------------------------------------------------------

library(sf) # balík na prácu s priestorovými objektmi triedy simple feature
library(dplyr)
library(ggplot2)
library(here)
library(RCzechia)

# tip: balíček "tidyverse" obsahuje v sebe viac balíkov ako napríklad 
# ggplot2 alebo dplyr: https://www.tidyverse.org/


# Data --------------------------------------------------------------------

# už viete že pomenovávanie objektov je ľubovolné, 
# malo by však zachovávať nejakú logiku a systematiku. 
# V tomto prípade som ja zvolil predponu df_ 
# na označenie objektov typu data frame

df_lasoles <- read.csv(here("LASOLES_14C_database.csv"), sep = ";") 

# polygony krajov
kraje <- RCzechia::kraje() 

# polygon s celou ČR
republika <- RCzechia::republika() 

# bod pre Brno
brno <- st_point(c(16.6078411, 49.2002211)) %>% 
  st_geometry() %>% 
  st_set_crs("EPSG:4326")


## Úprava dát -------------------------------------------------------------

# tu som použil predponu sf_ aby som označil že objekt je typu 
# simple feature a teda na ňom môžem aplikovať priestorové analýzy

sf_lasoles <- st_as_sf(df_lasoles, 
                       coords = c(x = "Longitude_WGS84", y = "Latitude_WGS84"), 
                       crs = 4326) # vytvorí objekt typu simple feature

# transformace koordinačného systému z WGS 84 (EPSG 4326) na S-JTSK (EPSG 5514):
sf_lasoles <- st_transform(sf_lasoles, "EPSG:5514")
republika <- st_transform(republika, "EPSG:5514")
brno <- st_transform(brno, "EPSG:5514")
kraje <- st_transform(kraje, "EPSG:5514")


# Úlohy -------------------------------------------------------------------


## Lokality v okruhu 15 km ------------------------------------------------

# Find out how many radiocarbon dated samples are located 
# within distance 15 km (or closer) from Brno.

# vytvorenie buffer zone o polomere 15 km
brno15 <- st_buffer(brno, 15000)

# mapa
ggplot() +
  geom_sf(data = republika) +
  geom_sf(data = sf_lasoles) +
  geom_sf(data = brno15, fill = "red", alpha = 0.5) +
  theme_light()

# prienik lokalít s bufferovou zónou
# pozor! objekty v zátvorke musia byť v správnom poradí
prunik <- st_intersects(sf_lasoles, brno15) 

# objekt, který pro každý řádek (bod) 'sf_lasoles' udává počet, 
# kolik má průniků s bufferem 'brno15'
prunik  

# funkce 'lengths' mi vrátí, jaká je délka každého vektoru daného objektu, 
# v tomto případě ji nepotřebuji, ale v praxi můžetre narazit na složitější 
# situace, kdy potřeba je, proto je jednodušší ji použít rovnou
lengths(prunik)

# porovnání, kdy je délka průniků větší než nula mi vrátí TRUE/FALSE 
# hodnoty, díky kterým můžu filtrovat řádky původního objektu 'sf_lasoles'
lengths(prunik) > 0

# vyfiltrovanie lokalít v okruhu 15km
lokality_brno <- sf_lasoles %>% 
  dplyr::filter(lengths(prunik) > 0)

nrow(lokality_brno) # zistí počet riadkov / objektov databáze

# mapa:
ggplot() +
  geom_sf(data = republika, fill = "antiquewhite") +
  geom_sf(data = lokality_brno, shape = 4, size = 4, 
          color = "steelblue", alpha = 0.25) +
  theme_light()
#  atribútom "shape" zmeníte vzhľad bodu, zoznam možností je tu: 
# https://ggplot2.tidyverse.org/articles/ggplot2-specs.html


### Odpoveď ---------------------------------------------------------------
paste("Z okolia 15 km od Brna pochádza", 
      nrow(lokality_brno), 
      "rádiokarbonových vzoriek.")



# Hillforts ---------------------------------------------------------------

# How many of these radiocarbon dates are from hillforts (Site_category_ENG)?

# vypíše počet jednotlivých hodnôt danej premmenej
table(lokality_brno$Site_category_ENG) 

# nebo pomocí filter
lokality_brno %>% 
  filter(Site_category_ENG == "hillfort") %>% 
  summarise(pocet = n())

### Odpoveď ---------------------------------------------------------------

paste("V okruhu 15 km od Brna je",
      nrow(filter(lokality_brno, Site_category_ENG == "hillfort")), 
      "rádiokarbonových vzoriek z výššiných hradísk (hillforts).")



# Mapa Českej republiky s Brnom -------------------------------------------

# Create map of the Czech republic with a point showing Brno.

ggplot() +
  geom_sf(data = republika, fill = "antiquewhite") +
  geom_sf(data = brno, shape = 18, size = 4, colour = "steelblue") +
  theme_light()


# Mapa rádiokarbonových vzoriek z jihomoravského kraja --------------------

# Create a map of all radiocarbon dated samples in Jihomoravský kraj.

head(kraje) # pomôže nám identifikovať ktorá premenná obsahuje názvy krajov

# vybranie polygonu jihomoravského kraja
kraj_jihomor <- kraje %>% 
  filter(NAZ_CZNUTS3 == "Jihomoravský kraj")

# prienik lokalít (vzoriek 14C) s polygonom kraja 
prunik_jihomor <- st_intersects(sf_lasoles, kraj_jihomor)

lokality_jihomor <- sf_lasoles %>% 
  filter(lengths(prunik_jihomor) > 0)

# mapka:
ggplot() +
  geom_sf(data = kraj_jihomor, fill = "antiquewhite", linetype = 2) +
  geom_sf(data = brno, shape = 3, size = 3) +
  geom_sf(data = lokality_jihomor, shape = 21, 
          size = 4, fill = "red", alpha = 0.2) +
  theme_light()

# typ línie môže byt upravený pomocou atribútu linetype, 
# pozri https://ggplot2.tidyverse.org/reference/aes_linetype_size_shape.html

# ak u bodov nastavíte pomocou  atribútu "aplha" čiastočnú priehladnosť, 
# môžete zjednodušene vizualizovať kde sa body prekrývajú 
# a v akej miere, takže máte niečo ako "hustotu lokalít"
# alpha = 1 - objekt je nepriehladný
# alpha = 0 - objekt je úplne priehladný
