library(ggplot2)
library(patchwork)
library(showtext)

font_add_google("Patua One", "Patua")
showtext_auto()

#Joins_Overall###############

showplot <- function(variables) {
  dfx <- expand.grid(x = 1:4, y = 1:2)

  labels_x <- c("3", "2", "1", "ID",
                "x3" , "x2",  "x1", "X")

  colour_x <-  c("#1363B3" , "#939191", "#6E55A1", "#302E2E",
                 "#1363B3" , "#939191", "#6E55A1", "#302E2E")


  p1 <- ggplot(dfx, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_x)+
    geom_text(aes(label = labels_x), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    labs(title = "Data joins of data A and B")+
    theme_void()+
    theme(text=element_text(family="Patua"))+
    theme(plot.title = element_text(size=22, face = "bold"))




  #Data y

  labels_y <- c("4", "2", "1", "ID",
                "y4" , "y2",  "y1", "Y")
  colour_y <-  c("#e9c46a" , "#939191", "#6E55A1", "#302E2E",
                 "#e9c46a" , "#939191", "#6E55A1", "#302E2E")

  p2 <- ggplot(dfx, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_y)+
    geom_text(aes(label = labels_y), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    theme_void()+
    theme(text=element_text(family="Patua"))

  df_ij <- expand.grid(x = 1:3, y = 1:3)


  labels_ij <- c("2", "1", "ID",
                 "x2", "x1" , "X",
                 "y2",  "y1", "Y")
  colour_ij <-  c("#939191" , "#6E55A1", "#302E2E",
                  "#939191" , "#6E55A1", "#302E2E",
                  "#939191" , "#6E55A1", "#302E2E")

  p3 <- ggplot(df_ij, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_ij)+
    geom_text(aes(label = labels_ij), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    ggtitle("A: Inner join()")+
    theme_void()+
    theme(text=element_text(family="Patua"))



  #Full join#############

  df_fj <- expand.grid(x = 1:5, y = 1:3)


  labels_fj <- c("4", "3", "2", "1", "ID",
                 "NA", "x3" , "x2",  "x1", "X",
                 "y4", "NA" , "y2",  "y1", "Y")
  colour_fj <-  c("#e9c46a", "#1363B3", "#939191", "#6E55A1", "#302E2E",
                  "#C51717", "#1363B3", "#939191", "#6E55A1", "#302E2E",
                  "#e9c46a", "#C51717", "#939191", "#6E55A1", "#302E2E")

  p4 <- ggplot(df_fj, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_fj)+
    geom_text(aes(label = labels_fj), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    ggtitle("B: Full join()")+
    theme_void()+
    theme(text=element_text(family="Patua"))




  df_lj <- expand.grid(x = 1:4, y = 1:3)

  labels_lj <- c("3", "2", "1", "ID",
                 "x3" , "x2",  "x1", "X",
                 "NA" , "y2",  "y1", "Y")
  colour_lj <-  c("#1363B3", "#939191", "#6E55A1", "#302E2E",
                  "#1363B3", "#939191", "#6E55A1", "#302E2E",
                  "#C51717", "#939191", "#6E55A1", "#302E2E")

  p5 <- ggplot(df_lj, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_lj)+
    geom_text(aes(label = labels_lj), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    ggtitle("C: Left join()")+
    theme_void()+
    theme(text=element_text(family="Patua"))


  #Right join#############

  df_rj <- expand.grid(x = 1:4, y = 1:3)


  labels_rj <- c("4", "2", "1", "ID",
                 "NA", "x2" , "x1", "X",
                 "y4", "y2", "y1", "Y")
  colour_rj <-  c("#e9c46a", "#939191", "#6E55A1", "#302E2E",
                  "#C51717", "#939191", "#6E55A1", "#302E2E",
                  "#e9c46a", "#939191", "#6E55A1", "#302E2E")

  p6 <- ggplot(df_rj, aes(x=x, y=y)) +
    geom_tile(color = "white", size = 4, fill = colour_rj)+
    geom_text(aes(label = labels_rj), color = "white",
              size = 5, family="Patua")+
    coord_flip()+
    ggtitle("D: Right join()")+
    theme_void()+
    theme(text=element_text(family="Patua"))

  (p1 | p2) /
    (p3 | p4) /
    (p5 | p6)


}

showplot()

