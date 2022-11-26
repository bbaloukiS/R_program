library(quantmod)

getSymbols("DEXUSEU", src = "FRED")
sum(is.na(DEXUSEU))

head(DEXUSEU)
tail(DEXUSEU)
chartSeries(DEXUSEU)

EU <- DEXUSEU["2010-01-01::"] # nolint
EU <- ifelse(is.na(EU), coredata(mean(EU, na.rm = TRUE)), EU) # nolint
table(is.na(EU))


head(EU)
tail(EU)

options(repr.plot.width = 4, repr.plot.height = 4)
hist(EU)

EUR <- diff(log(EU)) # nolint
head(EUR)
hist(EUR)

volatility_EU <- sd(EUR) # nolint
volatility_EU

VaR99_EU <- qnorm(.99) * volatility_EU # nolint
VaR95_EU <- qnorm(.95) * volatility_EU # nolint

VaR95_EU
VaR99_EU
