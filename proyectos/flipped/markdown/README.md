<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Hacer documentación en GitHub Pages](#hacer-documentaci%C3%B3n-en-github-pages)
  - [Markdown](#markdown)
    - [Sintaxis](#sintaxis)
    - [Añadir vídeos](#a%C3%B1adir-v%C3%ADdeos)
    - [Editores](#editores)
    - [Utilidades](#utilidades)
      - [Usar emoticones](#usar-emoticones)
    - [Leer más](#leer-m%C3%A1s)
- [Publicar en gh-pages](#publicar-en-gh-pages)
  - [Publicar documentación sobre un repositorio](#publicar-documentaci%C3%B3n-sobre-un-repositorio)
  - [Publicar documentación no ligada a ningún repositorio](#publicar-documentaci%C3%B3n-no-ligada-a-ning%C3%BAn-repositorio)
  - [Crear nuestra documentació con Jekyll](#crear-nuestra-documentaci%C3%B3-con-jekyll)
    - [Instalación](#instalaci%C3%B3n)
    - [Uso básico](#uso-b%C3%A1sico)
  - [Leer más](#leer-m%C3%A1s-1)
- [Crear una Tabla de Contenidos (TOC) automáticamente](#crear-una-tabla-de-contenidos-toc-autom%C3%A1ticamente)
- [Conversiones de formato](#conversiones-de-formato)
  - [Convertir de HTML a MD](#convertir-de-html-a-md)
  - [Convertir PDF a MD](#convertir-pdf-a-md)
  - [Convertir MD a PDF](#convertir-md-a-pdf)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Hacer documentación en GitHub Pages
Vamos a ver cómo crear documentación en formato Markdown y cómo guardarlas en las GitHub Pages. El lenguaje es tan sencillo que normalmente no usaremos ningún editor de Markdown sino que escribiremos directamente en el bloc de notas o similar.

## Markdown
Es un lenguaje de marcas ligero. Su ventaja frente a otros lenguajes de marcado (como HTML) es que el fichero de texto con la información es mucho más legible.

### Sintaxis
Podemos ver las principales marcas a utilizar en innumerables páginas como:
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [Sintaxis Markdown](https://markdown.es/sintaxis-markdown)
* ...

Un resumen muy básico de las mismas es:
* cabeceras: # (# = h1, ## = h2, ..., ###### = h6)

> | Escribes | Obtienes |
> | -- | -- |
> | \# Título 1 | # Título 1 |

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
* tablas: se separan las columnas con \|

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

### Leer más
[Wikipedia](https://es.wikipedia.org/wiki/Markdown)

# Publicar en gh-pages
GitHub Pages es un servicio de GitHub que permite publicar documentación que está accesible en el dominio github.io.

Podemos publicar 2 tipos de documentación:
1. documentación sobre un repositorio cocreto
2. documentación no asociada a ningún repositorio

## Publicar documentación sobre un repositorio
Tenemos 3 opciones para guardar las páginas:
* en la rama master
* en una rama llamada gh-pages
* en un directorio llamado /docs en la rama master

La página principal que se abrirá automáticamente se debe llamar README.md, index.md o index.html.

Una vez creadas las paginas hay que activar las GitHub Pages para ese repositorio yendo a **Settings** y escogiendo dónde se encuentran.

[Settings](img/01-settings.png)

También podemos aplicar a nuestra documentación un tema de Jekyll.

La documentación estará accesible en la URL \<usuario>.github.io/\<repositorio>, donde \<usuario> se cambia por nuestro nombre de usuario de GitHub y \<repositorio> por el nombre de nuestro repositorio.

## Publicar documentación no ligada a ningún repositorio
En este caso lo que tenemos que hacer es crear en GitHub un nuevo repositorio que se debe llamar obligatoriamente \<usuario>.github.io. Allí podemos la documentación que ya aparecerá automáticamente publicada en dicha URL.

## Crear nuestra documentació con Jekyll
Una opción si queremos hacer una "web" de documentación más compleja es utlizar alguna herramienta como Jekyll que es como están hechas las GH Pages.

Jekyll es un generador de blogs que soporta MarkDown y recomendado para hacer gh-pages.

### Instalación
```[bash] 
$ sudo apt install ruby (se necesita versión >= 2.2.5)
```
Comprobamos si están instalados gcc, g++ y make
```[bash] 
$ gcc -v
$ g++ -v
$ make -v
```
Si falta alguno lo instalaremos.

Comprobamos si están instalados los headers de Ruby
```[bash] 
$ apt list --installed ruby-dev
ruby-dev/version... [instalado]
```
Si no lo instalaremos con:
```[bash] 
$ sudo install ruby-dev
```

Instalamos Jekyll y su bundler:
```[bash] 
$ sudo gem install jekyll
$ sudo gem install jekyll bundler
```

### Uso básico
Creamos nuestro sitio con:
```[bash] 
$ sudo jekyll new mipagina
```

Abrimos el fichero _config y cambiamos las configuraciones básicoas (nombre, ...)
```[bash] 
$ sudo gem install jekyll
```

## Leer más
* [What is GitHub Pages?](https://help.github.com/categories/github-pages-basics/)

* [Using Jekyll as a static site generator with GitHub Pages](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)

* [JONATHAN MCGLONE: Creating and Hosting a Personal Site on GitHub](http://jmcglone.com/guides/github-pages/)

# Crear una Tabla de Contenidos (TOC) automáticamente
Tenemos utilidades para crear automáticamente una tabla de contenidos en nuestro documento Markdown que tenga una entrada en la tabla para cada título de la página.

Una de estas utilidades es [doctoc](https://github.com/thlorenz/doctoc). La instalamos con npm:
```[bash]
npm install -g doctoc
```

Ahora indicamos el fichero/s al que le queremos crear la ToC:
```[bash]
doctoc README.md introduccion.md
```

Si indicamos un directorio creará la ToC para todos los ficheros que haya allí y en sus subdirectorios. Es lo más sencillo:
```[bash]
doctoc .
```

Si un fichero ya tiene una ToC de doctoc al volver a ejecutar el comando no añade una nueva sino que actualiza la existente. Las ToC van entre los comentarios
```[md]
\<!-- START doctoc -->
y
\<!-- END doctoc -->
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

# Conversiones de formato 

## Convertir de HTML a MD
Hay infinidad de herramientas que convierten de HTML a Markdown, como:
* Conversores en línea:
    * [Pandoc](http://pandoc.org/try/)
    * [https://domchristie.github.io/turndown/](https://domchristie.github.io/turndown/)
    * [http://fuckyeahmarkdown.com/](http://fuckyeahmarkdown.com/) (no es muy 'politicamete correcto' pero va bien)
    * ...
* Para instalar:
    * [html2text](https://github.com/aaronsw/html2text) (sobre Python)
    * [html-to-markdown](https://www.npmjs.com/package/html-to-markdown) (paquete npm)
    * [thephpleague/html-to-markdown](https://github.com/thephpleague/html-to-markdown) (paquete composer)
    * ...
    
## Convertir PDF a MD
Podemos utilizar alguno de los conversores en línea que existen como:
* [http://pdf2md.morethan.io/](http://pdf2md.morethan.io/)

## Convertir MD a PDF
Podemos usar conversores on-line
* [MARKDOWN to PDF](http://www.markdowntopdf.com/)

o instalar plugins para nuestro editor de texto (como Atom, ...).
