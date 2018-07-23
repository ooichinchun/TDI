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

Figure above is generated via the use of this [R script](https://raw.githubusercontent.com/ooichinchun/TDI/master/generate_price_ggmap.R "ggmap Script").

### Linear Regression Models

While one would expect the resale prices to show significant variation with distance from downtown, the figure above does not seem to show a significant price variation between the various locations across the island.

I thus set out to further investigate the influence of the following factors on housing prices:
1. Floor area
2. Age of the unit
3. Actual height of the unit (aka storey)
4. Distance to nearest MRT station
5. Distance to downtown (proxy: City Hall MRT station)

#### Obtaining distance to nearest MRT station and downtown

Train station names were downloaded from data.gov.sg, and Vincenty distance between the individual resale locations and all other train stations were calculated based on their latitude and longitude.  

The distance between any resale location and the nearest MRT station was then computed, and plotted below. The mean distance is 745m, with a minimum of 40m and a maximum of 4.1km. 

This surprisingly suggests that the majority of the public housing units are extremely well-connected to the train system, with the majority of units being < 1km away from a train station.



![Traffic Camera Locations](traffic_camera_loc.png)

Credits: Data derived from data.gov.sg
