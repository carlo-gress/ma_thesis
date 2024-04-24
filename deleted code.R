Visualising the final RBS blocks, coloring based on whether the block is occupied or not

```{r}
# Transforming the dataframe into an sf object for plotting 
berlin_final_sf <- st_as_sf(berlin_final, crs = utm_crs_germany)

# Plot the map using ggplot2
ggplot() +
  geom_sf(data = filter(berlin_final_sf, ewk != "unbewohnt"), aes(fill = "Inhabited"), size = 0.5, alpha = 0.5) +
  geom_sf(data = filter(berlin_final_sf, ewk == "unbewohnt"), aes(fill = "Unoccupied"), size = 0.5, alpha = 0.5) +
  scale_fill_manual(values = c("Unoccupied" = "red", "Inhabited" = "blue")) +
  theme_void() + # Remove axes
  theme(legend.position = "right", legend.title = element_blank(), legend.text = element_text(size = 10))

# If needed, save the plot to a file
ggsave("final_figures/berlin_blocks_map.png", width = 15, height = 15, dpi = 300)

```

```{r}
btw_21_sf |> 
  filter(Country == "Berlin") |> 
  ggplot() +
  geom_sf(aes(fill = deviation), color = "0.8", size = 0.8) +
  scale_fill_distiller(palette = "RdBu", name = "Deviation (in %)", limits = c(min(btw_21_sf$deviation, na.rm = TRUE), max(btw_21_sf$deviation, na.rm = TRUE))) +
  theme_void() +
  theme(plot.title = element_text(size = 16),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12)) +
  theme(legend.position = "right")

# Display the plot
ggsave("final_figures/population_deviation_map_berlin.png", width = 12, height = 8, dpi = 300)
```

Berlin map highlighting problematic constituencies and labels them
```{r}

berlin_non_residents <- btw_21_sf |>  
  filter(Country == "Berlin") 

ggplot(data = berlin_non_residents) +
  geom_sf(data = berlin_non_residents |> filter(deviation25_nr == 0), fill = "grey", color = NA, size = 0.1) +
  geom_sf(data = berlin_non_residents |> filter(deviation25_nr == 1), aes(fill = deviation_non_residents), color = NA, size = 0.1) +
  scale_fill_distiller(palette = "RdBu", name = "Deviation (in per cent)", 
                       limits = c(min(berlin_non_residents$deviation_non_residents, na.rm = TRUE), max(berlin_non_residents$deviation_non_residents, na.rm = TRUE))) +
  theme_void() +
  theme(plot.title = element_text(size = 16),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        legend.position = "right")
```













