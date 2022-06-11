#' Make a pie chart
#'
#' @param data A character vector with one element.
#' @param fill The variable to fill the pie.
#' @param legend The default does not return a legend.
#'
#' @return A ggplot2 object.
#' @export
#'
#' @examples
#' ggpie(palmerpenguins::penguins, fill = island)

ggpie <- function(data, fill, legend = "none") {
  check <- legend == "none"
  df <- data |>
    dplyr::group_by({{fill}}) |>
    dplyr::summarise(n = dplyr::n()) |>
    dplyr::mutate(sum = sum(n),
                  freq = round(n/sum * 100, 2))


  ggplot2::ggplot(df, ggplot2::aes(x="", y=freq, fill={{fill}}))+
    ggplot2::geom_col(width = 1)+
    ggplot2::coord_polar(theta = "y")+
    ggplot2::geom_text(ggplot2::aes(label = paste0({{fill}}, "\n", freq)),
                       color = "white",
                       position = ggplot2::position_stack(vjust = 0.5))+
    ggplot2::theme_void()+
    ggplot2::theme(legend.position=legend)



}




utils::globalVariables(c("freq", "n"))
