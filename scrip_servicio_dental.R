library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), dbname = "C:/Users/Acer/Downloads/proyecto servicio_dental.db")
dbListTables(con)
dbDisconnect(con)