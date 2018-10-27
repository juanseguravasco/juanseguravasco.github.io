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
* Puede ser leída, por lo que no adecuada para almacenar información sensible pero sí para preferencias del usuario, marcadores de juegos, etc

Podríamos usar localStorage para almacenar localmente los datos con los que trabaja una aplicación web. Así conseguiríamos minimizan los accesos al servidor y que la velocidad de la aplicación será mucho mayor al trabajar con datos locales. Pero periódicamente debemos sincronizar la información con el servidor.

### Storage vs cookies
Ventajas de localStorage:
* 5 o 10 MB de almacenamiento frente a 4 KB de las cookies
* Todas cookies del dominio se envían al servidor con cada petición al mismo

Ventajas de las cookies:
* Soportadas por navegadores antiguos
* Las cookies ofrecen algo de protección frente a XSS (Cross-Site Scripting)/Script injection

### Cookies
Son pequeños ficheros de texto y tienen las siguientes limitaciones:
* Máximo 300 ccokies, si hay más se borran las antiguas
* Máximo 4 KB por cookie, si nos pasamos se truncará
* Máximo 20 cookies por dominio

Cada cookie puede almacenar los siguientes datos:
* Nombre de la cookie (obligatorio)
* Valor de la misma
* expires: timestamp en que se borrará (si no pone nada se borra al salir del dominio)
* max-age: en lugar de _expires_ podemos indicar aquí los segundos que durará la cookie antes de expirar
* path: ruta desde dónde es accesible (/: todo el dominio, /xxx: esa carpeta y subcarpetas). Si no se pone nada sólo lo será desde la carpeta actual
* domain: dominio desde el que es accesible. SI no ponemos nada lo será desde este dominio y sus subdominios
* secure: si aparece indica que sólo se enviará esta cookie con https

Un ejemplo de cookie sería:

```javascript
username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 UTC;
```

Se puede acceder a las coockies desde **document.cookie** que es una cadena con las cookies de nuestras páginas. Para trabajar con ellas conviene que creemos funciones para guardar, leer o borrar cookies, por ejemplo:
* Crear una nueva cookie

```javascript
function setCookie(cname, cvalue, cexpires, cpath, cdomain, csecure) {
  document.cookie = cname + "=" + cvalue + 
    (cexpires?";expires="+cexpires.toUTCString():"") + 
    (cpath?";path="+cpath:"") + 
    (cdomain?";domain="+cdomain:"") + 
    (csecure?";secure":"");  
}
```

* Leer una cookie

```javascript
function getCookie(cname) {
    if(document.cookie.length>0){
        start=document.cookie.indexOf(cname + "=");
        if (start!=-1) {   // Existe la cookie, busquemos dónde acaba su valor
            //El inicio de la cookie, el nombre de la cookie mas les simbolo '='
            start=start + nombre.length+1;
            //Buscamos el final de la cookie (es el simbolo ';')
            end=document.cookie.indexOf(";",start + cname.length + 1);
            if (end==-1) {   // si no encuentra el ; es que es la última cookie
                end=document.cookie.length;
            }
            return document.cookie.substring(start + cname.length + 1, end));
        }
    }
    return "";   // Si estamos aquí es que no hemos encontrado la cookie
}
```

* Borrar una cookie

```javascript
function delCookie(cname) {
    return document.cookie = cname + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;";
}
```

