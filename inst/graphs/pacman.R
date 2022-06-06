library(tidyverse)
library(patchwork)
library(showtext)


#The Pac Man#########
showplot <- function(variables) {
  font_add_google("Press Start 2P", "Press Start 2P")
  ## Automatically use showtext to render text for future devices
  showtext_auto()

  df<-tribble(
    ~Charts, ~Amount,
    "Resembles", 80.0,
    "Does not resemble", 20.0
  )


  #Very reduce blank theme
  blank_theme <- theme_minimal(base_size = 10)+
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      panel.border = element_blank(),
      panel.grid=element_blank(),
      axis.ticks = element_blank(),
      axis.text = element_blank(),
      plot.subtitle = element_text(size=12),
      plot.title = element_text(size=16)
    )


  ggplot(df, aes(x="", y=Amount, fill=Charts))+
    geom_bar(width = 60, stat = "identity", colour = "black")+
    coord_polar("y", start=pi / 1.5)+
    scale_fill_manual(values=c("white", "#ffff00")) +
    blank_theme +
    theme(legend.position="right")+
    theme(text=element_text(family="Press Start 2P"))+
    guides(fill = guide_legend(reverse=TRUE))+
    labs(title = "Pie Charts and Pac-Man",
         subtitle = "How many resemble a Pac-Man?",
         fill = " ")

}

showplot()
