<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Hacer documentación con Markdown](#hacer-documentaci%C3%B3n-con-markdown)
  - [Markdown](#markdown)
    - [Sintaxis](#sintaxis)
    - [Añadir vídeos](#a%C3%B1adir-v%C3%ADdeos)
    - [Editores](#editores)
    - [Leer más](#leer-m%C3%A1s)
- [Utilidades](#utilidades)
  - [Usar emoticones](#usar-emoticones)
  - [Crear una Tabla de Contenidos (TOC) automáticamente](#crear-una-tabla-de-contenidos-toc-autom%C3%A1ticamente)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Hacer documentación con Markdown
Vamos a ver cómo crear documentación en formato Markdown y cómo guardarlas en las GitHub Pages. El lenguaje es tan sencillo que normalmente no usaremos ningún editor de Markdown sino que escribiremos directamente en el bloc de notas o similar.

## Markdown
Es un lenguaje de marcas ligero. Su ventaja frente a otros lenguajes de marcado (como HTML) es que el fichero de texto con la información es mucho más legible.

### Sintaxis
Podemos ver las principales marcas a utilizar en innumerables páginas como:
- [Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [Sintaxis Markdown](https://markdown.es/sintaxis-markdown)
* ...

Un resumen muy básico de las mismas es:
* cabeceras: # (# = h1, ## = h2, ..., ###### = h6)

Ejemplo **escribes**:
```md
# Título 1  
## Título 2  
### Título 3
```

**Obtienes**:
> # Título 1
> ## Título 2
> ### Título 3

* nuevo párrafo: línea en blanco de separación (es decir, 2 intros)
* nueva línea: 2 espacios seguidos
* regla horizontal: 3 = o - o *

**Escribes**:
```md
***
```

**Obtienes**:
> ***

* cursiva: texto entre * o _ (sin espacios). Ej. `*cursiva*` -> _cursiva_
* negrita: igual pero entre 2 * o 2 _  Ej. `**negrita**` -> __negrita__
* negrita y cursiva: se ponen ambas. Ej. `**_negrita y cursiva_**`-> **_negrita y cursiva_**
* tachado: texto entre ~~ . Ej. `~~tachado~~` -> ~~tachado~~
* listas desordenadas: * o - seguidos de espacio al principio de la línea. Para hacer sublistas tabulamos con 4 espacios en blanco

**Escribes**:
```md
- Item 1  
    - Item 1.1  
    - Item 1.2  
- Item 2
```

**Obtienes**:
> * Item 1
>   * Item 1.1
>   * Item 1.2
> * Item 2

* listas ordenadas: nº, punto y espacio

**Escribes**:
```md
1. Item 1  
    1. Item 1.1  
    1. Item 1.2  
1. Item 2
```

**Obtienes**:
> 1. Item 1
>     1. Item 1.1
>     1. Item 1.2
> 1. Item 2

* checklists: al principio de cada línea pones \[ ] si quieres que aparezca desmarcada o \[\*] si la quieres marcada:

**Escribes**:
```md
- [ ] Item 1  
- [x] Item 2  
- [ ] Item 3  
```

**Obtienes**:
> - [ ] Item 1  
> - [x] Item 2  
> - [ ] Item 3  

* código: entre \` para mostrarlo en la línea o para un bloque de texto tres \` (acentros graves, seguidos opcionalmente del lenguaje) y al final del bloque 3 acentos más para cerrarlo. Ej.: ``código`` ->  `código`

**Escribes**:
```md
```html  
<h1>Hola</h1>  
``\`
```

**Obtienes**:
> ```html
> <h1>Hola</h1>
> ```

* enlaces: \[texto a mostrar](url). Ej: `[Wikipedia](http://wikipedia.org)` -> [Wikipedia](http://wikipedia.org)  
Opcionalmente podemos poner un título en los paréntesis: \[texto](url "titulo")
* imágenes: igual pero precedidas de !, !\[texto alternativo](url "título, opcional")
* citas: el párrafo debe comenzar por > (son todos los ejemplos de _Escribes_ ... _Obtienes_)
* tablas: se separan las columnas con \|

**Escribes**:
```md
Encab 1 | Encab 2  
--|--  
dato 1.1 | dato 1.2  
dato 2.1 | dato 2.2  
dato 3.1 | dato 3.2
```

**Obtienes**:
> Encab 1 | Encab 2
> --|--
> dato 1.1 | dato 1.2
> dato 2.1 | dato 2.2
> dato 3.1 | dato 3.2

Podemos incluir código HTML en nuestro documento y también lo interpretará el navegador

**Escribes**:
```md
<p align="center">Párrafo con <b>Negrita</b> y centrado</p>
```

**Obtienes**:
> <p align="center">Párrafo con <b>Negrita</b> y centrado</p>

### Añadir vídeos
En principio no se pueden incluir vídeos pero es sencillo hacerlo de varias formas. Una de las más 'limpias' es crear una página HTML (podemos llamarla youtubePlayes.html) dentro del directorio \_includes con el código:

```html
<iframe width="560" height="315" src="https://www.youtube.com/embed/{{ include.id }}" frameborder="0" allowfullscreen></iframe>
```

Donde queremos que se muestre el vídeo ponemos el código:
```html
{\% include youtubePlayer.html id=page.youtubeId %}
```
Si queremos mostrar vídeos de Vimeo podemos crear la página vimeoPlayer.html con el código:

```html
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
    
### Leer más
[Wikipedia](https://es.wikipedia.org/wiki/Markdown)

# Utilidades
Aquí aparecen varias utilidades o cosas que podemos usar en MD.

## Usar emoticones
Se pone su 'nombre' entre caracteres :, fácil ¿no? : :blush:

Hay muchas [páginas](https://www.webfx.com/tools/emoji-cheat-sheet/) donde aparecen los nombres de los emoticonos.

## Crear una Tabla de Contenidos (TOC) automáticamente
Tenemos utilidades para crear automáticamente una tabla de contenidos en nuestro documento Markdown que tenga una entrada en la tabla para cada título de la página.

Una de estas utilidades es [doctoc](https://github.com/thlorenz/doctoc). La instalamos con npm:
```bash
$ npm install -g doctoc
```

Ahora indicamos el fichero/s al que le queremos crear la ToC:
```bash
$ doctoc README.md introduccion.md
```

Si indicamos un directorio creará la ToC para todos los ficheros que haya allí y en sus subdirectorios. Es lo más sencillo:
```bash
$ doctoc .
```

Si un fichero ya tiene una ToC de doctoc al volver a ejecutar el comando no añade una nueva sino que actualiza la existente. Las ToC van entre los comentarios
```md
<!-- START doctoc -->
y
<!-- END doctoc -->
```

Por defecto creará la ToC al principio del fichero pero si la queremos en otro sitio sólo tenemos que poner allí estas etiquetas.

Algunas opciones útiles son:
* **--title**: para especificar el título de la ToC, en formato md. Ej.: `doctoc --title '**Índice**'`
* **--maxlevel**: para limitar el número de niveles a mostrar en la ToC. Ej.: `doctoc --maxlevel 3`
* podemos también indicar que la ToC generada sea compatible con los sitios más comunes:
  * *--gitgub*
  * *--gitlab*
  * *--nodejs*
  * *--ghost*
  * *--bitbucket*
