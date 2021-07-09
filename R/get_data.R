#' Download and format coutours
#'
#' Accesses and formats spatial data that I use frequently for static mapping
#'
#'
#' @export

get_data <- function() {
  # Quebec
  canada <- raster::getData('GADM', country = 'CAN', level = 1, path = 'data')
  canada <- st_as_sf(canada)
  quebec <- canada[canada$NAME_1 %in% c('Québec', 'Nova Scotia','New Brunswick', 'Newfoundland and Labrador', 'Prince Edward Island'),]
  quebec <- suppressWarnings(st_simplify(quebec, dTolerance = .01, preserveTopology = F))

  # Canada
  canada <- getData('GADM', country = 'CAN', level = 0, path = 'data')
  canada <- st_as_sf(canada)
  canada <- suppressWarnings(st_simplify(canada, dTolerance = .01, preserveTopology = F))

  # USA
  # Load needed data
  usa <- getData('GADM', country = 'USA', level = 0, path = 'data')
  usa <- st_as_sf(usa)
  usa <- suppressWarnings(st_simplify(usa, dTolerance = .05, preserveTopology = F))

  # Delete loaded data
  files <- dir("./data", pattern = ".rds", full.name = TRUE)
  file.remove(files)

  # Save data
  save(quebec, file = './data/quebec.RData')
  save(canada, file = './data/canada.RData')
  save(usa, file = './data/usa.RData')
}
