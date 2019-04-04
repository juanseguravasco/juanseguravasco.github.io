# Vuex
Es un patrón de gestión de estado más una libreria para controlar el estado de nuestra aplicación. Proporciona un almacén de datos centralizado para todos los componentes de la aplicación y asegura que los datos sólo puedan cambiarse de forma controlada. Además se integra con las _DevTools_.

El flujo de datos de una aplicación podemos verlo (de manera muy simplificada) en el siguiente esquema:

![one-way data flow](https://vuex.vuejs.org/flow.png)

- El **estado** es el conjunto de datos de nuestra aplicación
- La **vista** representa el estado al usuario
- Las **acciones** son las formas en que podemos cambiar el estado, normalmente en respuesta a entradas del usuario desde la vista

El **estado** de los datos se representa en la **vista**, donde el usuario tiene herramientas que provocan **acciones** que modifican el **estado**. Este esquema funciona perfectamente cuando cada componente tiene su propio estado, pero empieza a dar problemas cuando el estado debe compartirse entre varios componentes. Para ese caso ya vimos soluciones como el _Event Bus_ o el _state management pattern_ pero son soluciones difícilmente mantenibles cuando nuestra aplicación crece. En aplicaciones medias o grandes es conveniente usar _Vuex_.

Vuex centraliza la forma en que nuestros componentes se comunican entre ellos. Con Vuex el flujo de datos podemos verlo de la siguiente manera:

![Vuex data flow](https://vuex.vuejs.org/vuex.png)

Los componentes de Vue peden emitir (**dispatch**) acciones que ejecutan un proceso (que puede ser asíncrono, por ejemplo una petición a una API). Cuando se resuelve la acción emite una confirmación (**commit**) que **muta** el _Estado_ de la aplicación (aquí podemos depurar con las _DevTools_) por lo que se renderiza el componente para mostrar el nuevo estado. En el estado almacenaremos tanto datos (accesibles desde cualquier componente) como métodos que se utilicen en más de un componente.

El uso de Vuex implica mayor complejidad en nuestra aplicación por lo que es recomendable su uso en aplicaciones de tamaño medio o grande. Para aplicacioes pequeñas normalmente es suficiente con soluciones más simples como el _eventBus_ o un _store  pattern_ hecho por nosotros. Como dijo _Dan Abramov_, el creador de _Redux_ 
> Las librerías _Flux_ son como las gafas: lo sabrás cuando las necesites

## Instalar Vuex
Para usar Vuex debemos instalarlo como cualquier otro _plugin_:
```bash
npm install -S vuex
```

Además en el fichero principal de nuestra aplicación hay que registrarlo con
```bash
import Vuex from 'vuex'

Vue.use(Vuex)
```

### Usar Vuex
La forma de modificar los datos del almacén de Vuex es llamando a las mutaciones que hayamos definido para dichos datos. Podemos ver un ejemplo básico en Fiddle:

<script async src="//jsfiddle.net/n9jmu5v7/1269/embed/js,html,result/"></script>

### Saber más
* [Vuex](https://vuex.vuejs.org/)
* [Cómo Construir Aplicaciones Complejas y a Gran Escala Vue.js con Vuex](https://code.tutsplus.com/es/tutorials/how-to-build-complex-large-scale-vuejs-applications-with-vuex--cms-30952)
* [Vuex for Everyone](https://vueschool.io/courses/vuex-for-everyone)
* [VueJS: Introducción a vuex](https://elabismodenull.wordpress.com/2017/05/29/vuejs-introduccion-a-vuex/)
* [Managing State in Vue.js](https://medium.com/fullstackio/managing-state-in-vue-js-23a0352b1c87)
