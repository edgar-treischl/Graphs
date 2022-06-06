library(ggplot2)
library(dplyr)
library(showtext)
library(gridExtra)

font_add_google("Patua One", "Patua")
showtext_auto()

showplot <- function(variables) {
  data <- data.frame(
    Group = c(rep("A", 100), rep("B", 500), rep("C", 15)),
    Outcome = c(rnorm(100, 12, 1), rnorm(500, 13, 1), rnorm(15, 20, 4))
  )

  sample_size <- data %>%
    group_by(Group) %>%
    summarize(num=n())

  data <- data %>%
    left_join(sample_size) %>%
    mutate(Groups = paste0(Group, "\n", "n=", num))

  p1 <- data %>%
    ggplot(aes(x = Group, y = Outcome, color = Group)) +
    geom_boxplot() +
    theme_minimal(base_size = 14)+
    scale_color_manual(values = c(rep("#969696", 4))) +
    theme(legend.position = "none") +
    ggtitle("A: A boxplot ...")+
    theme(text=element_text(family="Patua"))


  # Plot B
  p2 <- data %>%
    ggplot(aes(x = Groups, y = Outcome, color = Group)) +
    geom_boxplot() +
    geom_jitter(color = "#d62828", size = 0.5, alpha = 0.6) +
    theme_minimal(base_size = 14)+
    scale_color_manual(values = c(rep("#969696", 4))) +
    theme(legend.position = "none") +
    ggtitle("B: A jitter boxplot")+
    theme(text=element_text(family="Patua"))

  grid.arrange(p1, p2, ncol = 2)

}

showplot()



