# Day 1 - Welcome, Raster stacking, sampling of training data

## During today's class you will learn... 

  - how to create a raster stack of several satellite image bands, a form of pre-processing in R.
  - how to automate that process (batch processing) for an arbitrary amount of images in R.
  - how to create training/validation data samples in QGIS. 

## At home you are supposed to...
  - finish creating your training samples.
  - refresh your memory on how to visualize and interpret remote sensing imagery.

---
  
## Part 1: Raster stacking and batch processing in R
Landsat 8 remote sensing data is provided as individual georeferenced **.tif** images based on their spectral bands. In this task we would like to stack these images into a single geotiff-file, a so-called **_raster stack_**.  

**What is a raster stack and why do we need it?**

A raster stack is essentially a stack of multiple raster layers that share the same spatial extent. While remote sensing imagery can be composed to a single raster image (e.g. true color composite, false color composite) it is essentially an array of different rasters, the so-called bands. Each band corresponds to the electromagnetic energy of a certain wavelength captured by the sensor. Some bands reflect colors that we, as humans, are able to visualize, such as red, green or blue but the majority of bands is usually outside of the perceivable spectrum. While having all the different bands of an image as seperate rasters/images can be fine in some cases, quite a lot of operations involved in image classification involv more than one band or even all bands at once. Thus, we need a way to refer to the whole array of images/bands - a raster stack. While we could stack our rasters in QGIS, we will use R for this pre-processing operation, because it is easier to automate things this way. For those of you who already performed image classification using the SCP plugin in QGIS, the raster stack is similar to a band set.


This first assignment is separated in two parts:
First, we manually create a raster stack out of a single Landsat-8 scene.
Second, we automate this process using a loop, so that we can create raster stacks out of more than one L8 scenes at once (batch processing).

These intermediate steps are necessary to successfully manage the first part:
1.	Acquiring Landsat-8 files 
2.	Creating a raster stack 
3.	Saving the raster stack 
4.	Deletion of redundant data

[Relative Link to the R code](./p1_raster_stacking.R)

## Part 2: Creating training samples in QGIS
## @Home: Read about image visualization and Machine Learning
