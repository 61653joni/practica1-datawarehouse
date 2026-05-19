# practica1-datawarehouse
Buscar errores o anomalías de la base de datos, dar una solución


# Diagnóstico 

Durante la fase de busqueda y análisis del dataset de e-commerce, se identificaron distintas anomalías y comportamiento relevante dentro de la información transaccional. Estas observaciones permiten detectar posibles problemas de calidad de datos que podrían afectar el análisis posterior si no se realiza un proceso adecuado de limpieza y transformación

## 1. Valores negativos en la columna Quantity 

Se detectaron registros con valores negativos en la columna 'Quatity'

## Posibles Causas 

Estos valores podrían ser una represetación:
Devolución de productos. Cancelaciones de pedidos

## Problema 

Si estos registros se cargan directamente al data Warehouse, las ventas totales podrían calcularse incorrectamente, los ingresos financieros se verían alterados, los reportes de inventario perderían validez o precesión

## Solución 

Clasificar devoluciones por separado, excluir registros negativos según las necesidades de investigación


## 2. Repetición de valores InvoiceNo

Se observó que varios registros comparten el mismo número de factura 

##  Posibles Causas 
Esto no necesariamente representa un error, ya que una misma factura puede contar múltiples productos distintos

## Ejemplo 
Una compra puede incluir varios articulos, cada articulos, cada articulo genera una fila diferente pero mantiene el mismo InvoiceNo

## Problema 
Si no se comprende correctamente la estructura, podrían interpretarse incorrectamente como duplicados,podrían elimanarse registros válidos

## Solución 

Utilizar el ETL, validar duplicados exactos, conservar registros que represente diferentes productos dentro de la misma factura 

## 3. Facturas con letras en InvoiceNo

Se econtraron valores en Invoice que contiene letras además de números

## Ejemplo 
C536391


## Posibles Causas 
La letra C normalmente indice, facturas canceladas, ordenes revertidas

## Problema

Si se mexclan con ventas normales, se alteran los indicadores finacierons, las métricas de ventas pierden exactidud

## Solucion 

Utilizar tambien el ETL, identificar facturas canceledas, separarlas o excluirlas del análisis principal

## Descripciones inconsistentes en Descripción 

La columna descripción contiene nombres inconsistentes, textos irregulares, formatos diferentes entre productos similares

## Problemas 

Esto puede provocar, productos duplicados con nombres distintos, errores en agrupaciones analiticas, inconsistencia en reportes de productos

## Solución 

Limpiar caracteres especiales, eliminar espacios innecasarios

## 5. Valores especiales en StockCode 

## Ejemplo Post 

POST

## Posibles causas
Estos valores parecen representar, costos en envio, cargos adicionales, servicios lógisticos, 


## 6. Espacios vacios

Algunos espacios en excel tiene no tienem contenirdo, ya sea en despricipción, Id, invoicedate