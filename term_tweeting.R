# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 08, 2016
# tania ermak <><><> matthew biggins
# ------------


# Environment Setup -------------------------------------------------------
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



# Tweeting ----------------------------------------------------------------

# Randomly generate a tweet from our scraped terms list
tweet_ref <- sample(1:length(data[, 1]), 1, replace = TRUE)
tweet_term <- data$Terms[tweet_ref]
tweet_def <- data$definitions[tweet_ref]
tweet_def_short <- paste(substr(tweet_def, 1, 60), "...", sep = "")
tweet_link <- sprintf("http://www.investopedia.com%s", data$Link[tweet_ref])
tweet_full <- paste(tweet_def_short, tweet_link, sep = "")
tweet(tweet_full)