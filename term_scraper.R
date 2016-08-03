# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 03, 2016
# tania ermak <><><> matthew biggins
# ------------



# Environment Setup -------------------------------------------------------
library(tm)
library(rvest)


# Scraping Data -----------------------------------------------------------

# http://www.investopedia.com/categories/personalfinance.asp?page=4
# can reference page number at the end of each link to make scraping easier
html <- read_html("http://www.investopedia.com/categories/personalfinance.asp")

html %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_attr(2, name = "data-label")


