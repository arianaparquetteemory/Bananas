#load data
library(pacman)
p_load(here, readxl, janitor, dplyr, table1)

here::i_am("cleandata/cleandata.R")
bananas <- read_xlsx("raw_data/bananaindex.xlsx")
janitor::clean_names(bananas)
#create milk type dataset
milk <- bananas %>%
  filter(entity %in% c("Almond milk", 
                       "Soy milk", 
                       "Oat milk", 
                       "Coconut milk", 
                       "Cow milk")) %>% 
  mutate(milk_type = case_when(
    entity == "Almond milk" ~ "plant milk",
    entity == "Soy milk" ~ "plant milk",
    entity == "Oat milk" ~ "plant milk",
    entity == "Coconut milk" ~ "plant milk",
    entity == "Cow milk" ~ "cow's milk")) 
milk$bananas_equivalent <- milk$`Bananas index (kg)`*7


label(milk$emissions_kg)       <- "Emissions"
label(milk$emissions_1000kcal)       <- "Emissions"
label(milk$emissions_100g_protein)     <- "Emissions"
label(milk$emissions_100g_fat) <- "Emissions"
label(milk$land_use_kg) <- "Land Use"
label(milk$land_use_1000kcal) <- "Land Use"
label(milk$`Land use per 100 grams of protein`) <- "Land Use"
label(milk$`Land use per 100 grams of fat`) <- "Land Use"
label(milk$`Bananas index (kg)`) <- "Banana Equivalent in Kg"
label(milk$`Bananas index (1000 kcalories)`) <- "Banana Equivalent in Kcals"
label(milk$bananas_equivalent)<- " Banana Equivalent in Bananas "

units(milk$emissions_kg)       <- "Per kg"
units(milk$emissions_1000kcal) <- "Per 1000 Kcals"
units(milk$emissions_100g_protein)     <- "Per 100 grams Protein"
units(milk$emissions_100g_fat) <- "Per 100 grams Fat"
units(milk$land_use_kg) <- "Per kg"
units(milk$land_use_1000kcal) <- "Per 1000 kcals"
units(milk$`Land use per 100 grams of protein`) <- "Per 100 grams Protein"
units(milk$`Land use per 100 grams of fat`) <- "Per 100 grams Fat"
units(milk$bananas_equivalent) <- "Bananas"

caption  <- "Environmental Implications of Milk and Alternative Milks in comparison to Bananas"

table1(~ emissions_kg + emissions_1000kcal + emissions_100g_protein + emissions_100g_fat +
         land_use_kg + land_use_1000kcal + milk$`Land use per 100 grams of protein` + 
         milk$`Land use per 100 grams of protein`+ milk$bananas_equivalent| milk_type, data=milk,
       overall=c(left="Total"), caption=caption)
