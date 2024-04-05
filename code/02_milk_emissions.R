library(pacman) 

p_load(rio, tidyverse, janitor, ggplot, esquisse) 



clean_names(bananaindex) 



#create milk type dataset 

milk <- bananaindex %>% 
  
  filter(entity %in% c("Almond milk",  
                       
                       "Soy milk",  
                       
                       "Oat milk",  
                       
                       "Coconut milk",  
                       
                       "Cow milk")) 



esquisser(milk) 



ggplot(milk) + 
  
  aes(x = entity, y = emissions_kg, fill = emissions_1000kcal) + 
  
  geom_col() + 
  
  scale_fill_viridis_c(option = "viridis", direction = 1) + 
  
  labs( 
    
    x = "Milk Type", 
    
    y = "Emissions per Kilogram", 
    
    title = "Comparison of Emissions per Kilogram and per 1000kcal Across Milk Types", 
    
    fill = "Emissions per 1000kcal",  # Change the legend title here 
    
    caption = "Greenhouse gas emissions are expressed in CO2-equivalents, accounting for non-CO2 gases by converting them based on their warming potential over a 100-year period."  
    
  ) + 
  
  theme_minimal() 

