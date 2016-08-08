# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 05, 2016
# tania ermak <><><> matthew biggins
# ------------

# Environment Setup -------------------------------------------------------
library(tm)
library(rvest)
library(dplyr)

data <- lapply(1:53, function(page) {
  URL <- sprintf("http://www.investopedia.com/categories/personalfinance.asp?page=%s", page)
  
  # scraping... to produce a data.frame
  
  use.URL <- read_html(URL)
  terms <- use.URL %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_text(2)
  href_terms <- use.URL %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_attr("href")
  page_dataframe <- data.frame(Terms = terms, Link = href_terms, stringsAsFactors = FALSE)
})

data <- bind_rows(data)

data$definitions <- sapply(data$Link, function(def) {
  # scrape definitions...
  link <- sprintf("http://www.investopedia.com%s", def) 
  use.link <- read_html(link) %>%
    html_nodes(css = "#block-system-main > div > div.layout-body.box.clear > div > p:nth-child(2)") %>% 
    html_text(2) 
  
} )
