# 1. Tarea 1: Ejercicios Algebra Relacional 

Elaborado por Alejandro Fernandez del Valle Herrera

A01024998

- [1. Tarea 1: Ejercicios Algebra Relacional](#1-tarea-1-ejercicios-algebra-relacional)
- [2. Explicación de las tablas:](#2-explicación-de-las-tablas)
  - [2.1. COMPETENCIA](#21-competencia)
  - [2.2. PARTICIPANTE](#22-participante)
  - [2.3. PUNTOSACUMULADOS](#23-puntosacumulados)
  - [2.4. CLASIFICACION](#24-clasificacion)
- [3. Consultas](#3-consultas)
  - [3.1. Apellidos y nombre de los participantes de nacionalidad mexicana.](#31-apellidos-y-nombre-de-los-participantes-de-nacionalidad-mexicana)
  - [3.2. Apellidos, nombre y puntos acumulados de los participantes de USA.](#32-apellidos-nombre-y-puntos-acumulados-de-los-participantes-de-usa)
  - [3.3. Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.](#33-apellidos-y-nombre-de-los-participantes-que-se-clasificaron-en-primer-lugar-en-al-menos-una-competencia)
  - [3.4. Nombre de las competencias en las que intervinieron los participantes mexicanos.](#34-nombre-de-las-competencias-en-las-que-intervinieron-los-participantes-mexicanos)
  - [3.5. Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.](#35-apellidos-y-nombre-de-los-participantes-que-nunca-se-clasificaron-en-primer-lugar-en-alguna-competencia)
  - [3.6. Apellidos y nombre de los participantes siempre se clasificaron en alguna competencia.](#36-apellidos-y-nombre-de-los-participantes-siempre-se-clasificaron-en-alguna-competencia)
  - [3.7. Nombre de la competencia que aporta el máximo de puntos.](#37-nombre-de-la-competencia-que-aporta-el-máximo-de-puntos)
  - [3.8. Países (nacionalidades) que participaron en todas las competencias.](#38-países-nacionalidades-que-participaron-en-todas-las-competencias)
- [4. Nota para el prof](#4-nota-para-el-prof)


# 2. Explicación de las tablas:

Las tablas muestran una competencia de las olimpiadas. El propósito de estas tablas es describir a los competidores en un torneo de smash, donde se dividen en varias categorías.

Tablas iniciales:

## 2.1. COMPETENCIA

La competencia en la que se encuentran registrados las personas.

|Nombre| Tipo
|-|-|
ID|INTEGER
|NombreCompetencia | STRING|
|NumPtos| INTEGER|
|Tipo| STRING|

ID|NombreCompetencia|NumPtos|Tipo
-|-|-|-
1|meele no items | 100 | meele
2|Kirbymania | 50 | ultimate

## 2.2. PARTICIPANTE

El participante registrado en el torneo

|Nombre| Tipo
|-|-|
Número| INTEGER
Apellidos| STRING
Nombre| STRING
Nacionalidad| STRING

Número|Apellidos|Nombre|Nacionalidad
-|-|-|-
1|Fdez|Alex|mexico
2|Dias|Paco|mexico
3|Perez|Daniel|mexico
4|Smith|Jhon|Gringolandia

## 2.3. PUNTOSACUMULADOS

La cantidad de puntos que ha obtenido participante después de participar en las competencias

|Nombre| Tipo
|-|-|
Número|INTEGER
Puntos|INTEGER 
Competencia|INTEGER

Número|Puntos|Competencia
-|-|-
1|50|1
1|200|2
2|150|1
3|300|2
4|100|1


## 2.4. CLASIFICACION

La clasificación de los jugadores basados en la competencia que se encuentra.

Esta se crea a base de los resultados finales, y es una que resume datos

|Nombre| Tipo
|-|-|
NombreCompetencia|STRING
Número|INTEGER
Lugar|INTEGER

NombreCompetencia|Número|Lugar
-|-|-
meele no items|1|3
meele no items|2|1
meele no items|4|2
Kirbymania|1|2
Kirbymania|3|1

# 3. Consultas

## 3.1. Apellidos y nombre de los participantes de nacionalidad mexicana.

inicio con la tabla PARTICIPANTE, selecciono los que tenga nacionalidad mexicana, y saco la vista de los nombres de los participantes.

$$\Pi _{Apellidos, Nombre}(\sigma_{Nacionalidad = "Mexico"}(PARTICIPANTE))$$ (1)

> Estoy sacando una lista de los competidores mexicanos

## 3.2. Apellidos, nombre y puntos acumulados de los participantes de USA.

Tomo las tablas de puntos y un filtro de estadounidienses, y las combino, luego termino haciendo una proyeccion sobre eso para poder sacar mi tabla final.

$$\Pi _ {Apellidos, Nombre, Puntos} ((\Pi _{Apellidos, Nombre, ID}(\sigma_{Nacionalidad = "Gringolandia"}(PARTICIPANTE))) \bowtie (PUNTOSACUMULADOS))$$ (1)

> Cuantos puntos tiene cada estadounidience

## 3.3. Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.

Primero saco los primeros lugares,

$$\Pi _ {Apellidos, Nombre} \sigma_{Lugar = 1}((\Pi _{Apellidos, Nombre, Numero}(PARTICIPANTE)) \bowtie \Pi_{Numero, Lugar} (CLASIFICACION))$$ (1)

> Las personas que van ganando :3 (campeon)

## 3.4. Nombre de las competencias en las que intervinieron los participantes mexicanos.

tomo la tabla de particitpantes mexicanos, hago una referencia con la tabla de puntos, y tomo las actividades donde participan. Se obtiene el ID de la competencia y se restan esos id de la competencia. Esto es el negativo, entonces lo volvemos a restar. Porque no se cual es el simbolo de union exclusiva de un conjunto o si existe.

$$(COMPETENCIA) - ((COMPETENCIA) -  \Pi _ {Competencia} ((\Pi _{ID}(\sigma_{Nacionalidad = "Mexico"}(PARTICIPANTE))) \bowtie (PUNTOSACUMULADOS)))$$ (1)

> Las competencias populares entre los mexicanos

## 3.5. Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.

Se usa la tabla de los de primer lugar, y solo la invierto, osea tomo la original y les resto los de primer lugar. 

$$ \Pi _{Apellidos, Nombre}(PARTICIPANTE) - \Pi _ {Apellidos, Nombre} \sigma_{Lugar = 1}((\Pi _{Apellidos, Nombre, Numero}(PARTICIPANTE)) \bowtie \Pi_{Numero, Lugar} (CLASIFICACION))$$ (1)

> los que les debes de dar el premio de consolación

## 3.6. Apellidos y nombre de los participantes siempre se clasificaron en alguna competencia.

La gente que logro obtener una medalla 

$$\Pi _ {Apellidos, Nombre} \sigma_{Lugar < 4}((\Pi _{Apellidos, Nombre, Numero}(PARTICIPANTE)) \bowtie \Pi_{Numero, Lugar} (CLASIFICACION))$$ (1)

> Los ganadores de la competencia

## 3.7. Nombre de la competencia que aporta el máximo de puntos.

A esta le llamo la me vuelvo loco, tomo la misma tabla multiplicada por si misma, y saco solo los valores que sean menores, luego veo que valores me quedan y los resto de la tabla original porque eso significa que me queda solo el que no tiene un mayor, osea el numero mayor, y eso solo lo aplico a NumPuntos, donde despues tomo ese valor y lo comparo con la misma tabla para obtener su nombre, asi puedo hacer la multimplicacion sin problemas. Pero igual, me aloco, y de ahi tomo la misma tabla pero con nombres, solo filtro eso, y luego le quito el num puntos para que me regrese el nombre solamente. 

$$ \Pi {nombre} \sigma _{ (\Pi _{NumPtos} (COMPETENCIA) - \Pi _ {n} \sigma _{n < c} P _{n/c} (\Pi _{NumPtos} (COMPETENCIA) \times \Pi _{NumPtos} (COMPETENCIA))) = NumPtos} \Pi _{NumPtos, nombre} (COMPETENCIA)$$

> La competencia que mas me combiene

## 3.8. Países (nacionalidades) que participaron en todas las competencias.

Hago una union de las competencias en las que particiaparon, y sus puntos para poder obtener los paises. Uno la tabla de competencias. Luego por separado hago una tabla de los paises de competencias * pais, dandome todas las posibilidades, a esta le excluyo los paises que si compitieron de la tabla anterior, ahora tengo que paises no compitieron en todos, solo falta quitarle y listo.

Espero que me hayan entendido, pero yo si me entiendo, ntp.

$$ \Pi {Nacionalidad} (PARTICIPANTE) - ( (\Pi {Nacionalidad} \times \Pi {NombreCompetencia}COMPETENCIA) - \Pi _{Nacionalidad} ( PARTICIPANTE \bowtie PUNTOSACUMULADOS \bowtie COMPETENCIA))$$ (1)

> los países chafas

# 4. Nota para el prof

Perdón si es apenas legible, lo hice con dolor de cabeza y mareo