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

While the first 3 factors are directly provided by data.gov.sg, and are fairly straight-forward to incorporate into the model, the latter two had to be obtained via calls to Google's API for longitude and latitude.

#### Obtaining distance to nearest MRT station and downtown

Train station names were downloaded from data.gov.sg, and Vincenty distances between the individual resale locations and all other train stations were calculated based on their latitude and longitude.  

The distance between any resale location and the nearest MRT station was then computed, and plotted below. The mean distance is **745m**, with a minimum of 40m and a maximum of 4.1km. 

| ![Proximity to Trains](https://raw.githubusercontent.com/ooichinchun/TDI/master/Dist_Nearest_MRT.png "Train Station Proximity") | 
|:--:| 
| **Proximity to Nearest MRT Station** |


This surprisingly suggests that the majority of the public housing units are extremely well-connected to the train system, with the majority of units being < 1km away from a train station.

#### Linear Regression model

As a preliminary exercise, this model has been restricted to a simple GLM model. Unsurprisingly, there is a positive correlation between resale price and apartment story height and floor area, while there is a negative correlation between resale price and flat age, distance to nearest train station, and distance to downtown.

It should be noted that this model still does not account for many factors that could affect resale prices, hence, the intercept value (mean price independent of the studied variables) remains high (~ SGD$344,000). Additionally, the linear model assumes linearity in the dependence on the variables specified, but it is highly likely that such relationships may be non-linear. This additional level of complexity is definitely worth studying at a later date.

Unsurprisingly, the impact of floor area is huge, with an average increase of **SGD$3,800 per additional square metre of space**, while age is similarly important, with the unit losing an average of **SGD$3,000 every year that it ages**.

Somewhat surprisingly, the impact of proximity to downtown is not as critical as the impact of proximity to the nearest train station. For every additional metre closer the unit is to the train station, the unit becomes SGD$34 more expensive, while it only becomes SGD$15 more expensive for every metre that the unit is closer to downtown. This could be a simple reflection of the fact that people don't prize additional commute time on public transportation to downtown quite as highly as additional walking time to the train station.

##### Impact of Unit Floor

Sparsity of data beyond the 30th floor suggests that any conclusions made with regards to floor height should be more thoroughly investigated with a larger data set in subsequent analyses.

| ![Price with Floor](https://github.com/ooichinchun/TDI/blob/master/Floor_Dependency.png "Price Variation with Floor") | 
|:--:| 
| **Increase in Resale Price with Unit Height** <br/> Red vertical lines demarcate L15 and L30 respectively. |

Interestingly, the impact of the unit storey seems to display two distinct patterns, with a slower increase in price per floor of **~SGD$3,000** up to the first 15 floors, and a more rapid **increase of ~SGD$4,500 per floor** beyond that up to the 30th floor and potentially beyond.

This seems to suggest some psychological preference for higher units, and is an interesting observation for pricing.

Credits: Data derived from data.gov.sg
