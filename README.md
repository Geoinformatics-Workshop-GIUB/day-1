# day-1

Landsat 8 remote sensing data are provided as individual georeferenced **.tif** images based on their spectral bands. In this task we would like to stack these images into a single geotiff-file, a so-called **_raster stack_**.  Afterwards, it is much easier to work with such a raster stack. While this could also be done in QGIS, we will use R for this pre-processing, because it is easier to automate things this way. 

This assignment is separated in two parts:
We first manually create one raster stack out of one Landsat 8 scene. 
The second part will guide you to automate the raster stack creation (batch processingn), so that we can build a raster stack out of more than one Landsat 8 file at once.

These intermediate steps are necessary to successfully manage the first part:

1.	Download of Landsat 8 files 
2.	Creating a raster stack 
3.	Saving the raster stack 
4.	Deletion of redundant data
