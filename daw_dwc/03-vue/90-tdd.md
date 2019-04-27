# Desarrollo guiado por pruebas (TDD)
Es una forma de programar que consiste en escribir primero las pruebas que deba pasar el código (Test Dirve Development) y después refactorizarlo ([Refactoring](https://es.wikipedia.org/wiki/Refactorizaci%C3%B3n)). Para escribir las pruebas generalmente se utilizan las [pruebas unitarias](https://es.wikipedia.org/wiki/Prueba_unitaria) (unit test en inglés). 

El ciclo de programación usando TDD tiene tres fases:
1. Fase _roja_: escribimos el test que cumpla los requerimientos y lo pasamos. Fallará ya que nuestro código no pasa el est (de hecho la primera vez no tenemos ni código)
1. Fase _verde_: conseguimos que nuestro código pase el test. Ya funciona aunque seguramente no estará muy bien escrito
1. _Refactorización_: mejoramos nuestro código


En primer lugar, se escribe una prueba y se verifica que las pruebas fallan. A continuación, se implementa el código que hace que la prueba pase satisfactoriamente y seguidamente se refactoriza el código escrito. El propósito del desarrollo guiado por pruebas es lograr un código limpio que funcione. La idea es que los requisitos sean traducidos a pruebas, de este modo, cuando las pruebas pasen se garantizará que el software cumple con los requisitos que se han establecido.

Para ello debemos en primer lugar se debe definir una lista de requisitos y después se ejecuta el siguiente ciclo:
1. Elegir un requisito: Se elige de una lista el requisito que se cree que nos dará mayor conocimiento del problema y que a la vez sea fácilmente implementable.
1. Escribir una prueba: Se comienza escribiendo una prueba para el requisito. Para ello el programador debe entender claramente las especificaciones y los requisitos de la funcionalidad que está por implementar. Este paso fuerza al programador a tomar la perspectiva de un cliente considerando el código a través de sus interfaces.
1. Verificar que la prueba falla: Si la prueba no falla es porque el requisito ya estaba implementado o porque la prueba es errónea.
1. Escribir la implementación: Escribir el código más sencillo que haga que la prueba funcione. Se usa la expresión "Déjelo simple" ("Keep It Simple, Stupid!"), conocida como principio KISS.
1. Ejecutar las pruebas automatizadas: Verificar si todo el conjunto de pruebas funciona correctamente.
1. Eliminación de duplicación: El paso final es la refactorización, que se utilizará principalmente para eliminar código duplicado. Se hace un pequeño cambio cada vez y luego se corren las pruebas hasta que funcionen.
1. Actualización de la lista de requisitos: Se actualiza la lista de requisitos tachando el requisito implementado. Asimismo se agregan requisitos que se hayan visto como necesarios durante este ciclo y se agregan requisitos de diseño (P. ej que una funcionalidad esté desacoplada de otra).

Tener un único repositorio universal de pruebas facilita complementar TDD con otra práctica recomendada por los procesos ágiles de desarrollo, la "Integración Continua". Integrar continuamente nuestro trabajo con el del resto del equipo de desarrollo permite ejecutar toda batería de pruebas y así descubrir si nuestra última versión es compatible con el resto del sistema. Es recomendable y menos costoso corregir pequeños problemas cada pocas horas que enfrentarse a problemas enormes cerca de la fecha de entrega fijada.

(Fuente [Wikipedia](https://es.wikipedia.org/wiki/Desarrollo_guiado_por_pruebas)).

## Uasr TDD en Javascript
Lo más sencillo es usar alguna librería como **Mocha**. Se trata de un gramework que se ejecuta sobre _Node.js_ y permite crear tests tanto síncronos como asíncronos. Para usarlo necesitaremos tener **npm** instalado. Luego creamos una carpeta para nuestro proyecto y dentro ejecutamos:

```bash
npm init
npm install -S mocha
```


