# As a junior data analyst for a hotel booking company, I have been asked to clean hotel booking data, create visualizations with ggplot2 to gain insight into the data, and present different facets of the data through visualization. Now, I am going to build on the work 
# I performed previously to apply filters to your data visualizations in ggplot2.

# Import your data
hotel_bookings <- read.csv("hotel_bookings.csv")

# Install and load the 'ggplot2' package

install.packages('ggplot2')
library(ggplot2)

# Making many different charts
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))
# Your stakeholder asked about the group of guests who typically make early bookings, and this plot showed that many of these guests do not have children. 

# My stakeholder wants to run a family-friendly promotion targeting key market segments. She wants to know which market 
# segments generate the largest number of bookings, and where these bookings are made (city hotels or resort hotels)
# First, I decide to create a bar chart showing each hotel type and market segment. You use different colors to represent each market segment.

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

# After creating this bar chart, I realize that it's difficult to compare the size of the market segments at the top of the bars. 
# I want your stakeholder to be able to clearly compare each segment.   
# I decide to use the facet_wrap() function to create a separate plot for each market segment

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

# Now we will be Filtering
# Now we will install and load `tidyverse` package

install.packages('tidyverse')
library(tidyverse)

# For the first step, I can use the `filter()` function to create 
# a data set that only includes the data I want.

onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="City Hotel" & 
                                  hotel_bookings$market_segment=="Online TA"))

# There is also another way to do this. 
# I can use the pipe operator (%>%) to do this in steps

onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")

head(onli)

# I will use my new dataframe
ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children))

