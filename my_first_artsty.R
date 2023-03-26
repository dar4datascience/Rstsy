#set.seed(420)
#here::i_am("my_first_artsty.R")
library(aRtsy)
library(magrittr)
#add random sample to chose n
artwork_mosaic <- canvas_mosaic(colors = colorPalette("random", n= 3))

artwork_nebula <- canvas_nebula(colors = colorPalette("random", n= 4))

artwork_forest <- canvas_forest(colors = colorPalette("random", n= 7))

artwork_squares <- canvas_squares(colors = colorPalette("random", n= 6))

artwork_polylines <- canvas_polylines(colors = colorPalette("random", n= 7))

artwork_function <- canvas_function(colors = colorPalette("random", n= 8))

artwork_watercolors <- canvas_watercolors(colors = colorPalette("random", n= 9))

artwork_turmite <- canvas_turmite(colors = colorPalette("random", n= 20))

artwork_recaman <- canvas_recaman(colors = colorPalette("random", n = 5))

artwork_strokes <- canvas_strokes(colors = colorPalette("random", n= 9))

#artwork_smoke <- canvas_smoke(colors = 'all', shape)

# Advanced example
colors <- list(
  c("lightgreen", "magenta", "darkred"),
  c("dodgerblue", "darkblue", "white"),
  c("black", "yellow", "purple")
)


artwork_planet <- canvas_planet(colors,
                                 radius = c(800, 400, 150),
                                 center.x = c(1, 500, 1100),
              center.y = c(1400, 500, 1000),
              starprob = 0.005
)

artwork_petri <- canvas_petri(colors = colorPalette("random", n= 10))

artwork_mesh <- canvas_mesh(colors = colorPalette("random", n= 5))

artwork_flow <- canvas_flow(colors = colorPalette("random", n= 4))

artwork_flame <- canvas_flame(colors = colorPalette("random", n= 9))

artwork_collatz <- canvas_collatz(colors = colorPalette("random", n= 6))

artwork_ant <- canvas_ant(colors = colorPalette("random", n= 20))

# arworkdf
artwork_df <- tibble::tibble(
  title = c(
    'artwork_ant',
    'artwork_mosaic',
    'artwork_collatz',
    'artwork_flame',
    'artwork_flow',
    'artwork_mesh',
    'artwork_forest',
    'artwork_function',
    'artwork_nebula',
    'artwork_petri',
    'artwork_planet',
    'artwork_polylines',
#    'artwork_smoke',
    'artwork_recaman',
    'artwork_turmite',
    'artwork_strokes',
    'artwork_squares',
    'artwork_watercolors'
  ),
  artwork = list(
    artwork_ant,
    artwork_mosaic,
    artwork_collatz,
    artwork_flame,
    artwork_flow,
    artwork_mesh,
    artwork_forest,
    artwork_function,
    artwork_nebula,
    artwork_petri,
    artwork_planet,
    artwork_polylines,
 #   artwork_smoke,
    artwork_recaman,
    artwork_turmite,
    artwork_strokes,
    artwork_squares,
    artwork_watercolors
  )
)


rm(
  artwork_ant,
  artwork_mosaic,
  artwork_collatz,
  artwork_flame,
  artwork_flow,
  artwork_mesh,
  artwork_forest,
  artwork_function,
  artwork_nebula,
  artwork_petri,
  artwork_planet,
  artwork_polylines,
  #artwork_smoke,
  artwork_recaman,
  artwork_turmite,
  artwork_strokes,
  artwork_squares,
  artwork_watercolors
)
#gen func
save_rsty_canvas <- function(artwork_dataframe) {
  print(paste0("Saving: ", artwork_dataframe$title))
  aRtsy::saveCanvas(artwork_dataframe$artwork %>% purrr::pluck(1),
             filename = here::here('rstsy outputs', paste0(artwork_dataframe$title, ".png")))
  print(paste0("Done! File in: ", here::here(
    'rstsy outputs', paste0(artwork_dataframe$title, ".png")
  )))
}

#purrr
purrr::walk(1:nrow(artwork_df),
            ~save_rsty_canvas(artwork_df[.x,]))

# aRtsy::saveCanvas(artwork_mosaic,here::here(
#   'rstsy outputs', paste0("test", ".png") ))