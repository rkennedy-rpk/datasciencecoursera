library(dplyr)

complete <- function(directory, id = 1:332){
  
  mypath <- file.path(directory, paste(sprintf("%03d", id), ".csv", sep = ""))
  contents <- list()
  
  for (i in seq_along(mypath)) {
    contents[[i]] <- read.csv(
      file = mypath[[i]]
    )
  }
  master_file <- contents %>% 
    purrr::map(as.data.frame) %>% 
    bind_rows(.id = "id") 
  answer <- master_file %>% 
    group_by(ID) %>% 
    summarise(count(sulfate & nitrate))
  return(answer)
}

complete(file.path("rprogramming_specdata","specdata"), 30:25)
