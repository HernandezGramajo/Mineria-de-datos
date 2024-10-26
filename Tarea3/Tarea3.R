install.packages("C:/Users/wicho/Downloads/fim4r_1.8.tar.gz", repos = NULL, type = "source")
install.packages("jsonlite", type = "source")
library(fim4r)

data = read.csv('C:\\Users\\wicho\\Documents\\Maestria\\Cuarto trimestre\\mineria de datos\\db_csv_\\db_csv_\\MIGRACION_BDP.csv', sep=',')
View(data)


reglas <- fim4r.fpgrowth(data, supp = 0.2, conf = 0.5)

View(reglas)
