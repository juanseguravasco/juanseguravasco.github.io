# Documentación en GitHub Pages
## Publicar en gh-pages
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
```[bash] $ sudo apt install ruby (se necesita versión >= 2.2.5)
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
```[bash] $ sudo install ruby-dev```

Instalamos Jekyll y su bundler:
```[bash] 
$ sudo gem install jekyll
$ sudo gem install jekyll bundler
```

### Uso básico
Creamos nuestro sitio con:
```[bash] $ sudo jekyll new mipagina```

Abrimos el fichero _config y cambiamos las configuraciones básicoas (nombre, ...)

```[bash] $ sudo gem install jekyll```


## Leer más
* [What is GitHub Pages?](https://help.github.com/categories/github-pages-basics/)

* [Using Jekyll as a static site generator with GitHub Pages](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)

* [JONATHAN MCGLONE: Creating and Hosting a Personal Site on GitHub](http://jmcglone.com/guides/github-pages/)

---

|[<- Anterior](README.md)| |[Siguiente ->](publicar.md)|
|:-----------------------|-|--------------------------:|
