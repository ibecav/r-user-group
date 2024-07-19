# pak::pkg_install(c("palmerpenguins"))
penguins_dat <- palmerpenguins::penguins  %>% 
  filter(!is.na(sex))

penguins_dat  %>% 
  ggplot(aes(x = body_mass_g, y = 1)) +
  ggdist::stat_halfeye(fill = 'dodgerblue4') +
  ggdist::stat_dots(
    aes(y = 0.8),
    fill = 'dodgerblue4',
    color = 'black',
    side = 'bottom'
  ) +
  geom_boxplot(width = 0.25, color = 'black', linewidth = 1) +
  theme_minimal(
    base_size = 18,
    # base_family = 'Source Sans Pro'
  ) +
  labs(
    x = 'Weight (in g)',
    y = element_blank(),
    title = 'Distribution of Penguin Weights'
  ) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    plot.title = element_text(
      size = rel(1.5),
      # family = 'Merriweather',
      face = 'bold'
    ),
    legend.position = 'none'
  ) +
  coord_cartesian(
    xlim = range(penguins_dat$body_mass_g)
  )

penguins_dat  %>%  
  ggplot(aes(x = body_mass_g, y = 1)) +
  ggdist::stat_halfeye(fill = 'dodgerblue4') +
  geom_point(
    aes(y = 0.75),
    size = 4, alpha = 0.75,
    shape = 21,
    fill = 'dodgerblue4',
    color = 'black',
    position = position_jitter(
      height = 0.1,
      seed = 2343
    )
  ) +
  geom_boxplot(width = 0.25, color = 'black', linewidth = 1) +
  theme_minimal(
    base_size = 18, 
    # base_family = 'Source Sans Pro'
  ) +
  labs(
    x = 'Weight (in g)', 
    y = element_blank(),
    title = 'Distribution of Penguin Weights'  
  ) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    plot.title = element_text(
      size = rel(1.5),
      # family = 'Merriweather',
      face = 'bold'
    ),
    legend.position = 'none'
  ) +
  coord_cartesian(
    xlim = range(penguins_dat$body_mass_g)
  )
