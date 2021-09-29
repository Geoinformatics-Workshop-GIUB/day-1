############## FU Berlin Landsat 8 Preprocessing

#PART I

# Install and load required packages
#install.packages("raster")
library(raster)

#install.packages("rgdal")
library(rgdal)

# Loading Landsat 8 file
product <- "C:/Users/Ken/Documents/Studium_nicht_Sciebo/RSRG/Teaching_material/Data/LC081970242020052101T1-SC20200925100911.tar.gz"
file.exists(product) #Check whether the file exists

#Deletion of "tar.gz"-suffix
productname <- substr(product, 1, nchar(product) - 7) 
productname #Print the product name

#Unzipping
untar(product, exdir = productname)

#Inspection of the data
productfiles <- list.files(productname, full.names = TRUE)
productfiles #Print productfiles

#Selection of desired bands
bands <- c(grep('band1', productfiles, value=TRUE),
           grep('band2', productfiles, value=TRUE),
           grep('band3', productfiles, value=TRUE),
           grep('band4', productfiles, value=TRUE),
           grep('band5', productfiles, value=TRUE),
           grep('band6', productfiles, value=TRUE),
           grep('band7', productfiles, value=TRUE)
) 
bands #Print our bands

#Install rgdal
#install.packages("rgdal")
#library(rgdal)

#Building a raster stack
rasterstack <- stack(bands)

#Saving the raster stack
writeRaster(rasterstack, 
            paste0(productname, ".tif"), 
            format = "GTiff",
            overwrite = TRUE
)

#Deletion of uncompressed-files
unlink(productname, recursive=TRUE)

#Build pyramid layers
#makeOVR <- paste0("gdaladdo -ro", productname, ".tif 2 4 8 16")
#makeOVR
#system("makeOVR") 



#PART II ------------------------------------------------------------------------

#Reading the data
pathToFiles <- "C:/Users/Ken/Documents/Studium_nicht_Sciebo/RSRG/Teaching_material/Data/Landsat_8_all"

#Check
dir(pathToFiles)

#Writing the products
products <- list.files(pathToFiles, full.names = TRUE)
#Printing the result
products

#Test: Building for-loop
for (i in products) {
  print(i)
  print("do all the preprocessing stuff")
}

#All steps from the first part in a for-loop
for (i in products) {
  print( paste0("processing: ", i) )
  
  productname <- substr(i, 1, nchar(i) - 7) 
  
  untar(i, exdir = productname)
  
  productfiles <- list.files(productname, full.names = TRUE)
  
  bands <- c(grep('band1', productfiles, value=TRUE),
             grep('band2', productfiles, value=TRUE),
             grep('band3', productfiles, value=TRUE),
             grep('band4', productfiles, value=TRUE),
             grep('band5', productfiles, value=TRUE),
             grep('band6', productfiles, value=TRUE),
             grep('band7', productfiles, value=TRUE)
  ) 
  
  writeRaster(stack(bands), 
              paste0(productname, ".tif"), 
              format = "GTiff"
  )
  
  unlink(productname, recursive=TRUE)
  
  makeOVR <- paste0("gdaladdo -ro ", productname, ".tif 2 4 8 16")
  system( makeOVR )
}
