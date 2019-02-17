# Crear una API REST con Laravel

## Crear el modelo
Pasos básicos:
* creamos el sitio y la BBDD en Homestead.yaml
* creamos el proyecto `php laravel new laborexchange`
* configuramos el .env
* hacemos el php artisan migrate que creará las tablas users y password_resets

Para crear cada tabla haremos:
php artisan make:model Tabla -m

Esto crea 2 ficheros:
* Tabla.php: modelo
* create_tabla_table: fichero de migraciones que hay que editar para definar los campos:

public function up()  {
    Schema::create('passports', function (Blueprint $table) {
        $table->increments('id');
        $table->string('name');
        $table->integer('date');
        $table->string('email')->unique();
        $table->integer('number');
        $table->string('office');
        $table->string('filename');
        $table->timestamps();
    });
}
    

Fuente: [Laravel 5.6 CRUD Tutorial With Example](https://appdividend.com/2018/02/23/laravel-5-6-crud-tutorial/)


## Crear la API
En un APIRest a los Modelos  se les denomina Recursos. Lo primero es crear un controlador y ponerla la opción -r para que lo cree como un controlador de Recursos (por lo que creará los métodos paralos verbos HTTP):
```bash
php artisan make:controller Nombredetucontrolador –resource
```

A continuación creamos su ruta asociada en **/routes/api.php**:
```php
Route::resource(‘Usuario’,’UsuariosController’,[‘only’=>[‘index’,’store’,’show’,’update’,’destroy’ ]]);
```
La opción _only_ permite restringir las rutas que se rearán para que no se muestren las que no utilizaremos (podemos comprobarlo con un `php artisan route:list`).

Ahora modificamos el controlador creado para que realiza las tareas de cada métido:
* index(): es el método que se ejecutará con el GET sin parámetros
```php
public function index()  {
    $users=Usuarios::all()->toArray();
    return response()->json($users);
}
  ```
* show($id): método asiciado al GET/Id
```php
public function show($id)  {
    $usuario=Usuarios::find($id);
    if(!$usuario){
        return response()->json([‘No existe’,404]);
    }
    return response()->json($usuario,200);
    // O tabién podríamos haber hecho
    // return Pokemon::where('id', $id)->get();
}
```
* store($request): método asociado al POST
```php
public function store(Request $request)  {
    $usuario = new Usuario;
    $usuario->name = $request->name;
    $usuario->email = $request->email;
    $usuario->save();
}
```


Fuente: [APIRest sencillo con Laravel](https://unprogramador.com/apirest-sencillo-con-laravel/)
