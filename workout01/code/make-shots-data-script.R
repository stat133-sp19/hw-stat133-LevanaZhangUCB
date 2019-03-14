# TITLE
# DESCRIPTION
# INPUTS
# OUTPUTS
col_types = c("factor","character","factor","factor","double","double","factor","factor","factor","double","factor","double","double")
# Stephen Curry
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = col_types)
curry$name <- "Stephen Curry"
curry$shot_made_flag <- as.character(curry$shot_made_flag)
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag <- as.factor(curry$shot_made_flag)
curry$minute <- (as.double(curry$period)*12) - curry$minutes_remaining
sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()
# Kevin Durant
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = col_types)
durant$name <- "Kevin Durant"
durant$shot_made_flag <- as.character(durant$shot_made_flag)
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag <- as.factor(durant$shot_made_flag)
durant$minute <- (as.double(durant$period)*12) - durant$minutes_remaining
sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()
# Draymond Green
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = col_types)
green$name <- "Draymond Green" 
green$shot_made_flag <- as.character(green$shot_made_flag)
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag <- as.factor(green$shot_made_flag)
green$minute <- (as.double(green$period)*12) - green$minutes_remaining
sink("output/draymond-green-summary.txt")
summary(green)
sink()
# Andre Iguodala
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = col_types)
iguodala$name <- "Andre Iguodala" 
iguodala$shot_made_flag <- as.character(iguodala$shot_made_flag)
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag <- as.factor(iguodala$shot_made_flag)
iguodala$minute <- (as.double(iguodala$period)*12) - iguodala$minutes_remaining
sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
# Klay Thompson
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = col_types)
thompson$name <- "Klay Thompson" 
thompson$shot_made_flag <- as.character(thompson$shot_made_flag)
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag <- as.factor(thompson$shot_made_flag)
thompson$minute <- (as.double(thompson$period)*12) - thompson$minutes_remaining
sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()

shots_data <- rbind(curry,durant,green,iguodala,thompson)
write.csv(shotsdata, "data/shots-data.csv")
sink("../output/shots-data-summary.txt")
summary(shotsdata)
sink()