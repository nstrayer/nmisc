#My go to file with a bunch of R things I need

#Libraries
library(stats)
library(rvest)
library(dplyr)
library(tidyr)
library(stringr)
library(downloader)
library(ggplot2)
library(rgdal)
library(sp)
library(maptools)
library(utils)
library(reshape2)
library(zoo)
library(lubridate)
library(scales)

#GGplot theme
#Dem repub colors
cbPalette <- c("#3989cb", "#d75c5c")

#' One of many ggplot themes that make illustrator easier to use later. 
#'
#' ggplot needs to be stopped!
#' @keywords ggplot2 plotting
#' @export
#' @examples
#' ggplot(...) + theme_nytge()
theme_nyt <- function(base_size = 12, base_family = "Helvetica"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace% 
    theme(strip.background = element_rect(fill = alpha('white', 0.001)),
          axis.line = element_line(colour = "black"),
          axis.ticks=element_blank(),
          panel.grid.minor = element_blank(),
          panel.border     = element_blank(),
          panel.background = element_blank(),
          axis.title.y = element_text(angle=0))
}


#' One of many ggplot themes that make illustrator easier to use later. 
#'
#' ggplot needs to be stopped!
#' @keywords ggplot2 plotting
#' @export
#' @examples
#' ggplot(...) + theme_nyt_no_horiz()
theme_nyt_no_horiz <- function(base_size = 12, base_family = "Helvetica"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace% 
    theme(axis.line = element_line(colour = "black"),
          axis.ticks.y=element_blank(),
          panel.grid.major.x = element_blank() ,
          # explicitly set the horizontal lines (or they will disappear too)
          panel.grid.major.y = element_line( size=.1, color="black" ), 
          panel.grid.minor = element_blank(),
          panel.border     = element_blank(),
          panel.background = element_blank(),
          axis.title.y = element_text(angle=0)
    )  
}

#' One of many ggplot themes that make illustrator easier to use later. 
#'
#' ggplot needs to be stopped!
#' @keywords ggplot2 plotting
#' @export
#' @examples
#' ggplot(...) + theme_nyt_vert_horiz()
theme_nyt_vert_horiz <- function(base_size = 12, base_family = "Helvetica"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace% 
    theme(axis.line = element_line(colour = "black"),
          axis.ticks.y=element_blank(),
          panel.grid.major.x = element_line( size=.1, color="black" ), 
          # explicitly set the horizontal lines (or they will disappear too)
          panel.grid.major.y = element_line( size=.1, color="black" ), 
          panel.grid.minor = element_blank(),
          panel.border     = element_blank(),
          panel.background = element_blank(),
          axis.title.y = element_text(angle=0)
    )  
}


#' One of many ggplot themes that make illustrator easier to use later. 
#'
#' ggplot needs to be stopped!
#' @keywords ggplot2 plotting
#' @export
#' @examples
#' ggplot(...) + theme_nothing()
theme_nothing <- function(base_size = 12, base_family = "Optima"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      rect             = element_blank(),
      line             = element_blank(),
      text             = element_blank(),
      axis.ticks.margin = unit(0, "lines")
    )
}
# check that it is a complete theme
# attr(theme_nyt_vert_horiz(), "complete")

#

#' Insert a value into a vector after specified value
#'
#' Normal numeric stuff is bad. This allows you to deal with the annoying characters that cause errors in normal is.numeric-ing
#' @param vec Vector in which you insert the value
#' @keywords vector numeric
#' @export
#' @examples
#' superNumeric("$200,000.00")
superNumeric <- function(vec){
  as.numeric(gsub(",|\\$", "",vec))
}

#' Insert a value into a vector after specified value
#'
#' Take a vector and put a value into it in a specified place
#' @param vec Vector in which you insert the value
#' @param pos Element that you slot in after
#' @param val Element that you slot in
#' @keywords vector
#' @export
#' @examples
#' slot_in()
slot_in <- function(vec, pos, val){
  place_in_vec <- which(vec == pos)
  size         <- length(vec)
  begining     <- vec[1:place_in_vec]
  end          <- vec[ (place_in_vec + 1) : size]
  c(begining, val, end)
}


