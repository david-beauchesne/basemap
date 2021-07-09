# basemap

Collection of data that I use in base maps in various projects

# Setup

Load package and install locally for now. I need to figure out how to install in the system and get the data to be loaded directly in the `data/` folder of the installed package. That will be for another time, however.


```{r}
# # Install packages
# install.packages("remotes")
# remotes::install_github("david-beauchesne/basemap")
#
# # Load data in package
# basemap::get_data()
R CMD INSTALL .
R
basemap::get_data()
```
