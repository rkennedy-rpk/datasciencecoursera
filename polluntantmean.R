
pollutantmean <- function(directory, pollutant, id = 1:332){
  
  mypath <- file.path(directory, paste(sprintf("%03d", id), ".csv", sep = ""))
  contents <- data.frame()
  
  spfunc <- function(filelist){
    contents <- read.csv(filelist)
    myvect <- contents[[pollutant]]
  }

  test <- sapply(mypath, spfunc)

  mymean <- mean(unlist(test), na.rm = TRUE)
  return(mymean)
}

pollutantmean(file.path("rprogramming_specdata","specdata"), "sulfate", 1:10)
pollutantmean(file.path("rprogramming_specdata","specdata"), "nitrate", 70:72)

