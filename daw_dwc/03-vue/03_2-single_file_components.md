# Introducción
Declarar los componentes como hemos visto con `Vue.component()` en el fichero JS de la instancia genera varios problemas:
* Los nombres de los componentes deben ser únicos
* El HTML del template está en ese fichero en medio del JS lo que lo hace menos legible y el editor no lo resalta adecuadamente (ya que espera encontrar códgo JS no HTML)
* El HTML y el JS del componente están juntos pero no su CSS
* No podemos usar fácilmente herramientas para convertir SCSS a CSS, ES2015 a ES5, etc

Por tanto eso puede ser adecuado para proyectos pequeños pero no lo es cuando estos enpiezan a crecer.

La solución es guardar cada componente en un único fichero con extensión **.vue** que contendrá 3 secciones:
* \<template>: contiene todo el HTML del componente
* <script>: con el JS del mismo
* <style>: donde pondremos el CSS del componente
  
Aunque esto va contra la norma de tener el HTML, JS y CSS en ficheros separados en realidad están separados en diferentes secciones y todo junto en un único fichero con todo lo que necesita el componente.

La mayoría de editores soportan lestos ficheros (directamente o instalándoles algún plugin) por lo que el resaltado de las diferentes partes es correcto. Además con **vue-cli** podemos integrar fácilmente _Webpack_ de forma que podemos usar ES2015 y los preprocesadores más comunes (SASS, Pug/Jade, Stylus, ...) ya se se traducirá automáticamente a ES5, HTML5 y CSS3.
