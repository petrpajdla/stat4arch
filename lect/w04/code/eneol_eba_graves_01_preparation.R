## intro ----------------

library(tibble)
library(tidyverse)
library(here)


## table creation ----------------
df_graves_temp <- tribble(
  ~grave_number, ~dating,  ~sex,     ~artefact_type, ~artefact_count,

  # ---------- beaker (len en.zvo; 3 bohatí muži 2-3; 1 superbohatá žena 3; inak 1)
  900, "en.zvo", "male",   "beaker", 3,
  901, "en.zvo", "female", "beaker", 1,
  902, "en.zvo", "male",   "beaker", 1,
  903, "en.zvo", "female", "beaker", 1,
  904, "en.zvo", "male",   "beaker", 1,
  905, "en.zvo", "female", "beaker", 1,
  906, "en.zvo", "child",  "beaker", 1,
  907, "en.zvo", "male",   "beaker", 2,
  908, "en.zvo", "female", "beaker", 1,
  909, "en.zvo", "male",   "beaker", 1,
  910, "en.zvo", "female", "beaker", 1,
  911, "en.zvo", "male",   "beaker", 1,
  912, "en.zvo", "child",  "beaker", 1,
  913, "en.zvo", "female", "beaker", 1,
  914, "en.zvo", "male",   "beaker", 2,
  915, "en.zvo", "female", "beaker", 3,
  916, "en.zvo", "male",   "beaker", 1,
  917, "en.zvo", "female", "beaker", 1,
  918, "en.zvo", "child",  "beaker", 1,
  919, "en.zvo", "male",   "beaker", 1,
  920, "en.zvo", "female", "beaker", 1,
  921, "en.zvo", "male",   "beaker", 1,
  922, "en.zvo", "female", "beaker", 1,
  923, "en.zvo", "male",   "beaker", 1,
  924, "en.zvo", "child",  "beaker", 1,
  925, "en.zvo", "female", "beaker", 1,
  926, "en.zvo", "child",  "beaker", 1,

  # ---------- dartpoint (en.zvo + br.une; viac v en.zvo; špeciálni bohatí)
  # EN.ZVO – bohatí: 900, 907, 914 (muži) + 915 (žena) -> 5 ks
  900, "en.zvo", "male",   "dartpoint", 5,
  901, "en.zvo", "female", "dartpoint", 2,
  902, "en.zvo", "male",   "dartpoint", 2,
  903, "en.zvo", "female", "dartpoint", 2,
  904, "en.zvo", "male",   "dartpoint", 2,
  905, "en.zvo", "female", "dartpoint", 2,
  906, "en.zvo", "child",  "dartpoint", 1,
  907, "en.zvo", "male",   "dartpoint", 5,
  908, "en.zvo", "female", "dartpoint", 2,
  909, "en.zvo", "male",   "dartpoint", 2,
  910, "en.zvo", "female", "dartpoint", 2,
  911, "en.zvo", "male",   "dartpoint", 2,
  912, "en.zvo", "child",  "dartpoint", 1,
  913, "en.zvo", "female", "dartpoint", 2,
  914, "en.zvo", "male",   "dartpoint", 5,
  915, "en.zvo", "female", "dartpoint", 5,
  916, "en.zvo", "male",   "dartpoint", 2,
  917, "en.zvo", "female", "dartpoint", 2,
  918, "en.zvo", "child",  "dartpoint", 1,
  919, "en.zvo", "male",   "dartpoint", 2,
  920, "en.zvo", "female", "dartpoint", 2,
  921, "en.zvo", "male",   "dartpoint", 2,
  922, "en.zvo", "female", "dartpoint", 2,
  923, "en.zvo", "male",   "dartpoint", 2,
  924, "en.zvo", "child",  "dartpoint", 1,
  925, "en.zvo", "female", "dartpoint", 2,
  926, "en.zvo", "child",  "dartpoint", 1,

  # BR.UNE – 5 bohatých mužov s 4 ks: 927, 929, 934, 937, 945
  927, "br.une", "male",   "dartpoint", 4,
  928, "br.une", "female", "dartpoint", 1,
  929, "br.une", "male",   "dartpoint", 4,
  930, "br.une", "child",  "dartpoint", 1,
  931, "br.une", "female", "dartpoint", 1,
  932, "br.une", "male",   "dartpoint", 2,
  933, "br.une", "female", "dartpoint", 1,
  934, "br.une", "male",   "dartpoint", 4,
  935, "br.une", "female", "dartpoint", 1,
  936, "br.une", "child",  "dartpoint", 1,
  937, "br.une", "male",   "dartpoint", 4,
  938, "br.une", "female", "dartpoint", 1,
  939, "br.une", "male",   "dartpoint", 2,
  940, "br.une", "female", "dartpoint", 1,
  941, "br.une", "male",   "dartpoint", 2,
  942, "br.une", "child",  "dartpoint", 1,
  943, "br.une", "male",   "dartpoint", 2,
  944, "br.une", "female", "dartpoint", 1,
  945, "br.une", "male",   "dartpoint", 4,
  946, "br.une", "child",  "dartpoint", 1,
  947, "br.une", "male",   "dartpoint", 2,
  948, "br.une", "female", "dartpoint", 1,
  949, "br.une", "child",  "dartpoint", 1,

  # ---------- wristguard (každý en.zvo s dartpoint) -> 1 ks
  900, "en.zvo", "male",   "wristguard", 1,
  901, "en.zvo", "female", "wristguard", 1,
  902, "en.zvo", "male",   "wristguard", 1,
  903, "en.zvo", "female", "wristguard", 1,
  904, "en.zvo", "male",   "wristguard", 1,
  905, "en.zvo", "female", "wristguard", 1,
  906, "en.zvo", "child",  "wristguard", 1,
  907, "en.zvo", "male",   "wristguard", 1,
  908, "en.zvo", "female", "wristguard", 1,
  909, "en.zvo", "male",   "wristguard", 1,
  910, "en.zvo", "female", "wristguard", 1,
  911, "en.zvo", "male",   "wristguard", 1,
  912, "en.zvo", "child",  "wristguard", 1,
  913, "en.zvo", "female", "wristguard", 1,
  914, "en.zvo", "male",   "wristguard", 1,
  915, "en.zvo", "female", "wristguard", 1,
  916, "en.zvo", "male",   "wristguard", 1,
  917, "en.zvo", "female", "wristguard", 1,
  918, "en.zvo", "child",  "wristguard", 1,
  919, "en.zvo", "male",   "wristguard", 1,
  920, "en.zvo", "female", "wristguard", 1,
  921, "en.zvo", "male",   "wristguard", 1,
  922, "en.zvo", "female", "wristguard", 1,
  923, "en.zvo", "male",   "wristguard", 1,
  924, "en.zvo", "child",  "wristguard", 1,
  925, "en.zvo", "female", "wristguard", 1,
  926, "en.zvo", "child",  "wristguard", 1,

  # ---------- wristguard (br.une, menej často, len hroby s hrotmi)
  927, "br.une", "male",   "wristguard", 1,
  929, "br.une", "male",   "wristguard", 1,
  932, "br.une", "male",   "wristguard", 1,
  934, "br.une", "male",   "wristguard", 1,
  937, "br.une", "male",   "wristguard", 1,
  939, "br.une", "male",   "wristguard", 1,
  941, "br.une", "male",   "wristguard", 1,
  943, "br.une", "male",   "wristguard", 1,
  945, "br.une", "male",   "wristguard", 1,
  947, "br.une", "male",   "wristguard", 1,

  # ---------- dagger (bohaté en.zvo: 900, 907, 914, 915) -> 1 ks
  900, "en.zvo", "male",   "dagger", 1,
  907, "en.zvo", "male",   "dagger", 1,
  914, "en.zvo", "male",   "dagger", 1,
  915, "en.zvo", "female", "dagger", 1,

  # ---------- axe (br.une: bohatí muži 2–3 ks; + ďalších 5 mužov 1 ks)
  927, "br.une", "male",   "axe", 3,
  929, "br.une", "male",   "axe", 2,
  934, "br.une", "male",   "axe", 3,
  937, "br.une", "male",   "axe", 2,
  945, "br.une", "male",   "axe", 3,
  932, "br.une", "male",   "axe", 1,
  939, "br.une", "male",   "axe", 1,
  941, "br.une", "male",   "axe", 1,
  943, "br.une", "male",   "axe", 1,
  947, "br.une", "male",   "axe", 1,

  # ---------- axe (NOVÉ: bohatí muži en.zvo po 1 ks)
  900, "en.zvo", "male",   "axe", 1,
  907, "en.zvo", "male",   "axe", 1,
  914, "en.zvo", "male",   "axe", 1,

  # ---------- bowl (všetci dospelí v oboch datovaniach) -> 1 ks
  # en.zvo adults (bez 906, 912, 918, 924, 926)
  900, "en.zvo", "male",   "bowl", 1,
  901, "en.zvo", "female", "bowl", 1,
  902, "en.zvo", "male",   "bowl", 1,
  903, "en.zvo", "female", "bowl", 1,
  904, "en.zvo", "male",   "bowl", 1,
  905, "en.zvo", "female", "bowl", 1,
  907, "en.zvo", "male",   "bowl", 1,
  908, "en.zvo", "female", "bowl", 1,
  909, "en.zvo", "male",   "bowl", 1,
  910, "en.zvo", "female", "bowl", 1,
  911, "en.zvo", "male",   "bowl", 1,
  913, "en.zvo", "female", "bowl", 1,
  914, "en.zvo", "male",   "bowl", 1,
  915, "en.zvo", "female", "bowl", 1,
  916, "en.zvo", "male",   "bowl", 1,
  917, "en.zvo", "female", "bowl", 1,
  919, "en.zvo", "male",   "bowl", 1,
  920, "en.zvo", "female", "bowl", 2,
  921, "en.zvo", "male",   "bowl", 1,
  922, "en.zvo", "female", "bowl", 1,
  923, "en.zvo", "male",   "bowl", 1,
  925, "en.zvo", "female", "bowl", 1,

  # br.une adults (bez 930, 936, 942, 946, 949)
  927, "br.une", "male",   "bowl", 1,
  928, "br.une", "female", "bowl", 1,
  929, "br.une", "male",   "bowl", 1,
  931, "br.une", "female", "bowl", 1,
  932, "br.une", "male",   "bowl", 1,
  933, "br.une", "female", "bowl", 1,
  934, "br.une", "male",   "bowl", 2,
  935, "br.une", "female", "bowl", 1,
  937, "br.une", "male",   "bowl", 1,
  938, "br.une", "female", "bowl", 1,
  939, "br.une", "male",   "bowl", 1,
  940, "br.une", "female", "bowl", 1,
  941, "br.une", "male",   "bowl", 1,
  943, "br.une", "male",   "bowl", 1,
  944, "br.une", "female", "bowl", 2,
  945, "br.une", "male",   "bowl", 1,
  947, "br.une", "male",   "bowl", 1,
  948, "br.une", "female", "bowl", 1,

  # ---------- beam (len en.zvo ženy; väčšina 1–5; superbohatá #915 má 10; + 916 muž má 5)
  901, "en.zvo", "female", "beam", 2,
  903, "en.zvo", "female", "beam", 2,
  905, "en.zvo", "female", "beam", 3,
  908, "en.zvo", "female", "beam", 1,
  910, "en.zvo", "female", "beam", 4,
  913, "en.zvo", "female", "beam", 2,
  915, "en.zvo", "female", "beam", 8,
  917, "en.zvo", "female", "beam", 3,
  920, "en.zvo", "female", "beam", 2,
  922, "en.zvo", "female", "beam", 3,
  925, "en.zvo", "female", "beam", 2,
  916, "en.zvo", "male",   "beam",  3,

  # beam_amber – po 2 ks do 10 náhodných br.une hrobov (bez ohľadu na pohlavie)
  927, "br.une", "male",   "beam_amber",      1,
  928, "br.une", "female", "beam_amber",      2,
  931, "br.une", "female", "beam_amber",      1,
  933, "br.une", "female", "beam_amber",      2,
  935, "br.une", "female", "beam_amber",      2,
  938, "br.une", "female", "beam_amber",      3,
  939, "br.une", "male",   "beam_amber",      2,
  941, "br.une", "male",   "beam_amber",      2,
  944, "br.une", "female", "beam_amber",      2,
  948, "br.une", "female", "beam_amber",      1,

  # ---------- koflik (len br.une; bohatí 3 ks; ostatní dospelí 1 ks)
  927, "br.une", "male",   "koflik", 3,
  929, "br.une", "male",   "koflik", 3,
  934, "br.une", "male",   "koflik", 3,
  937, "br.une", "male",   "koflik", 3,
  945, "br.une", "male",   "koflik", 3,
  928, "br.une", "female", "koflik", 1,
  931, "br.une", "female", "koflik", 1,
  932, "br.une", "male",   "koflik", 1,
  933, "br.une", "female", "koflik", 1,
  935, "br.une", "female", "koflik", 1,
  938, "br.une", "female", "koflik", 1,
  939, "br.une", "male",   "koflik", 1,
  940, "br.une", "female", "koflik", 1,
  941, "br.une", "male",   "koflik", 1,
  943, "br.une", "male",   "koflik", 1,
  944, "br.une", "female", "koflik", 1,
  947, "br.une", "male",   "koflik", 1,
  948, "br.une", "female", "koflik", 1,

  # bracelet_bronze – 4 najbohatšie br.une:
  # prvé 2 (top) majú 2 ks, ďalšie 2 majú 1 ks
  927, "br.une", "male",   "bracelet_bronze",   2,   # top
  934, "br.une", "male",   "bracelet_bronze",   2,   # top
  945, "br.une", "male",   "bracelet_bronze",   1,
  937, "br.une", "male",   "bracelet_bronze",   1,
  940, "br.une", "female", "bracelet_bronze", 2,
  938, "br.une", "female", "bracelet_bronze", 1,
  # ---------- needle (NOVÉ: len br.une ženy – nahrádza starý blok)
  928, "br.une", "female", "needle", 2,
  931, "br.une", "female", "needle", 1,
  933, "br.une", "female", "needle", 1,
  935, "br.une", "female", "needle", 1,
  938, "br.une", "female", "needle", 1,
  940, "br.une", "female", "needle", 2,
  944, "br.une", "female", "needle", 1,
  948, "br.une", "female", "needle", 1,
  915, "en.zvo", "female", "needle", 1,
  901, "en.zvo", "female", "needle", 1,   # náhodne vybraná en.zvo ♀
  939, "br.une", "male",   "needle", 2,
  941, "br.une", "male",   "needle", 1,

  # ---------- spear (len najbohatší br.une – #927) -> 1 ks
  927, "br.une", "male",   "spear", 1
)

## table transformations ------------

df_graves <- df_graves_temp |>
  mutate(
    artefact_material = case_when(
      artefact_type == "axe" & dating == "br.une" ~ "bronze",
      artefact_type == "axe" & dating == "en.zvo" ~ "copper",
      artefact_type == "beaker" ~ "ceramics",
      artefact_type == "beam" ~ "bone",
      artefact_type == "beam_amber" ~ "amber",
      artefact_type == "bowl" ~ "ceramics",
      artefact_type == "bracelet_bronze" ~ "bronze",
      artefact_type == "dagger" ~ "copper",
      artefact_type == "dartpoint" ~ "lithics",
      artefact_type == "koflik" ~ "ceramics",
      artefact_type == "needle" & dating == "br.une" ~ "bronze",
      artefact_type == "needle" & dating == "en.zvo" ~ "bone",
      artefact_type == "spear" ~ "bronze",
      artefact_type == "wristguard" ~ "lithics"
    )
  )

df_graves |>
  count(artefact_type, artefact_material)
## export------------
write_csv(df_graves, here("lect/w04/data/eneol_bronze_burials.csv"))






