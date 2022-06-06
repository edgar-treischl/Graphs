library(tidyverse)
library(patchwork)
# simpson_scatter################
library(showtext)


showplot <- function() {
  font_add_google("Patua One", "Patua")
  showtext_auto()

  set.seed(1)
  a <- data.frame(x = 5 + rnorm(100), y = 5 + rnorm(100)) %>% mutate(y = y - x / 4)
  c <- a %>%
    mutate(x = x + 2) %>%
    mutate(y = y + 2)
  simps_df <- do.call(rbind, list(a, c))
  simps_df <- simps_df %>% mutate(Sex = rep(c("Men", "Women"), each = 100))

  p1 <- ggplot(simps_df, aes(x = x, y = y)) +
    geom_point(size = 2, color = "black") +
    theme_minimal(base_size = 14) +
    geom_smooth(method = "lm", formula = y ~ x,
                color = "#C51717", se = FALSE)+
    labs(title = "Simpson's Paradox")+
    theme(text=element_text(family="Patua"))+
    theme(plot.title = element_text(size=24, face = "bold"))


  df_text <- data.frame(
    x = c(8, 8),
    y = c(5.5, 2.9),
    text = c("Women", "Men")
  )


  p2 <- ggplot(simps_df) +
    geom_point(aes(x = x, y = y, color = Sex), size = 2) +
    geom_smooth(aes(x = x, y = y, color = Sex),
                method = "lm", formula = y ~ x, se = FALSE, fullrange = TRUE
    ) +
    scale_colour_manual(values = c("#C51717", "black")) +
    theme_minimal(base_size = 14) +
    theme(legend.position = "none") +
    geom_label(
      data = df_text,
      aes(x = x, y = y, label = text),
      fill = c("black", "#C51717"),
      size = 5,
      color = c("white", "white")
    )
    theme(text=element_text(family="Patua"))



  plot <- (p1 + p2)
  plot

}

showplot()



