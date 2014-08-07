## Introduction

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

===================
<b>Memory calculation:</b>
===================

The zip file is 20.6 MB. If we don't have the disk space to unzip this, we have a problem. 
A zipped text file will be compressed to roughly 20% of its original size - here, the uncompressed data should be about 100 Mb. I won't discuss further the options to zip which affect the compression. Google "zip compression" if you need the gory details - space vs time. The file unzipped to roughly 130Mb.

I used a korn shell script to filter the unzipped data to a row with the column headings and rows for the two dates required for this analysis. (See<a href="https://github.com/fm75/ExData_Plotting1/blob/master/filter.sh"> filter.sh</a> for the details. It documents the misinformation provided in the spec of the original data.)

We should expect 48 hours * 1 row / minute * 60 minutes / hour = 2880 rows.

The script uses a pipeline, so the total volume of the full dataset is not really relevant with respect to machine memory, except that I will need some very small fraction of it (2 days out of 4 * 365 days) for disk storage. 

The data should be reduced to roughly 1 / 2*365 or 1 / 730th of the original data. The memory required by the pipeline is minimal, since it deals with only a single row at a time. the resulting filtered data set was 183,447 bytes in 2880 rows plus the row with the column headings matching the estimate above.

Each row needs a date-time object and 7 floating point objects. Let's round 2880 to 3000. We need memory for 3000 rows. Assuming floats are like doubles (8 bytes and a datetime is worth 20 bytes let's round per row memory to 80 bytes.) An in-memory representation should be approximately 240,000 bytes. We could probably handle that data on a computer from the late 80's, but it might not have had the network capacity for a "download". The actual size of the filtered file is
 183,447 bytes on a Mac.

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

<b>Correct. See the calculations performed above.</b>

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

