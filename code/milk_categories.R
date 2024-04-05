#create milk type dataset
milk <- bananaindex %>%
  filter(entity %in% c("Almond milk", 
                       "Soy milk", 
                       "Oat milk", 
                       "Coconut milk", 
                       "Cow milk")) %>% 
  mutate(milk_type = case_when(
    entity == "Almond milk" ~ "plant",
    entity == "Soy milk" ~ "plant",
    entity == "Oat milk" ~ "plant",
    entity == "Coconut milk" ~ "plant",
    entity == "Cow milk" ~ "cow"))

