# Crear una API REST con Laravel

## Crear el modelo
Pasos básicos:
* creamos el sitio y la BBDD en Homestead.yaml
* creamos el proyecto `php laravel new laborexchange`
* configuramos el .env
* hacemos el php artisan migrate que creará las tablas users y password_resets

Para crear cada tabla haremos:
php artisan make:model Empresa -m

Esto crea 2 ficheros:
* /app/Empresa.php: modelo
* /database/migrations/create_empresas_table: fichero de migraciones que hay que editar para definar los campos:

public function up() {
    Schema::create('empresas', function (Blueprint $table) {
        $table->increments('id');
        $table->string('cif')->unique();
        $table->string('nombre');
        $table->string('localidad');
        $table->string('contacto');
        $table->string('telefono');
        $table->string('web');
        $table->string('email');
        $table->string('descripcion');
        $table->timestamps();
    });
}

Ahora creamos la tabla asociada Ofertas:
php artisan make:model Oferta -m

public function up() {
    Schema::create('ofertas', function (Blueprint $table) {
        $table->increments('id');
        $table->integer('empresa_id')->unsigned();
        $table->string('descripcion');            
        $table->string('puesto');
        $table->string('contrato');
        $table->string('contacto');
        $table->string('telefono');
        $table->string('email');
        $table->integer('any')->unsigned();
        $table->boolean('activa');
        $table->boolean('validada');
        $table->boolean('archivada');
        $table->timestamps();
    });
}
La clave ajena se llama como tabla_clave (snake case).

Ahora definimos las relaciones. En Empresa.php añadimos una función:
public function ofertas() {
    return $this->hasMany(Oferta::class);
}

Y lo mismo hacemos en Oferta.php:
public function empresa() {
    return $this->belongsTo(Empresa::class);
}



Fuente: 
* [Laravel 5.6 CRUD Tutorial With Example](https://appdividend.com/2018/02/23/laravel-5-6-crud-tutorial/)
* [Laravel Model Relationships Example](https://appdividend.com/2018/05/16/laravel-model-relationships-example/)

## Crear la API
En un APIRest a los Modelos  se les denomina Recursos. Lo primero es crear un controlador y ponerla la opción -r para que lo cree como un controlador de Recursos (por lo que creará los métodos paralos verbos HTTP):
```bash
php artisan make:controller OfertasController –resource
```

A continuación creamos su ruta asociada en **/routes/api.php**:
```php
Route::resource(‘Oferta’,’OfertasController’,[‘only’=>[‘index’,’store’,’show’,’update’,’destroy’ ]]);
```
La opción _only_ permite restringir las rutas que se rearán para que no se muestren las que no utilizaremos (podemos comprobarlo con un `php artisan route:list`).

Ahora modificamos el controlador creado para que realiza las tareas de cada métido:
* index(): es el método que se ejecutará con el GET sin parámetros
```php
public function index()  {
    $ofertas=Oferta::all()->toArray();
    return response()->json($ofertas);
}
  ```
* show($id): método asiciado al GET/Id
```php
public function show($id)  {
    $oferta=Oferta::find($id);
    if(!$oferta){
        return response()->json([‘No existe’,404]);
    }
    return response()->json($oferta,200);
    // O tabién podríamos haber hecho
    // return Oferta::where('id', $id)->get();
}
```
* store($request): método asociado al POST
```php
public function store(Request $request)  {
    $oferta = new Oferta;
    $oferta->description = $request->description;
    $oferta->puesto = $request->puesto;
    ...
    $oferta->empresa()->associate($request->empresa());
    
    $oferta->save();
}
```


Fuente: [APIRest sencillo con Laravel](https://unprogramador.com/apirest-sencillo-con-laravel/)
