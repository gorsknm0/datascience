library(gapminder)
library(ggplot2)
library(dplyr)
gm <- gapminder::gapminder

life <- gm %>% group_by(lifeExp) %>%
  filter(year == 1982)

ggplot(data = life,
       aes(x = lifeExp)) +
  geom_histogram()

asia <- gm %>%
  group_by(pop, year) %>%
  filter(continent == 'Asia') %>%
  tally()

ggplot(data = asia,
       aes(x = year,
           y = pop,
           color = country)) +
  geom_line(size = 1.5, alpha = 0.5) +
  labs(title = 'Population in Asia by Year',
       x = 'Years',
       y = 'Population')

europe <- gm %>%
  group_by(gdpPercap, country) %>%
  filter(year == 2002 & continent == 'Europe') %>%
  tally()

ggplot(data = europe,
       aes(x = country,
           y = gdpPercap)) +
  geom_bar(stat = 'identity', alpha = 0.5, fill = 'blue') +
  theme(axis.text.x = element_text(angle = 90))
  
the_nineties <- gm %>% 
  filter(year > 1989 & year < 2000)