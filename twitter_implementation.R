# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 08, 2016
# tania ermak <><><> matthew biggins
# ------------
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
tweet_def_short <- paste(substr(tweet_def, 1, 45), "...", sep = "")
tweet_link <- sprintf("http://www.investopedia.com%s", data$Link[tweet_ref])
tweet_text <- paste(tweet_term, tweet_def_short, sep = ": ")
tweet_full <- paste(tweet_text, tweet_link, sep = "")
tweet(tweet_full)

# Tweet back response -----------------------------------------------------

recent_tweet.df <- twListToDF(userTimeline("@tweetMoneySA", n = 1))
recent_tweet_check <- sub("([[:blank:]]+).*","" ,recent_tweet.df$text[1])
recent_tweet_check <- sub("@","", recent_tweet_check)
user.query <- mentions(n = 1) # this grabs mentions
query.df <- twListToDF(user.query)
load("mentions.rda")

if (query.df$id != reply_query.df$id) {
  test <- sapply(data$Terms, function(term) {
    if (agrepl(term,query.df$text[1], max.distance = 0.2) == TRUE) {
      reply_id <- paste("@",query.df$screenName[1], sep = "")
      reply_term <- data$Terms[term]
      reply_def <- data$definitions[term]
      reply_def_short <- paste(substr(reply_def, 1, 45), "...", sep = "")
      reply_link <- sprintf("http://www.investopedia.com%s", data$Link[term])
      reply_user <- paste(reply_id, reply_term, sep = " ")
      reply_text <- paste(reply_reply, reply_def_short, sep = ": ")
      reply_full <- paste(reply_text, reply_link, sep = "")
      
      updateStatus(reply_full) # tweets back answer.
      print(1)
    } else print(0)
  } )
  reply_query.df <- query.df
  save(reply_query.df, file = "mentions.rda")
}

if (sum(test) == 0) {
   reply_id <- paste("@",query.df$screenName[], sep = "")
   neg_reply_text <- "We aren't familiar with that term in a Personal Finance context, send another term. Good Luck with your finances!"
   neg_reply_full <- paste(reply_id, neg_reply_text, sep = "")
   updateStatus(neg_reply_full)
}