# Garrafas
El problema de las garrafas consiste en: teniendo dos garrafas con capacidades X e Y, obtener una cantidad de agua Z en una de las garrafas. Los movimientos que se pueden utilizar son los siguientes:

* __Llenar X:__ llena la garrafa X, pasando a contener X litros.
* __Llenar Y:__ llena la garrafa Y, pasando a contener Y litros.
* __Vaciar X:__ llena la garrafa X, pasando a contener X litros.
* __Vaciar Y:__ llena la garrafa Y, pasando a contener Y litros.
* __Trasvasar de X a Y:__ paso agua de X a Y, hasta que se llena Y o se vacía X.
* __Trasvasar de Y a X:__ paso agua de Y a X, hasta que se llena X o se vacía Y.

## Búsqueda en espacio de estados
Consiste en recorrer todos los posibles estados del tablero hasta llegar a un estado objetivo o estado solución. En este caso el tablero está representado como una tupla de enteros (X, Y), que representan los contenidos de las garrafas.

Gracias al backtracking de prolog, podemos hacer búsquedas en profundidad de una manera simple.

## Contenido

* __garrafas.pl:__ contiene el código necesario para ejecutar la búsqueda con X = 3, Y = 4 y Z = 2.
* __garrafasGenerico.pl:__ permite ejecutar la búsqueda con valores de X, Y y Z dados por el usuario.

Para probarlo recomiendo ejecutar el archivo con SWI-Prolog, escribiendo "consulta." en el caso del primero, o "consulta(X,Y,Z)." en el genérico.
