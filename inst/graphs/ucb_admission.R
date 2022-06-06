library(tidyverse)
library(patchwork)
# simpson_scatter################
library(showtext)

font_add_google("Patua One", "Patua")
showtext_auto()

showplot <- function(variables) {
  df <- as.data.frame(UCBAdmissions)

  df2 <- df %>%
    group_by(Gender, Admit) %>%
    summarise(
      Freq = sum(Freq)
    ) %>%
    mutate(Percent = Freq / sum(Freq) * 100)


  txt <- c("Admitted", "Rejected", "Admitted", "Rejected")
  num <- paste(round(df2$Percent, 2), "%")

  p_overall <- df2 %>%
    ggplot(aes(x = Gender, y = Percent, group = Gender, fill = Admit)) +
    geom_bar(stat = "identity", position = position_stack()) +
    geom_text(aes(label = paste(txt, num, sep = "\n" )),
              position = position_stack(vjust = 0.5),
              colour = "white", size = 4, fontface = "bold"
    ) +
    theme_minimal(base_size = 14) +
    scale_fill_manual(values = c("#264653", "#C51717")) +
    guides(fill = guide_legend(reverse = TRUE))+
    labs(title = "UCB Admission Rates",
         alt = "UCB Admission Rates by Edgar Treischl")+
    theme(text=element_text(family="Patua"))+
    theme(plot.title = element_text(size=20))+
    theme(legend.position="none")


  df_dep <- df %>%
    group_by(Dept) %>%
    mutate(Percent = Freq / sum(Freq) * 100)

  Dept.labs <- c(
    `A` = "Department A",
    `C` = "Department C",
    `F` = "Department F"
  )

  p_acf <- df_dep %>%
    filter(Dept == "A" | Dept == "F") %>%
    ggplot(aes(
      x = Gender, y = Percent, group = Gender,
      fill = Admit
    )) +
    geom_bar(stat = "identity", position = position_stack()) +
    geom_text(aes(label = round(Percent, 2)),
              position = position_stack(vjust = 0.5),
              colour = "white", size = 3, fontface = "bold"
    ) +
    theme_minimal(base_size = 14) +
    scale_fill_manual(values = c("#264653", "#C51717")) +
    facet_wrap(. ~ Dept,
               ncol = 1,
               labeller = as_labeller(Dept.labs)
    ) +
    theme(strip.text.x = element_text(
      size = 12, color = "black", face = "bold"
    )) +
    guides(fill = guide_legend(reverse = TRUE))+
    theme(text=element_text(family="Patua"))+
    theme(legend.position="none")

  p_overall + p_acf


}

showplot()



