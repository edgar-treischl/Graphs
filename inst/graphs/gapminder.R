library(tidyverse)
library(gapminder)
library(viridis)

showplot <- function(variables) {
  gapminder |>
    filter (year == 2007) |>
    mutate(pop=pop/1000000) |>
    arrange(desc(pop)) |>
    ggplot(aes(x = log(gdpPercap),
               y = lifeExp,
               size = pop,
               color = continent)) +
    geom_point(alpha = 0.7)+
    scale_size(range = c(.1, 25), guide = "none")+
    #scale_x_continuous(limits = c(5, 12.5)) +
    scale_y_continuous(limits = c(30, 90))+
    scale_color_viridis(
      discrete = TRUE, name = "Region", option = "viridis")+
    labs(x = "GDP per capita (Log)",
         y = "Life expectancy (2007)",
         caption = "Data: Gapminder") +
    theme_minimal(base_size = 16)+
    guides(color = guide_legend(override.aes = list(size = 4),
                                reverse=TRUE))

}

showplot()
