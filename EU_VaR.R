# 1 Install packages ---
install.packages("quantmod")

# 2 Load packages into R session
library(quantmod)

# 3 Collect  symbol data ----
getSymbols("DEXUSEU", src = "FRED")

# 4 Preview data
head(DEXUSEU)
tail(DEXUSEU)
chartSeries(DEXUSEU)

# 5 check for NAs values
sum(is.na(DEXUSEU))

# 6 Process NA values
EU <- DEXUSEU["2010-01-01::"] # nolint
EU <- ifelse(is.na(EU), coredata(mean(EU, na.rm = TRUE)), EU) # nolint
table(is.na(EU))

# 7 Check agian
head(EU)
tail(EU)
options(repr.plot.width = 4, repr.plot.height = 4)

# 8 check the distribution time serie data
hist(EU)

# 9 Create return series
EUR <- diff(log(EU)) # nolint
head(EUR)

# 10 check the distribution of return to see the appropiate statistic test
hist(EUR)

# 11 Estimate volatility(standard deviation) of return series
volatility_EU <- sd(EUR) # nolint
volatility_EU

# 12 get estimate of 99% and 95% worst case loss.
VaR99_EU <- qnorm(.99) * volatility_EU # nolint
VaR95_EU <- qnorm(.95) * volatility_EU # nolint

# 13 Print the VaR Values in %
VaR95_EU
VaR99_EU
