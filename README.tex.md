# Assignment 4 (Baptiste Vincens)

# Evaluation of the structural safety of civil engineering structures using advanced in situ measurement techniques

## Description

This code quantifies the noise obtained when comparing two similar images of a speckled target with 3D digital image correlation (DIC). This is a "Zero Displacement Test" or ZDT which permits the quantifying of the random noise created both by the digital sensor of the cameras and the DIC algorithm. 

The field of vision is divided into sub-areas and for each displacement field (U, V, W), the standard deviation and average of the values in each sub-area are represented in pixel plots.

The files exported by the DIC software can be read together, which means that the points from several images can be put together to create one graph.

## Files

The code consists of two Matlab files (one function and one "main" file to call the function), four csv files which contain the points exported from the DIC software and four images which represent the U displacement field which correspond to each csv file for general comprehension.

## Getting started

Running this code requires Matlab version R2019b. The script should be run from the "main" file to plot the graphs. The variables in the "main" file (files to read, number of subdivisons of the field, pixel size) can be changed.
\[q(x)\cdot dx -V(x) + V(x) +dV =0\]
