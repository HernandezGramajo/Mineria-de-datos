install.packages("arule")
install.packages("ggplot2")
library(arules)
library(ggplot2)
library(dplyr)




data2 = read.csv('C:\\Users\\wicho\\Documents\\Maestria\\Cuarto trimestre\\mineria de datos\\db_csv_\\db_csv_\\MIGRACION_BDP.csv', sep=',')
data2 <- data2 %>%
mutate(PEI5 = ifelse(PEI5 == 9999, 1999, PEI5))
View(data2)

valores_unicos <- unique(data2$PEI5)
print(valores_unicos)


reglas <- apriori(data2,parameter = list(support=0.2,confidence=0.5))

cluster <- kmeans(data2,centers=4)

ggplot(data2, aes(x =PEI5, y = PEI4 , color = as.factor(cluster$cluster)))+
geom_point()+
geom_point(data = as.data.frame(cluster$centers), aes(x =PEI5, y = PEI4), color = "black", size=4, shape=17)+
labs(title ="AÑO vs EDAD MIGRADO") + theme_minimal()

#GENERO MASCULINO
DATA_GENERO1 = subset(data2, PEI3==1)
cluster1 <- kmeans(DATA_GENERO1,centers=4)

ggplot(DATA_GENERO1, aes(x =PEI5, y = PEI4 , color = as.factor(cluster1$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster1$centers), aes(x =PEI5, y = PEI4), color = "black", size=4, shape=17)+
  labs(title ="AÑO vs EDAD MIGRADO (MASCULINO)") + theme_minimal()

#GENERO FEMENINO
DATA_GENERO2 = subset(data2, PEI3==2)
cluster2 <- kmeans(DATA_GENERO2,centers=4)

ggplot(DATA_GENERO2, aes(x =PEI5, y = PEI4 , color = as.factor(cluster2$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster2$centers), aes(x =PEI5, y = PEI4), color = "black", size=4, shape=17)+
  labs(title ="AÑO vs EDAD MIGRADO (FEMENINO)") + theme_minimal()
