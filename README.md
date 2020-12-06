# cyberpunk R package<img width = 150px height = 150px src="https://user-images.githubusercontent.com/67192157/101294474-c70f3d00-3817-11eb-81a2-fae3039ed6d0.png" align="right" />
A function to create cyberpunk-style graphs with R based on ggplot2


# Installation



# Example
```r
my_df <- data.frame(x = c(4, 5, 5, 7, 9, 8, 6, 7),
                    z = c(1, 1.5, 4, 3, 5, 6, 4.5, 5))
cyber_lines(x = 0:7,
           df = my_df,
           area = TRUE,
           glow = TRUE,
           bg.col = "black",
           grid.col = rgb(1, 1, 1, 0.1),
           main = "Cyberpunk")
```
<p style = "align-text: center"><img src = "https://user-images.githubusercontent.com/67192157/101294633-07bb8600-3819-11eb-8510-8acb2692efab.png"></img></p>
