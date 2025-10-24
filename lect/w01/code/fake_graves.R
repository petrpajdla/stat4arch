
# AES_707: Statistics seminar for archaeology students
## This script is designed to create a fictional cemetery database for teaching purposes.
## date: 2025-09-24
## author: Peter Tkáč
# ========================================== #


## Vectors ---------------

grave_number <- 800:819

dating <- c(
  "ne.lin","ne.lin","en.zvo","en.zvo","en.snu","br.une","br.une","br.une","la.a","rstred",
  "ne.lin","br.une","en.zvo","en.snu","la.a","br.une","rstred","ne.lin","en.zvo","br.une"
)

sex <- c(
  "male","male","male","female","male","female","female","female","male","female",
  "male","female","male","female","male","male","female","female","female","male"
)

age <- c(
  "31-40","21-30","<11","31-40",">50","31-40",">50","41-50","31-40","<11",
  "<11","31-40","21-30",">50","41-50","31-40","21-30","31-40","<11",">50"
)


pottery <- c(
  3,4,3,2,5,4,5,3,2,1,
  1,6,4,7,3,5,2,5,1,6
)

bronze <- c(
  0,0,0,0,0,5,1,2,0,0,
  0,3,0,0,0,2,0,0,0,4
)

stone_chipped <- c(
  1,1,0,0,2,1,0,0,0,0,
  0,1,0,2,0,2,0,1,0,1
)

stone_polished <- c(
  2,1,0,0,1,0,0,0,0,0,
  0,0,0,1,0,0,0,1,0,0
)


grave_length <- c(
  210,160,180,250,300,200,225,250,150,100,
  90,230,200,260,210,240,180,220,100,270
)

grave_depth <- c(
  50, 40, 70,200,250,100, 80, 70, 40, 30,
  25,120, 90,180,100,150, 80,120, 30,200
)


## Creating dataframe --------------


df_grave <- as.data.frame(cbind(grave_number, dating, sex, age, pottery, bronze, stone_chipped, stone_polished, grave_length, grave_depth))

## Correcting values -------------

df_grave$pottery <- as.numeric(df_grave$pottery)
df_grave$bronze <- as.numeric(df_grave$bronze)
df_grave$stone_chipped <- as.numeric(df_grave$stone_chipped)
df_grave$stone_polished <- as.numeric(df_grave$stone_polished)
df_grave$grave_length <- as.numeric(df_grave$grave_length)
df_grave$grave_depth <- as.numeric(df_grave$grave_depth)

## Observing ------------
df_grave

str(df_grave)

## Continue here with the exercises: ------------

# df_grave %>% write_csv(here::here("lect/w01/data/fake_graves.csv"))
