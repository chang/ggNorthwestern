#' Northwestern Color Palette
#'
#' Hex and RGB codes scraped from Northwestern's Brand Tools.
#' See: \url{http://www.northwestern.edu/brand/visual-identity/color/digital-colors.html}

#' Northwestern color scales
#' @export
colors <- {
  colors_list <- list()

  .PUR_MAIN = '#4e2a84'
  .PUR_90 = '#5b3b8c'
  .PUR_80 = '#684c96'
  .PUR_70 = '#765da0'
  .PUR_60 = '#836eaa'
  .PUR_50 = '#9380b6'
  .PUR_40 = '#a495c3'
  .PUR_30 = '#b6acd1'
  .PUR_20 = '#ccc4df'
  .PUR_10 = '#e4e0ee'
  .PUR_160 = '#1d0235'
  .PUR_150 = '#260841'
  .PUR_140 = '#30104e'
  .PUR_130 = '#38175a'
  .PUR_120 = '#401f68'
  .PUR_110 = '#482476'


  colors_list$purple_scale <- c(.PUR_110, .PUR_70, .PUR_30)
  colors_list
}

#' A purple scale.
#' @export
palette_purple <- scales::manual_pal(rep_len(colors$purple_scale, 10))
