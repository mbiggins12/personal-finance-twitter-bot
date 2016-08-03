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

html %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_attr(2, name = "data-label")


# Lets try a loop here!
i <- 1
while (i < 53) {
  link <- paste("http://www.investopedia.com/categories/personalfinance.asp?page=", i, sep = "")
  html <- read_html(link)
  value <- html %>% html_nodes(css = "#responsive-insert-ad > ol > li > h3 > a") %>% html_attr(2, name = "data-label") 
  PFterms <- c(PFterms, value)
  i <- i + 1
}

# testing gsub without running whole script...
(test <- gsub("\\|.*$", "", PFterms[1]))

PFshort_terms <- gsub("\\|.*$", "", PFterms)

# comparison of PF terms
head(PFterms)
head(PFshort_terms)

