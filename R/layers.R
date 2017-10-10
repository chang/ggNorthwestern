#' @include colors.R

#' Northwestern scale for discrete values
#' @export
#' @inheritParams ggplot2::scale_colour_hue  # inherits param documentation
#'
#' @example
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_northwestern()
scale_colour_northwestern <- function(...) {
  ggplot2::discrete_scale(aesthetics = 'colour',
                          scale_name = 'northwestern',
                          palette = ggNorthwestern::palette_purple,
                          ...)
}


# For some reason, initializing with 'color' then assigning 'colour' as an alias doesn't work.
scale_color_northwestern <- scale_colour_northwestern


#' Northwestern colors for fill aesthetics
#'
#' @export
#'
#' @example
#' ggplot(diamonds, aes(x = price, fill = cut)) +
#'   geom_histogram() +
#'   scale_fill_northwestern()
scale_fill_northwestern <- function(...) {
  ggplot2::discrete_scale(aesthetics = 'fill',
                          scale_name = 'northwestern',
                          palette = ggNorthwestern::palette_purple,
                          ...)
}
