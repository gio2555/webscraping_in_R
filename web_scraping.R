install.packages('rvest')
install.packages("tidyverse")
library("rvest")
library("dplyr")
library("ggplot2")

link <-  "https://www.imdb.com/search/title/?genres=adventure&sort=user_rating,desc&title_type=feature&num_votes=25000,"
page <-  read_html(link)

name <-  page %>% html_nodes(".lister-item-header a") %>% html_text()
movie_links <- page %>% html_nodes(".lister-item-header a") %>% 
  html_attr("href") %>% paste("https://www.imdb.com", ., sep = "")
year <- page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating <- page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis <- page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()


get_cast <- function(movie_link) {
  movie_link <- "https://www.imdb.com/title/tt6710474/?ref_=adv_li_tt"
  movie_page <- read_html(movie_link)
  movie_cast <-  movie_page %>% html_nodes(".primary_photo+ td a") %>% 
    html_text()
}







movies <- data.frame(name,year,rating,synopsis, stringsAsFactors = FALSE)


