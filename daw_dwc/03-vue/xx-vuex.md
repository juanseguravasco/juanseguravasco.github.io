# Vuex
Es un patrón de gestión de estado más una libreria que proporcionan un almacén de datos centralizado para todos los componentes de la aplicación y aseguran que los datos sólo puedan cambiarse de forma controlada. Además se integra con las _Dev tools_.

Ya vimos lo que es un _state management pattern_: un almacén donde tenemos tanto nuestros datos como los métodos que los modifican.

El flujo de datos  de una aplicación podemos verlo (de manera muy simplificada) en el siguiente esquema:

![one-way data flow](https://vuex.vuejs.org/flow.png)

El **estado** de los datos se representa en la **vista**, donde el usuario tiene herramientas que provocan **acciones** que modifican el **estado**. Pero cuando tenemos la aplicación dividida en componentes la cosa se complica porque hay varias vistas que pueden modificar los mismos datos.

Con Vuex el dicho flujo podemos verlo de la siguiente manera:

![Vuex data flow](https://vuex.vuejs.org/vuex.png)

El uso de Vuex implica mayor complejidad en nuestra aplicación por lo que es recomendable su uso en aplicaciones de tamaño medio o grande. Para aplicacioes pequeñas normalmente es suficiente con soluciones más simples como el _eventBus_ o un _store  pattern_ hecho por nosotros.

## Usar Vuex
La forma de modificar los datos del almacén de Vuex es llamando a las mutaciones que hayamos definido para dichos datos. Podemos ver un ejemplo básico en Fiddle:

<script async src="//jsfiddle.net/n9jmu5v7/1269/embed/js,html,result/"></script>



