# aWords
Proyecto para las materias 'SEMINARIO DE APLICACIÓN PROFESIONAL' y 'TRABAJO FINAL DE INGENIERÍA' de la carrera de Ing. en Sistemas Informaticos. Es una aplicación para crear notas con etiquetas o "tags", con las cuales se generarán recomendaciones para el lector de forma dinámica. También se usará la información recaudada de las lecturas para mejorar la experiencia de crear nuevo contenido.


## Codigo
Buildear antes de ejecutar el proyecto.

Versiones de Visual Studio: 2017 y 2019.


## Base de Datos
Versiones de SSMS 17 y 18. Scripts generados para version 2017, compatibles con 2019.

Ubicacion del script: `\script.sql`


## Error de dependencias
En caso de tener un error de dependencias NuGet al descargar el proyecto, es necesario agregar la fuente de paquetes (package source). Para esto, ir a *Tools > Nuget Package Manager > Package Manager Settings*. Debajo de Nuget '*Package Manager*', seleccionar '*Package Sources*'. En caso de no existir, agregar la siguiente fuente de paquetes:
 - Nombre: `nuget.org`
 - Fuente: `https://api.nuget.org/v3/index.json`

Una vez creado, volver a buildear la solución.


## Usuarios
Existen cuatro diferentes usuarios, uno por cada rol, cuyas contraseñas son siempre `admin`.
 - admin
 - lector
 - escritor
 - tecnico
