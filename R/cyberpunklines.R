#' @title Cyberpunk-style line chart
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
#'
#' @import ggplot2
#' @export
cyber_lines <- function(x, df, col, palette = 1, glow = FALSE, area = FALSE, main = NULL, main.size = 20,
                        sub = NULL, xlab = NULL, ylab = NULL, bg.col = "#212946",
                        grid.col = "#242d4d", text.col = "lightgray", lwd = 1.75, xlim = NULL, ylim = NULL){

    n_lines <- 10
    diff_linewidth <- 0.65
    alpha_value <- 0.05

    y_m <- stack(df)

    # https://blog.depositphotos.com/15-cyberpunk-color-palettes-for-dystopian-designs.html

    if(palette == 1) {
       col <- colorRampPalette(c("#00ff9f", "#00b8ff", "#001eff", "#bd00ff", "#d600ff"))(ncol(df))
    }

    if(palette == 2){
        col <- colorRampPalette(c("#8386f5", "#3d43b4", "#041348", "#083e12", "#1afe49"))(ncol(df))
    }

    if(palette == 3){
        col <- colorRampPalette(c("#f887ff", "#de004e", "#1afe49"))(ncol(df))
    }

   p <- ggplot(data = y_m, aes(x = rep(x, length(unique(ind))), y = values, group = ind, colour = ind, fill = ind)) +
        geom_line(size = lwd) +
        scale_color_manual(values = col)

        if(area == T) {
            p <- p +  geom_area(position = "identity", alpha = 0.15) +
                      scale_fill_manual(values = col)
         }

        if(glow == T) {

            for (i in (n_lines + 1):1) {

               p <- p + geom_line(size = 0.75 + (diff_linewidth * i), alpha = alpha_value)

            }

            # for (i in (n_lines + 1):1) {
            #
            #    p <- p + geom_point(size = 4 + (diff_linewidth * i), alpha = ifelse(i == 1, 1, alpha_value))
            #
            # }
         }

   p <- p + scale_x_continuous(limits = xlim) +
            scale_y_continuous(limits = ylim) +
            labs(x = xlab, y = ylab, title = main, subtitle = sub) +
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

