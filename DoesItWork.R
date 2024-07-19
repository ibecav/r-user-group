sqrt(1:100) * 2





sqrt(1:100) * 2
sqrt_results <- sqrt(1:100) * 2
sqrt_results
new_sqrt_results <- sqrt_results * 15 / 7
sqrt_results * 15 / 7 -> even_newer
even_newer


library(pak)
pkg_install("tidyverse")
library(tidyverse)

? mpg
View(mpg)
plotme <- 
  mpg %>% 
  filter(cyl == 4) %>% 
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) +
  geom_smooth(colour = "black", 
              method = "lm", 
              formula = "y ~ x") +
  xlab("Engine displacement, in litres") +
  ylab("Highway MPG") +
  ggtitle("Highway miles per gallon 4 cylinder cars") +
  theme_bw()

plotme


pak::pkg_install("ggrepel")

plotme +
  geom_label(aes(label = manufacturer))


plotme +
  ggrepel::geom_label_repel(aes(label = manufacturer))

