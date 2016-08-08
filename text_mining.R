# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 03, 2016
# tania ermak <><><> matthew biggins
# ------------




# Environment Setup -------------------------------------------------------

library(tm)
library(GuardianR)

# Data Scraping -----------------------------------------------------------
guardian_key <- "73e1f78f-d671-4464-b926-9e6b79b71fe8"


rand <- sample(1:length(data[, 1]), 1, replace = TRUE)
keyword <- data[rand,1]
guardian.keyword <- gsub("\\s+", "+", keyword)
start.date <- Sys.Date()-15
end.date <- Sys.Date()
guardian.frame <- data.frame(get_guardian(guardian.keyword, json, start.date, end.date, guardian_key))
