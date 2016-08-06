# ------------
# Data Science <> Week 2 <> Project <> Personal Finance Twitter Bot
# August 03, 2016
# tania ermak <><><> matthew biggins
# ------------
library(twitteR)


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

tweet("This is my first tweet!!!")
