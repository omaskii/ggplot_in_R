install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
install.packages("palmerpenguins")
library(ggplot2)
library(palmerpenguins)

data("penguins")
View(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), na.rm = TRUE)

#working with another dataset i.e. a .csv dataset called hotel_booking
hotel_bookings <- read.csv("hotel_bookings.csv")
head(hotel_bookings)
colnames(hotel_bookings)

#creating a plot
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children), na.rm = TRUE)

ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = stays_in_weekend_nights, y =children), na.rm = TRUE)

#Enhancing visualization in R

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species), na.rm = TRUE)
#R automatically gives a legend to the plot
#To add shape and size to a particular or different variables, we add it to the aes part of the function 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, 
color=species, size=species, shape=species), na.rm = TRUE)

#We can add the map alpha to the species in ase function to add transparency
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha=species), na.rm = TRUE)

#To make all the points in the code to be thesame color irrespective of species, we add the color outside 
#the parentheses
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,), 
                                     color="purple", na.rm = TRUE)
#Doing more with ggplot2
#We can use different geom functions to change the plot type
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g,), 
                                     color="purple", na.rm = TRUE)
#The line shows the positive relationship btw the flipper length and body mass

#We can also show both the points and the line in same plot
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,))

#To add a different line type to a partiular species, we add the linetype to the geom_smooth function
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype=species)) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,))

#If the plots are too cluttered, we can use the jitter function to make the points more readable
#by replacing geom_point with geom_jitter
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype=species)) + 
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g,))

#BAR CHART. We use the diamond dataset
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut))
#r automatically counts how much each x value appears and plots in the y axis

#add color aesthetics
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut, color=cut), na.rm = TRUE)
#R supplioes color legend automatically

#adding fill
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut, fill=cut), na.rm = TRUE)

#stacked bar chart usinf fill=clarity
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut, fill=clarity), na.rm = TRUE)

#Smoothing---there are two types of smoothing; loess and gam. loess is used for smoothing data
#with lee tha 1000 points while gam is used smoothing large number of points
#the codes generally used are written as follows

#For loess smoothing
ggplot(data, aes(x=, y=))+ 
  geom_point() +       
  geom_smooth(method="loess")

#for gam smoothing
ggplot(data, aes(x=, y=)) + 
  geom_point() +        
  geom_smooth(method="gam", 
              formula = y ~s(x))
