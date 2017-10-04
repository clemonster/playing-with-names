library(prenoms)
library(ggplot2)
library(dplyr)
library(dygraphs)
library(tidyr)
data(prenoms)

names(prenoms)
dim(prenoms)
View(prenoms)
head(prenoms)
summary(prenoms)

#Set some variables to factors
prenoms <- prenoms %>%
  mutate_if(is.character, as.factor)

count_name_per_year <- function(the_name, the_sex){
  
  result <- prenoms %>% 
    filter(name == the_name, sex == the_sex) %>%
    group_by(year) %>%
    summarise(count = sum(n))
  return(result)
}

count_name_per_year("Vincent","M")
  
draw_a_name <- function(the_name, the_sex){
  name_count <- count_name_per_year(the_name,the_sex)
  plot <- ggplot(data = name_count,
       aes(x = year, y = count)) +
    geom_line() 
  return(plot)
}


draw_a_name(the_name = "Vincent",the_sex = "M")
