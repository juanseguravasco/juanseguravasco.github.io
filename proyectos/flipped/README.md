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
```
{% include youtubePlayer.html id=page.youtubeId %}
```
Si queremos mostrar vídeos de Vimeo podemos crear la página vimeoPlayer.html con el código:

```[HTML]
<iframe src="https://player.vimeo.com/video/{{ include.id }}" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
```

Fuente: [http://adam.garrett-harris.com/how-to-easily-embed-youtube-videos-in-jekyll-sites-without-a-plugin/]

