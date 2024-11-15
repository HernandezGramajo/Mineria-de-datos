install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

hogar <- read.csv('C:/Users/wicho/Documents/Maestria/Cuarto trimestre/mineria de datos/db_csv_/db_csv_/HOGAR_BDP.csv', sep = ',')

arbol <- rpart(AREA ~
               PCH5+  # ¿Qué tipo de servicio sanitario tiene este hogar?
               PCH10  # ¿Cómo elimina la mayor parte de la basura en el hogar?         ,
                              data = hogar, method = "class")

rpart.plot(arbol, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, box.palette = "BuGn", 
           main ="Predicción de area", cex = 1)

casa <- data.frame(
  PCH5=c(2),
  PCH10=c(3)
  
)

result <- predict(arbol,casa, type="class")

result
