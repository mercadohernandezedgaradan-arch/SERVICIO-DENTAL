library(DBI)
library(RSQLite)
library(ggplot2)

# 1. Conectar a la base de datos real en Documentos
conexion <- dbConnect(RSQLite::SQLite(), dbname = "proyecto servicio_dental.db")

# 2. Comprobar la conexión activa
print(conexion)

# 3. Listar las tablas disponibles
tablas_db <- dbListTables(conexion)
cat("Tablas en la Base de Datos:\n")
print(tablas_db)

# 4. Consultar y extraer datos de las tablas reales
df_pedidos <- dbGetQuery(conexion, "SELECT * FROM PEDIDO;")
df_clientes <- dbGetQuery(conexion, "SELECT * FROM cliente;")
df_repartidores <- dbGetQuery(conexion, "SELECT * FROM repartidor;")

# 5. Análisis Exploratorio Estadístico
cat("\n--- Resumen Estadístico de Pedidos ---\n")
print(summary(df_pedidos))

# 6. Gráfico Exploratorio con ggplot2 (Costo por Tipo de Servicio)
g_pedidos <- ggplot(df_pedidos, aes(x = TIPO_SERVICIO, y = COSTO, fill = TIPO_SERVICIO)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Distribución de Costos por Tipo de Servicio",
    x = "Tipo de Servicio",
    y = "Costo ($)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1),
    legend.position = "none"
  )

print(g_pedidos)

# 7. Desconectar de la base de datos
dbDisconnect(conexion)
print("\nConexión cerrada exitosamente.")