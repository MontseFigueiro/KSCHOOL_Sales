#crea una tabla al azar con la siguiente estructura:
#id de clinete
#ventasvarias por cliente
#objetivo el % de cada venta para cada cliente


id=c(1,1,1,1,2,2,2,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5)
ventas=c(123,20,47,190,30,29,500,1900,345,34,26,57,87,65,765,47,23,78,10,345,62,977,786,80,76,34,23,10)

datosventas <- data.frame(id,ventas)
datosventas
totales <- ddply(datosventas,.(id),summarize,Total=sum(ventas))
totales
acumulados <- ddply(datosventas, .(id), transform, cumsum = cumsum(ventas))
acumulados

#Solucion correcta
porcentages <- ddply(datosventas, .(id), transform, pct = ventas/sum(ventas))
porcentages


#segunda forma
install.packages("dplyr")
library(dplyr)
porcentajesventas <- group_by(datosventas, id) %>% mutate(percent = ventas/sum(ventas))
