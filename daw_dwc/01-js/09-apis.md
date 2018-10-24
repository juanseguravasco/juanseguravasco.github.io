# Utilidades: Geolocalización. Local Storage. API de Google Maps

## Introducción
En este tema varemos diferentes APIs incluidas en HTML5 (como la de Local Storage) y otras que se han hecho muy populares como la de Google Maps.

HTML5 incluye un buen número de APIs que facilitan el trabajo con cosas complejas, como
* APIs para manejo de audio y vídeo
* APIs para manejo de formularios
* API de dibujo canvas (en el módulo de DIW)

Aquí comentaremos Storage, Drag&Drop, Geolocation, File Access, Communication, Web Workers, History y Offline

## Almacenamiento en el cliente: API Storage
Antes de HTML5 la única manera que tenían los programadores de guardar algo en el navegador del cliente (como sus preferencias, su idioma predeterminado para nuestra web, etc) era utilizando _cookies_. Las cookies tienen muchas limitaciones (como vermoes más adelante) y es engorroso trabajar con ellas. 

HTML5 incorpora **localStorage** y **sessionStorage** que son un espacio de almacenamiento local de 5 MB o 10 MB por sitio web, según el navegador (que es mucho más de lo que teníamos con las cookies). La principal diferencia entre ellos es que la información almacenada en localStorage nunca expira, permanece allí hasta que la borremos (nosotros o el usuario) mientras que la almacenada en sessionStorage se elimina automáticamente al cerrar la sesión el usuario.

Mediante Javascript puedo saber si el navegador soporta o no esta API simplemente mirando su typeof:

```javascript
if (typeof(Storage)===”undefined”)    // NO está soportado
```

Tanto localStorage como sessionStorage son como un objeto global al que tengo acceso desde el código. Lo que puedo hacer con ellos es:
* Guardar un dato: `localStorage.setItem(“dato”, ”valor”);` o también `localStorage.dato=”valor”;`
* Recuperar un dato: `let miDato=localStorage.getItem(“dato”);` o también `let miDato=localStorage.dato;`
* Borrar datos: `localStorage.removeItem(“dato”);` para borrar 'dato'. Si quiero borrar TODO lo que tengo `localStorage.clear();`
* Guardar un objetos (o arrays): lo guardamos en JSON, `localStorage.setItem(“dato”, JSON.stringify(”objeto”);`
* Recuperar el objeto: ` ler miObjeto=JSON.parse(localStorage.getItem(“dato”));`
* Cómo saber cuántos datos tenemos: `localStorage.length;`

Cada vez que cambia la información que tenemos en nuestro localStorage se produce el evento **storage**. Si, por ejemplo, queremos que una ventana actualice su información si otra cambia algún dato del storage haremos:

```javascript
window.addEventListener(“storage”, actualizaDatos);
```

y la función 'actualizaDatos' podrá leer de nuevo lo que hay y actuar en consecuencia.

### A tener en cuenta
_localStorage_, _sessionStorage_ y _cookies_ almacenan información en un navegador específico del cliente, y por tanto:
* No podemos asegurar que permanecen ahí
* Puede ser borrada/manipulada
* Puede ser leída, por lo que no adecuada para información sensible. Sí para:
Preferencias del usuario
Marcadores de juegos
