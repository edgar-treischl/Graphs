library(datasauRus)
library(ggplot2)
library(dplyr)
library(showtext)
library(patchwork)

font_add_google("Amatic SC", "Amatic+SC")
## Automatically use showtext to render text for future devices
showtext_auto()

#distinct(datasaurus_dozen, dataset)


showplot <- function() {
  dino <- filter(datasaurus_dozen, dataset == "dino" )

  p1 <- ggplot(dino, aes(x = x, y = y)) +
    geom_point(size = .75) +
    theme(legend.position = "none") +
    theme_minimal()+
    theme(text=element_text(size=10,  family="Amatic+SC"))+
    labs(title = "The datasauRus and some of his friends")+
    theme(plot.title = element_text(size=28, face = "bold"))+
    theme(strip.text.x = element_text(
      size = 22, color = "black", face = "bold"
    ))


  datasaurus_dozen2 <- filter(datasaurus_dozen, dataset == "away" |
                                dataset == "bullseye" |
                                dataset == "circle" |
                                dataset == "dots" |
                                dataset == "star" |
                                dataset == "x_shape"
  )


  p2 <- ggplot(datasaurus_dozen2, aes(x = x, y = y)) +
    geom_point(size = .75) +
    theme(legend.position = "none") +
    facet_wrap(~dataset, ncol = 2)+
    theme_minimal()+
    theme(text=element_text(size=10,  family="Amatic+SC"))+
    theme(strip.text.x = element_text(
      size = 22, color = "black", face = "bold"
    ))


  p1+p2


}

showplot()
