# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 03, 2016
# tania ermak <><><> matthew biggins
# ------------



# Google testing ----------------------------------------------------------
library(tm)
library(rvest)




# Question: Should the google scrape happen once then store all the data on AWS in a csv to be accessed...
# OR should nothing be scraped now and it just be done one at a time dynamically online as people tweet for
# information?



google <- "https://www.google.co.za"
term <- PFterms[2]
searchQ <- sprintf("https://www.google.co.za/search?q=%s", URLencode(term))
googol <- read_html(searchQ, encoding = "ISO-8859-1")
feelinglucky <- googol %>% html_nodes(css = "h3 > a") %>% html_attr("href") %>% .[[1]]
(PFResourceLinks <- paste(google, feelinglucky, sep = ""))


k = 2
while (k <= length(PFterms)) {
  term <- PFterms[k]

  searchQ <- sprintf("https://www.google.co.za/search?q=%s", URLencode(term))
  googol <- read_html(searchQ, encoding = "ISO-8859-1")
  feelinglucky <- googol %>% html_nodes(css = "h3 > a") %>% html_attr("href") %>% .[[1]]

  googleLink <- paste(google, feelinglucky, sep = "")
  PFResourceLinks <- c(PFResourceLinks, googleLink)
  k <- k + 1
}

PFResourceLinks

# unresolved as to why wrong
# (googol %>% html_nodes(css = "#rso > div > div:nth-child(1) > div > h3 > a"))

