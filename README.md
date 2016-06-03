###Ejemplo cálculo Data Frame en R con ddply
Vamos a crear un tabla con dos variables, id.cliente e importe de la compra. Cada cliente tiene varias compras. 
Tenemos que crear una tercera columna con el % que representa esa compra sobre el total de compras que realizó ese cliente.

Creamos dos vectores id y ventas
```r
id=c(1,1,1,1,2,2,2,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5)
ventas=c(123,20,47,190,30,29,500,1900,345,34,26,57,87,65,765,47,23,78,10,345,62,977,786,80,76,34,23,10)
```
Creamos un data.frame a partir de los dos vectores de variables
```r
datosventas <- data.frame(id,ventas)
datosventas
```
Data frame con la suma total de compras por id
```r
totales <- ddply(datosventas,.(id),summarize,Total=sum(ventas))
totales
```
Datosventas con una tercera columna que hace el acumulado de la columna ventas por id
```r
acumulados <- ddply(datosventas, .(id), transform, cumsum = cumsum(ventas))
acumulados
```

####Solucion con ddply
```r 
porcentages <- ddply(datosventas, .(id), transform, pct = ventas/sum(ventas))
porcentages
```

####Otra opción
```r
install.packages("dplyr")
library(dplyr)
porcentajesventas <- group_by(datosventas, id) %>% mutate(percent = ventas/sum(ventas))
```
