<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Documentación en GitHub Pages](#documentaci%C3%B3n-en-github-pages)
  - [Markdown](#markdown)
    - [Sintaxis](#sintaxis)
    - [Añadir vídeos](#a%C3%B1adir-v%C3%ADdeos)
    - [Editores](#editores)
    - [Utilidades](#utilidades)
      - [Usar emoticones](#usar-emoticones)
  - [Leer más](#leer-m%C3%A1s)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Documentación en GitHub Pages
Vamos a ver cómo crear documentación en formato Markdown y cómo guardarlas en las GitHub Pages.

## Markdown
Es un lenguaje de marcas ligero. Su ventaja frente a otros lenguajes de marcado (como HTML) es que el fichero de texto con la información es mucho más legible.

### Sintaxis
Podemos ver las principales marcas a utilizar en innumerables páginas como:
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [Sintaxis Markdown](https://markdown.es/sintaxis-markdown)
* ...

Un resumen muy básico de las mismas es:
* cabeceras: # (# = h1, ## = h2, ..., ###### = h6)
* nuevo párrafo: línea en blanco de separación (es decir, 2 intros)
* nueva línea: 2 espacios seguidos
* regla horizontal: 3 = o - o *
* cursiva: texto entre * o _ (sin espacios)
* negrita: igual pero entre 2 * o 2 _
* listas desordenadas: * y espacio al principio de la línea
* listas ordenadas: nº, punto y espacio
* sublistas: igual pero precedidas por 4 espacios en blanco
* enlaces: \[texto a mostrar](url). Opcionalmente podemos poner un título en los paréntesis: \[texto](url "titulo")
* imágenes: igual pero precedidas de !, !\[texto alternativo](url "título, opcional")
* código: entre \` para mostrarlo en la línea o para un bloque de texto tres \` (pueden ir seguidas del lenguaje entre corchetes) y al final del bloque 3 más para cerrarlo
* citas: el párrafo debe comenzar por >

Podemos incluir código HTML en nuestro documento y también lo interpretará el navegador

### Añadir vídeos
En principio no se pueden incluir vídeos pero es sencillo hacerlo de varias formas. Una de las más 'limpias' es crear una página HTML (podemos llamarla youtubePlayes.html) dentro del directorio \_includes con el código:

```[HTML]
<iframe width="560" height="315" src="https://www.youtube.com/embed/{{ include.id }}" frameborder="0" allowfullscreen></iframe>
```

Donde queremos que se muestre el vídeo ponemos el código:
```[HTML]
{\% include youtubePlayer.html id=page.youtubeId %}
```
Si queremos mostrar vídeos de Vimeo podemos crear la página vimeoPlayer.html con el código:

```[HTML]
<iframe src="https://player.vimeo.com/video/{{ include.id }}" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
```

Fuente: [http://adam.garrett-harris.com/how-to-easily-embed-youtube-videos-in-jekyll-sites-without-a-plugin/](http://adam.garrett-harris.com/how-to-easily-embed-youtube-videos-in-jekyll-sites-without-a-plugin/)

### Editores
Es tan simple utilizar el lenguaje Markdown que posiblemente no usemos ningún editor pero si queremos existen uchos a nuestra disposición:
* en línea:
    * [Dillinger](https://dillinger.io/)
    * [Markable](https://markable.in/accounts/login/?next=/editor/) (hay que registrarse)
    * [Dingus](https://daringfireball.net/projects/markdown/dingus)
    * ...
* de escritorio
    * Haroopad
    * Mango
    * Focused (para Mac)
    * ...
    
### Utilidades
Aquí aparecen varias utilidades o cosas que podemos usar e MD.

#### Usar emoticones
Se pone su 'nombre' entre caracteres :, fácil ¿no? : :blush:

Hay muchas [páginas](https://gist.github.com/rxaviers/7360908) donde aparecen los nombres de los emoticonos.

## Leer más
[Wikipedia](https://es.wikipedia.org/wiki/Markdown)

---

| | |[Siguiente ->](publicar.md)|
|-|-|-------------------------:|
