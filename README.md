## Analysis of High-Rise Public Housing Prices in Singapore (March 2012 - July 2017) (TDI)

Public records for public housing resale prices have been downloaded and post-processed for the following plots.

### Time-consistency of Resale Prices

| ![Resale Price Index](https://raw.githubusercontent.com/ooichinchun/TDI/master/resale_plot.png "Resale Price Index") | 
|:--:| 
| **Resale Price Index (2009-2017)** |

Governmental data for Resale Price Index (normalized at 100.0 to Q1 2009) shows a gradual appreciation till a peak in 2013, before prices stabilize in 2015 at a more moderate level.

This does suggest that prices in this data-set have to take year of sale into account for analysis.
Alternatively, prices can be restricted to 2015-2017 to avoid confounding effects.

### Location of Resale Flats Across Singapore

Initial data as retrieved from data.gov.sg provides resale information in actual address. We have used a Google API to convert these addresses into GPS coordinates for unified cross-referencing.

| ![Resale Flat Location](https://raw.githubusercontent.com/ooichinchun/TDI/master/Price_Distribution.png "Housing Locations") | 
|:--:| 
| **Resale Locations (2009-2017)** <br/> Color represents sale price on a log scale (most units range between SGD$100,000 and SGD$1,000,000. |

Various public residential zones show up quite clearly, with local districts such as Woodlands, Bishan, Toa Payoh and Tampines being very apparent.

In total, 102,100 transactions were recorded during this period, out of a total of 1.02 million flats in Singapore currently.


![Traffic Camera Locations](traffic_camera_loc.png)


Credits: Data derived from data.gov.sg
