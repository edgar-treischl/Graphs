library(ggplot2)
library(showtext)
library(dplyr)
library(cowplot)

#ggplot2::theme_set(ggplot2::theme_minimal())

#thematic::thematic_on(bg = "white", fg = "#222222",
#accent = "#0CE3AC", font = "Amatic SC")

showplot <- function(variables) {
  anscombe_m <- data.frame()
  font_add_google("Vollkorn", "Vollkorn")
  showtext_auto()

  for(i in 1:4)
    anscombe_m <- rbind(anscombe_m, data.frame(set=i,
                                               x=anscombe[,i],
                                               y=anscombe[,i+4]))

  anscombe_m <- anscombe_m %>%
    mutate(set_new = case_when(
      set == 1 ~ "Case I",
      set == 2 ~ "Case II",
      set == 3 ~ "Case III",
      set == 4 ~ "Case IV")
    )


  ggplot(anscombe_m, aes(x, y)) +
    geom_point(size=1.5, color="black", fill="black", shape=21) +
    geom_smooth(method="lm", fill=NA, fullrange=TRUE, color="red", alpha=0.5) +
    facet_wrap(~set_new, ncol=2)+
    theme_minimal_grid()+
    labs(title = "Anscombe's Quartet",
         alt = "www.edgar-treischl.de")+
    theme(strip.text.x = element_text(
      size = 14, color = "black", face = "bold"))+
    annotate(x=12.5, y=4.45,
             label=paste("R = ", round(cor(anscombe_m$x,
                                            anscombe_m$y), 2)),
             geom="text", size=4)+
    theme(text=element_text(family="Vollkorn"))


}

showplot()






