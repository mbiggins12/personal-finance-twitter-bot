# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 03, 2016
# tania ermak <><><> matthew biggins
# ------------



# Environment Setup -------------------------------------------------------
library(tm)
library(rvest)


# Scraping Data -----------------------------------------------------------


# can append page number at the end of each link to make scraping easier "?page=#"
html <- read_html("http://www.investopedia.com/categories/personalfinance.asp")
PFterms <- html %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_text(2)


# Lets try a loop here!
i <- 1
while (i < 53) {
  link <- sprintf("http://www.investopedia.com/categories/personalfinance.asp?page=%s", i)
  html <- read_html(link)
  value <- html %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_text(2)
  PFterms <- c(PFterms, value)
  i <- i + 1
}

head(PFterms)

