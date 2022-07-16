library(ggplot2)
library(patchwork)

showplot <- function(variables) {
  df_long <- expand.grid(x = 1:5, y = 1:4)

  labels_long <- c("2", "2", "1", "1", "ID",
                   "2", "1" , "2",  "1", "t",
                   "x2", "x1" , "x2",  "x1", "x",
                   "y", "y" , "y",  "y", "y")
  colour_long <-  c("#74a9cf", "#74a9cf", "#045a8d", "#045a8d", "#302E2E",
                    "#74a9cf", "#74a9cf", "#045a8d", "#045a8d", "#302E2E",
                    "#74a9cf", "#74a9cf", "#045a8d", "#045a8d", "#302E2E",
                    "#d0d1e6", "#d0d1e6", "#d0d1e6", "#d0d1e6", "#302E2E")

  p_long <- ggplot(df_long, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 1, fill = colour_long)+
    geom_text(aes(label = labels_long), color = "white",
              size = 5)+
    coord_flip()+
    theme_minimal()+
    theme(panel.grid.minor = element_blank(),
          panel.grid.major =  element_blank())+
    theme(axis.title=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank())+
    labs(title = "A: Long")+
    theme(plot.title = element_text(face = "bold"))



  #And wide
  df_wide <- expand.grid(x = 1:3, y = 1:4)

  labels_wide <- c("2", "1", "ID",
                   "x", "x", "x1",
                   "x", "x", "x2",
                   "y", "y", "y")
  colour_wide <-  c("#74a9cf", "#045a8d", "#302E2E",
                    "#74a9cf", "#045a8d", "#302E2E",
                    "#74a9cf", "#045a8d","#302E2E",
                    "#d0d1e6", "#d0d1e6", "#302E2E")

  p_wide <- ggplot(df_wide, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 1, fill = colour_wide)+
    geom_text(aes(label = labels_wide), color = "white", size = 5)+
    coord_flip()+
    theme_minimal()+
    theme(panel.grid.minor = element_blank(),
          panel.grid.major =  element_blank())+
    theme(axis.title=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank())+
    labs(title = "B: Wide")+
    theme(plot.title = element_text(face = "bold"))

  p_long + p_wide
}
