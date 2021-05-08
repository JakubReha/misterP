state_abb <- datasets::state.abb
state_fips <- c(1,2,4,5,6,8,9,10,12,13,15,16,17,18,19,20,21,22,23,24,
                25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,
                44,45,46,47,48,49,50,51,53,54,55,56)
recode_fips <- function(column) {
  factor(column, levels = state_fips, labels = state_abb)
}
get_se_bernoulli <- function(p, n){
  return(sqrt(p*(1-p)/n))
}
# Reed CCES data again, but this time we also read the partisanship variable
clean_cces2 <- function(df, remove_nas = TRUE){
  
  ## Abortion -- dichotomous (0 - Oppose / 1 - Support)
  df$abortion <- abs(df$CC18_321d-2)
  
  ## State -- factor
  df$state <- recode_fips(df$inputstate)
  
  ## Gender -- dichotomous (-0.5 Female, +0.5 Male)
  df$male <- abs(df$gender-2)-0.5
  
  ## ethnicity -- factor
  df$eth <- factor(df$race,
                   levels = 1:8,
                   labels = c("White", "Black", "Hispanic", "Asian", "Native American", "Mixed", "Other", "Middle Eastern"))
  df$eth <- fct_collapse(df$eth, "Other" = c("Asian", "Other", "Middle Eastern", "Mixed", "Native American"))
  
  ## Age -- cut into factor
  df$age <- 2018 - df$birthyr
  df$age <- cut(as.integer(df$age), breaks = c(0, 29, 39, 49, 59, 69, 120), 
                labels = c("18-29","30-39","40-49","50-59","60-69","70+"),
                ordered_result = TRUE)
  
  ## Education -- factor
  df$educ <- factor(as.integer(df$educ), 
                    levels = 1:6, 
                    labels = c("No HS", "HS", "Some college", "Associates", "4-Year College", "Post-grad"), ordered = TRUE)
  df$educ <- fct_collapse(df$educ, "Some college" = c("Some college", "Associates"))  
  
  # Party
  df$party <- factor(df$pid3,
                     levels = 1:5,
                     labels = c("Democrat", "Republican", "Independent", "Other", "Not sure"), 
                     ordered = TRUE)
  df$party <- fct_collapse(df$party, "Independent" = c("Independent", "Other", "Not sure"))
  
  # Clean and remove NAs
  df <- df %>% select(abortion, state, eth, male, age, educ, party)
  if (remove_nas){
    df <- df %>% drop_na()
  }
  
  return(df)
  
}

df1 <- read.csv(file = '/Users/kuba/Downloads/cces18_common_vv.csv')
df = clean_cces2(df1)
write.csv(df,'/Users/kuba/git/misterP/Data/cces_all_clean_2.csv')

