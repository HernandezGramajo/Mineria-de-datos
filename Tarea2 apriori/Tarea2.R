install.packages("arule")
library(arules)

data <- read.csv('C:\\Users\\wicho\\Documents\\Maestria\\Cuarto trimestre\\mineria de datos\\db_csv_\\db_csv_\\PERSONA_BDP.csv', sep=",")
View(data$PEA)
data <- data[, !names(data) %in% "PEA"]
data <- data[, !names(data) %in% "POCUPA"]
data <- data[, !names(data) %in% "PEI"]

reglas <- apriori(data,parameter = list(support=0.2,confidence=0.5))

inspect(reglas[0:100])
inspect(reglas[100:200])
inspect(reglas[2300:2400])
