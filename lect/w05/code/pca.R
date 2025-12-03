library(here)
library(tidyverse)
library(readxl)

## Data ---------
df_composition <- read_excel(here("lect/w05/data/bronze_composition.xlsx"))
df_artefacts <- read.csv(here("lect/w05/data/artefacts.csv"))

## Transformation

df_join <- df_composition |> 
  left_join(df_artefacts, by = join_by(artefact_id))

## new variable ------

unique(df_join$artefact_type)

list_weapons <- c("Arrowhead", "Axe", "Dagger", "Spearhead", "Sword")
list_jewelry <- c("Bead", "Belt fitting", "Bracelet",
                    "Brooch","Buckle", "Needle","Pin", "Ring")


df_ready <- df_join |> 
  mutate(artefact_category = case_when(
    artefact_type %in% list_weapons ~ "weapon",
    artefact_type %in% list_jewelry ~ "jewelry",
    .default = "other"
  )
  )


## PCA calculation --------



pca_result <- df_ready |> 
  select(Sn:Cu) |> 
  as.matrix() |> 
  prcomp(scale. = TRUE) # `scale.=TRUE` by malo zabezpečiť že sa PCA bude počítať z korelačnej matice, čo by malo sedieť na tento typ dát (podľa chatGPT)



## observing results -------
pca_result
str(pca_result)
summary(pca_result)

## values
variances_all <- pca_result$sdev^2 / sum(pca_result$sdev^2)


variability_pc1 <- round(variances_all[1]*100, 2)
variability_pc2 <- round(variances_all[2]*100, 2)

## Tables with coordinates--------

table_artefacts  <- pca_result$x |> 
as_tibble() |> 
mutate(
    category = df_ready$artefact_category
    )


table_elements <- pca_result$rotation %>%
  as_tibble(rownames = "element") %>%
  select(element, PC1, PC2)

## ggplot -------------

ggplot()+
  geom_point(data = table_artefacts, aes(x = PC1, y = PC2, color = category))+
  geom_point(data = table_elements, aes(x = PC1, y = PC2), shape = 4) +
  geom_text(data = table_elements, aes(x = PC1, y = PC2, label = element),
            vjust = -0.5)+
  labs(
    x = paste0("PC1 (", variability_pc1, " % of variability)" ),
    y = paste0("PC2 (", variability_pc2, " % of variability)" )
  )+
  theme_light()

