#' @title Cyberpunk-style bar chart
#'
#' @description TODO
#'
#' @param x TODO

#' @author
#' \itemize{
#' \item{Soage González, José Carlos.}
#' \item{Maintainer: José Carlos Soage González. \email{jsoage@@uvigo.es}}
#' }
#'
#' @examples
#' # TODO
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom utils stack
#' @import ggplot2
#' @export
cyber_bars <- function(df, col, palette = 1, area = FALSE, main = NULL, main.size = 20, sub = NULL, xlab = NULL, ylab = NULL, bg.col = "#212946", grid.col = "#242d4d", text.col = "lightgray", lwd = 1.75){

  # https://blog.depositphotos.com/15-cyberpunk-color-palettes-for-dystopian-designs.html

  if(palette == 1) {
    col <- colorRampPalette(c("#00ff9f", "#00b8ff", "#001eff", "#bd00ff", "#d600ff"))(nrow(df))
  }

  p <- ggplot(df, aes(x = df[, 1], y = df[, 2]))

  if(area == FALSE) {
    p <- p + geom_bar(stat = "identity", fill = NA, color = col, size = 2)
  } else {
    p <- p + geom_bar(stat = "identity", fill = col)
  }

  p <- p + labs(x = xlab, y = ylab, title = main, subtitle = sub) +
    theme(plot.background = element_rect(fill = bg.col, colour = bg.col),
          panel.grid = element_line(colour = grid.col, size = 1),
          axis.text = element_text(colour = text.col),
          axis.title = element_text(colour = text.col),
          legend.background = element_blank(),
          legend.key = element_blank(),
          legend.position = "none",
          plot.title = element_text(colour = text.col, size = main.size),
          legend.title = element_text(colour = text.col),
          legend.text = element_text(colour = text.col, size = 12, face = "bold"),
          plot.margin = margin(1.5, 2, 1.5, 1.5, "cm"),
          panel.background = element_rect(fill = bg.col, colour = bg.col))

  return(p)

}


