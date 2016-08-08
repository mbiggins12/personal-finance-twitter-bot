# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 08, 2016
# tania ermak <><><> matthew biggins
# ------------




# Environment Setup -------------------------------------------------------
library(GuardianR)
library(twitteR)

data <- read.csv("terms_library.csv")

# Major Keys --------------------------------------------------------------

# Consumer Key (API Key) 
cKey <- "w6mhC51nNQv3bA1jou1AnMpOg"
# Consumer Secret (API Secret)
cSecret <- "bD5AsWU2lce9lIe102e0yNt0GqbB970b39CLqZLwqH2dTCzAWG"
# Access Token
aToken <- "761983471665512448-YnVGf1zyVAEXuDdkAnLqcKFB6m3L0IR"
# Access Token Secret
aSecret <- "FhBhkAJlWZEitBDkTidz5mFiIzhlFFuVR8ochpIQfI673"

setup_twitter_oauth(cKey, cSecret, aToken, aSecret)

# Data Scraping -----------------------------------------------------------
guardian_key <- "73e1f78f-d671-4464-b926-9e6b79b71fe8"

rand <- sample(1:length(data[, 1]), 1, replace = TRUE)
keyword <- data[rand,1]
guardian.keyword <- gsub("\\s+", "+", keyword)
start.date <- Sys.Date()-15
end.date <- Sys.Date()
guardian.frame <- data.frame(get_guardian(guardian.keyword, json, start.date, end.date, guardian_key))

# Post articles
article_link <- guardian.frame$webUrl[1]
article_full <- paste(article_link)
tweet(article_full)
