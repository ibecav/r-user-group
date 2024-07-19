
# pak::pkg_install("tidyverse")
whereto <- "shapey"
req <- httr::GET("https://api.github.com/repos/ibecav/r-user-group/git/trees/mapping_example?recursive=1")
httr::stop_for_status(req)
all_files_in_branch <- 
  httr::content(req)$tree  %>%
  purrr::map_dfr(~ .x %>% as_tibble()) %>% 
  filter(type == "blob" & str_starts(path, "shapefiles")) %>% 
  select(path, url) %>% 
  mutate(path = str_replace(path, "^shapefiles", whereto))

mpaths <- all_files_in_branch %>% pull(path)
murls <- all_files_in_branch %>% pull(url)

dir.create(whereto)

status_code <- 
  download.file(url = murls, 
                destfile = mpaths,
                mode = "wb",
                method = "libcurl",
                quiet = FALSE)

if(!status_code == 0){
  warning("Something went wrong please check the files downloaded!")
} else {
  message(paste0("Success, downloaded ", length(mpaths), " files to directory ",  whereto))
}
