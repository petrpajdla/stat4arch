# Load necessary libraries
library(dplyr)
library(readr)

# Set seed for reproducibility
set.seed(42)

# --------------------------------------------------
# Step 1: Generate Reference Data
# --------------------------------------------------

# Reference data: artefact types
artefact_types <- c(
  "Sword", "Dagger", "Axe", "Spearhead", "Arrowhead",
  "Brooch", "Belt fitting", "Buckle", "Ring", "Bracelet",
  "Bead", "Needle", "Pin",
  "Pottery sherd", "Quern stone", "Whetstone"
)
artefact_types_df <- data.frame(artefact_type = artefact_types)
# write_csv(artefact_types_df, "artefact_types.csv")

# Reference data: materials
materials <- c(
  "Bronze", "Copper", "Silver", "Gold",
  "Bone", "Antler", "Ceramic", "Stone"
)
materials_df <- data.frame(material = materials)
# write_csv(materials_df, "materials.csv")

# --------------------------------------------------
# Step 2: Generate Graves Data
# --------------------------------------------------

# Number of graves
n_graves <- sample(200:280, 1)

# Generate grave IDs
grave_ids <- sprintf("G-%03d", 1:n_graves)

# Burial types with realistic distribution
burial_types <- c(rep("inhumation", 40), rep("cremation", 20), rep("missing", 10))
burial_type <- sample(burial_types, n_graves, replace = TRUE)

# Mound presence (not all graves have mounds)
mound_present <- sample(c(TRUE, FALSE), n_graves, replace = TRUE, prob = c(0.28, 0.72))

# Mound diameter (only if mound present)
mound_diameter_m <- ifelse(mound_present,
                           round(rnorm(n_graves, mean = 5, sd = 1.5), 1),
                           NA_real_)

# Grave orientation (degrees)
grave_orientation <- ifelse(burial_type == "inhumation", round(runif(n_graves, 0, 360), 1), NA)

# Grave depth (meters)
grave_depth_m <- ifelse(mound_present,
                        round(runif(n_graves, 2.4, 2.5), 2),
                        round(runif(n_graves, 1.2, 2.5), 2))

# Disturbance types (some graves disturbed)
disturbance_type <- sample(c(NA, "Animal", "Root", "Plough", "Looting", "Other"), n_graves, replace = TRUE, prob = c(0.7, 0.2, 0.05, 0.1, 0.05, 0.05))

# Age categories
age_categories <- c(rep("infant", 5), rep("child", 10), rep("adolescent", 10), rep("adult", 60), rep("elderly", 15))
skeleton_age_category <- ifelse(burial_type == "inhumation", sample(age_categories, n_graves, replace = TRUE), NA)

# Sex estimation (with NAs for infants/children)
sex_probs <- c("male" = 0.45, "female" = 0.45, "NA" = 0.1)
skeleton_sex <- ifelse(
  skeleton_age_category %in% c("infant", "child") | burial_type == "cremation",
  NA_character_,
  sample(c("male", "female", NA), n_graves, replace = TRUE, prob = c(0.45, 0.45, 0.1))
)

# Estimated height (cm) – only for adults/elderly with some NAs
height_adult <- round(rnorm(n_graves, mean = 165, sd = 10), 1)
estimated_height_cm <- ifelse(
  skeleton_age_category %in% c("adult", "elderly"),
  ifelse(runif(n_graves) < 0.85, height_adult, NA_real_),
  NA_real_
)

# Create graves dataframe
graves <- data.frame(
  grave_id = grave_ids,
  burial = burial_type,
  mound_present = mound_present,
  mound_diameter_m = mound_diameter_m,
  grave_orientation = grave_orientation,
  grave_depth_m = grave_depth_m,
  age_category = skeleton_age_category,
  sex = skeleton_sex,
  estimated_height_cm = estimated_height_cm,
  disturbance_type = disturbance_type,
  stringsAsFactors = FALSE
)

# ## Insert ~8 % strategic NAs (skip primary key)
# na_cols_grave <- c("burial_type","mound_present","grave_orientation",
#                    "grave_depth_m", "age_category", "sex", "estimated_height_cm")
# for (col in na_cols_grave) {
#   n_na <- round(0.04 * n_graves)
#   graves[[col]][sample(1:n_graves, n_na)] <- NA
# }



# # --------------------------------------------------
# # Step 3: Generate Bodies Data
# # --------------------------------------------------
#
# # Number of bodies
# n_bodies <- n_graves - 10
#
# # Generate body IDs
# body_ids <- sprintf("B-%02d", 1:n_bodies)
#
# # Assign each body to a grave (some graves may have multiple bodies)
# body_grave_ids <- sample(grave_ids, n_bodies, replace = TRUE)
#
# # Skeleton presence (almost all present)
# skeleton_present <- sample(c(TRUE, FALSE), n_bodies, replace = TRUE, prob = c(0.95, 0.05))
#
# # Age categories
# age_categories <- c(rep("infant", 5), rep("child", 10), rep("adolescent", 10), rep("adult", 60), rep("elderly", 15))
# skeleton_age_category <- sample(age_categories, n_bodies, replace = TRUE)
#
# # Sex estimation (with NAs for infants/children)
# sex_probs <- c("male" = 0.45, "female" = 0.45, "NA" = 0.1)
# skeleton_sex <- ifelse(
#   skeleton_age_category %in% c("infant", "child"),
#   NA_character_,
#   sample(c("male", "female", NA), n_bodies, replace = TRUE, prob = c(0.45, 0.45, 0.1))
# )
#
# # Estimated height (cm) – only for adults/elderly with some NAs
# height_adult <- round(rnorm(n_bodies, mean = 165, sd = 10), 1)
# estimated_height_cm <- ifelse(
#   skeleton_age_category %in% c("adult", "elderly"),
#   ifelse(runif(n_bodies) < 0.85, height_adult, NA_real_),
#   NA_real_
# )
#
# # Pathologies (some individuals have pathologies)
# pathologies <- c(
#   NA, "Arthritis", "Trauma", "Dental wear", "Infection",
#   "Fracture healing"
# )
# pathologies_col <- sample(pathologies, n_bodies, replace = TRUE, prob = c(0.6, rep(0.05, 5)))
#
# # Create bodies dataframe
# bodies <- data.frame(
#   burial_id = body_ids,
#   grave_id = body_grave_ids,
#   burial_present = skeleton_present,
#   age_category = skeleton_age_category,
#   sex = skeleton_sex,
#   estimated_height_cm = estimated_height_cm,
#   pathologies = pathologies_col,
#   stringsAsFactors = FALSE
# )



# --------------------------------------------------
# Step 4: Generate Artefacts Data
# --------------------------------------------------

# Number of artefacts
n_artefacts <- sample(420:680, 1)

# Generate artefact IDs
artefact_ids <- sprintf("A-%04d", 1:n_artefacts)

# Assign artefacts to graves
assigned_grave_ids <- sample(c(grave_ids, rep(NA, n_artefacts * 0.04)), n_artefacts, replace = TRUE)[1:n_artefacts]

# Sample artefact types and materials from reference data
artefact_type_sample <- sample(artefact_types, n_artefacts, replace = TRUE)
material_sample <- sample(materials, n_artefacts, replace = TRUE)

# Preservation states with realistic distribution
preservation_states <- c(
  rep("excellent", 5),
  rep("good", 25),
  rep("fair", 40),
  rep("poor", 20)
  # rep("fragmentary", 10)
)
preservation_state <- factor(sample(preservation_states, n_artefacts, replace = TRUE),
                             levels = c("excellent", "good", "fair", "poor"))

# Weight in grams (depends on material)
weight_g <- ifelse(
  material_sample == "Bronze", round(runif(n_artefacts, 50, 500), 1),
  ifelse(material_sample == "Iron", round(runif(n_artefacts, 30, 400), 1),
         ifelse(material_sample == "Ceramic", round(runif(n_artefacts, 10, 300), 1),
                ifelse(material_sample == "Bone", round(runif(n_artefacts, 1, 50), 1),
                       round(runif(n_artefacts, 1, 100), 1))))
)

# Length in mm (depends on artefact type)
length_mm <- ifelse(
  artefact_type_sample %in% c("Sword", "Spearhead"), round(runif(n_artefacts, 100, 800), 1),
  ifelse(artefact_type_sample %in% c("Dagger", "Axe"), round(runif(n_artefacts, 50, 300), 1),
         ifelse(artefact_type_sample %in% c("Bead", "Button"), round(runif(n_artefacts, 2, 20), 1),
                round(runif(n_artefacts, 10, 100), 1)))
)

# Position relative to body (only for artefacts with assigned grave)
position_relative_to_body <- ifelse(
  !is.na(assigned_grave_ids),
  sample(c(
    "by head", "by feet", "on chest", "on pelvis", "left side", "right side",
    "near arm", "under head", "beside body", NA
  ), n_artefacts, replace = TRUE, prob = c(rep(0.1, 9), 0.1)),
  NA_character_
)

# Notes with occasional curator observations
# notes_options <- c(
#   NA, "Possible ritual deposition", "Corrosion obscures decoration",
#   "Incomplete due to breakage", "Unusually heavy for type",
#   "Associated with child burial", "High-status item", "Tool wear visible"
# )
# notes <- sample(notes_options, n_artefacts, replace = TRUE, prob = c(0.7, rep(0.04, 7)))

# Create artefacts dataframe
artefacts <- data.frame(
  artefact_id = artefact_ids,
  grave_id = assigned_grave_ids,
  artefact_type = artefact_type_sample,
  material = material_sample,
  preservation_state = preservation_state,
  weight_g = weight_g,
  length_mm = length_mm,
  position_relative_to_body = position_relative_to_body,
  # notes = notes,
  stringsAsFactors = FALSE
)

# --------------------------------------------------
# Step 4.1: Meaningfully assign materials to artefact types
# --------------------------------------------------

# Create a lookup table for plausible material-by-artefact type combinations
material_assignment <- list(
  "Sword" = c("Bronze", "Copper"),
  "Dagger" = c("Bronze", "Copper"),
  "Axe" = c("Bronze", "Stone"),
  "Spearhead" = c("Bronze", "Copper"),
  "Arrowhead" = c("Bronze", "Stone"),
  "Brooch" = c("Bronze", "Silver", "Gold", "Copper"),
  "Belt fitting" = c("Bronze", "Copper"),
  "Buckle" = c("Bronze", "Copper"),
  "Ring" = c("Bronze", "Silver", "Gold", "Copper"),
  "Bracelet" = c("Bronze", "Silver", "Gold", "Copper"),
  "Bead" = c("Bronze", "Glass", "Bone", "Stone", "Ceramic"),
  "Button" = c("Bronze", "Bone", "Ceramic"),
  "Needle" = c("Bronze", "Bone"),
  "Pin" = c("Bronze", "Copper"),
  "Scabbard fragment" = c("Wood", "Bone", "Leather"),
  "Pottery sherd" = c("Ceramic"),
  "Quern stone" = c("Stone"),
  "Whetstone" = c("Stone"),
  "Lamp" = c("Ceramic", "Bronze"),
  "Amulet" = c("Bronze", "Stone", "Glass", "Bone")
)

# Function to assign material based on artefact type
assign_material <- function(artefact_type) {
  if (artefact_type %in% names(material_assignment)) {
    # 85% chance to get a plausible material, 15% chance for any material (for variety/finds misidentified)
    if (runif(1) < 0.96) {
      sample(material_assignment[[artefact_type]], 1)
    } else {
      sample(materials, 1)  # Occasionally assign implausible but possible materials
    }
  } else {
    sample(materials, 1)  # Fallback for any unlisted types
  }
}

# Apply meaningful material assignment
artefacts$material <- sapply(artefacts$artefact_type, assign_material)

# --------------------------------------------------
# Step 4.2: Recalculate weight based on meaningful material assignments
# --------------------------------------------------

# Function to generate realistic weight based on material and artefact type
generate_weight <- function(artefact_type, material) {
  # Base weight ranges by material
  base_weight <- switch(material,
                        "Bronze" = runif(1, 20, 400),
                        # "Iron" = runif(1, 15, 350),
                        "Copper" = runif(1, 10, 200),
                        "Silver" = runif(1, 5, 100),
                        "Gold" = runif(1, 2, 50),
                        "Glass" = runif(1, 1, 30),
                        "Bone" = runif(1, 1, 40),
                        "Antler" = runif(1, 5, 80),
                        "Wood" = runif(1, 2, 60),
                        "Ceramic" = runif(1, 5, 200),
                        "Flint" = runif(1, 1, 50),
                        "Stone" = runif(1, 10, 150),
                        runif(1, 1, 100)  # fallback
  )

  # Adjust weight based on artefact type
  adjusted_weight <- switch(artefact_type,
                            "Sword" = runif(1, 100, 800),
                            "Dagger" = runif(1, 30, 300),
                            "Axe" = runif(1, 50, 600),
                            "Spearhead" = runif(1, 20, 200),
                            "Arrowhead" = runif(1, 1, 20),
                            "Brooch" = runif(1, 2, 30),
                            "Belt fitting" = runif(1, 5, 50),
                            "Buckle" = runif(1, 10, 80),
                            "Ring" = runif(1, 1, 20),
                            "Bracelet" = runif(1, 10, 100),
                            "Bead" = runif(1, 0.5, 10),
                            "Button" = runif(1, 1, 15),
                            "Needle" = runif(1, 1, 10),
                            "Pin" = runif(1, 1, 15),
                            "Scabbard fragment" = runif(1, 20, 150),
                            "Pottery sherd" = runif(1, 5, 100),
                            "Quern stone" = runif(1, 500, 3000),
                            "Whetstone" = runif(1, 50, 400),
                            "Lamp" = runif(1, 20, 200),
                            "Amulet" = runif(1, 1, 25),
                            base_weight  # fallback
  )

  return(round(adjusted_weight, 1))
}

# Apply meaningful weight assignment
artefacts$weight_g <- mapply(generate_weight, artefacts$artefact_type, artefacts$material)

# --------------------------------------------------
# Step 4.3: Recalculate length based on artefact type (more meaningfully)
# --------------------------------------------------

# Function to generate realistic length based on artefact type
generate_length <- function(artefact_type) {
  length_mm <- switch(artefact_type,
                      "Sword" = runif(1, 200, 800),
                      "Dagger" = runif(1, 80, 350),
                      "Axe" = runif(1, 100, 500),
                      "Spearhead" = runif(1, 50, 300),
                      "Arrowhead" = runif(1, 10, 80),
                      "Brooch" = runif(1, 10, 60),
                      "Belt fitting" = runif(1, 15, 80),
                      "Buckle" = runif(1, 20, 100),
                      "Ring" = runif(1, 15, 25),
                      "Bracelet" = runif(1, 50, 120),
                      "Bead" = runif(1, 2, 20),
                      "Button" = runif(1, 5, 25),
                      "Needle" = runif(1, 20, 80),
                      "Pin" = runif(1, 30, 100),
                      "Scabbard fragment" = runif(1, 100, 600),
                      "Pottery sherd" = runif(1, 20, 150),
                      "Quern stone" = runif(1, 100, 400),
                      "Whetstone" = runif(1, 50, 200),
                      "Lamp" = runif(1, 30, 150),
                      "Amulet" = runif(1, 5, 40),
                      runif(1, 10, 100)  # fallback
  )

  return(round(length_mm, 1))
}

# Apply meaningful length assignment
artefacts$length_mm <- sapply(artefacts$artefact_type, generate_length)

# --------------------------------------------------
## Step 4.4: Introduce realistic human data entry errors and inconsistencies ----
# --------------------------------------------------

# Introduce inconsistent NA representations
artefacts$position_relative_to_body <- ifelse(
  is.na(artefacts$position_relative_to_body) & runif(nrow(artefacts)) < 0.3,
  sample(c("missing", "not recorded", "N/A", "", "unknown"),
         sum(is.na(artefacts$position_relative_to_body) & runif(nrow(artefacts)) < 0.3),
         replace = TRUE),
  artefacts$position_relative_to_body
)

# Introduce inconsistent preservation state representations
# preservation_replacements <- data.frame(
#   from = c("excellent", "good", "fair", "poor", "fragmentary"),
#   to = list(
#     c("excellent", "Excellent", "exc", "excl", "perfect"),
#     c("good", "Good", "gd", "acceptable"),
#     c("fair", "Fair", "fr", "moderate"),
#     c("poor", "Poor", "pr", "bad"),
#     c("fragmentary", "Fragmentary", "frag", "incomplete", "broken")
#   ),
#   stringsAsFactors = FALSE
# )

# Randomly replace some preservation states with alternative representations
# for(i in 1:nrow(artefacts)) {
#   if(runif(1) < 0.15) {  # 15% chance of alternative representation
#     current_state <- as.character(artefacts$preservation_state[i])
#     matching_row <- which(preservation_replacements$from == current_state)
#     if(length(matching_row) > 0) {
#       artefacts$preservation_state[i] <- sample(preservation_replacements$to[[matching_row]], 1)
#     }
#   }
# }

# Introduce some weight/length entries as character with units or extra spaces
if(runif(1) < 0.1) {  # 10% chance for weight unit inclusion
  sample_rows <- sample(which(!is.na(artefacts$weight_g)),
                        min(5, sum(!is.na(artefacts$weight_g))),
                        replace = FALSE)
  artefacts$weight_g[sample_rows] <- paste0(artefacts$weight_g[sample_rows],
                                            sample(c("g", " g"), 5, replace = TRUE))
}

if(runif(1) < 0.1) {  # 10% chance for length unit inclusion
  sample_rows <- sample(which(!is.na(artefacts$length_mm)),
                        min(5, sum(!is.na(artefacts$length_mm))),
                        replace = FALSE)
  artefacts$length_mm[sample_rows] <- paste0(artefacts$length_mm[sample_rows],
                                             sample(c("mm", " mm"), 5, replace = TRUE))
}

# # Introduce some trailing/leading spaces in character fields
# artefacts$artefact_type <- ifelse(runif(nrow(artefacts)) < 0.05,
#                                   paste0(" ", artefacts$artefact_type, " "),
#                                   artefacts$artefact_type)
#
# artefacts$material <- ifelse(runif(nrow(artefacts)) < 0.05,
#                              paste0(" ", artefacts$material),
#                              artefacts$material)

# # Introduce inconsistent case in text fields
# artefacts$notes <- ifelse(!is.na(artefacts$notes) & runif(nrow(artefacts)) < 0.2,
#                           sample(c(
#                             toupper, tolower, function(x) paste0(toupper(substr(x,1,1)), tolower(substr(x,2,nchar(x))))
#                           ), sum(!is.na(artefacts$notes) & runif(nrow(artefacts)) < 0.2), replace = TRUE) %>%
#                             sapply(function(f) f(artefacts$notes[!is.na(artefacts$notes) & runif(nrow(artefacts)) < 0.2])),
#                           artefacts$notes)

# Introduce some typos in common terms (simple substitution)
# typo_introducer <- function(text) {
#   if(is.na(text) || text == "" || is.null(text)) return(text)
#
#   # Simple character substitutions that mimic typing errors
#   if(runif(1) < 0.1) {
#     text <- gsub("head", sample(c("head", "hed", "haed"), 1), text)
#   }
#   if(runif(1) < 0.1) {
#     text <- gsub("by", sample(c("by", "bi", "bby"), 1), text)
#   }
#   if(runif(1) < 0.1) {
#     text <- gsub("chest", sample(c("chest", "chset", "cest"), 1), text)
#   }
#   return(text)
# }

# artefacts$position_relative_to_body <- sapply(artefacts$position_relative_to_body, typo_introducer, simplify = TRUE)

# Introduce some inconsistent grave_id formats (extra spaces, different case)
# artefacts$grave_id <- ifelse(!is.na(artefacts$grave_id) & runif(nrow(artefacts)) < 0.05,
#                              paste0(" ", artefacts$grave_id, " "),
#                              artefacts$grave_id)
#
# artefacts$grave_id <- ifelse(!is.na(artefacts$grave_id) & runif(nrow(artefacts)) < 0.03,
#                              tolower(artefacts$grave_id),
#                              artefacts$grave_id)

# Introduce occasional duplicate artefact IDs (human error)
# if(runif(1) < 0.02) {  # 2% chance of duplicates
#   if(nrow(artefacts) > 5) {
#     duplicate_indices <- sample(1:nrow(artefacts), 2)
#     artefacts$artefact_id[duplicate_indices[2]] <- artefacts$artefact_id[duplicate_indices[1]]
#   }
# }

# export ------------------------------------------------------------------


# write_csv(bodies, here::here("lect/w03/data/bodies.csv"))
write_csv(graves, here::here("lect/w03/data/graves.csv"))
write_csv(artefacts, here::here("lect/w03/data/artefacts.csv"))
