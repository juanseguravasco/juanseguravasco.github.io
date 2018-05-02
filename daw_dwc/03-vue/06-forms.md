# Introducción
Para poder tener sincronizado el formulario con nuestros datos utilizamos la directiva **v-model** en cada campo. Vamos a ver cómo usar los diferentes tipos de campos con Vue.

## Enlazar diferentes inputs
### input normal
En este caso simplemente añadimos la directiva **v-model** al input:
```[html]
<label>Nombre:</label>
<input type="text" v-model="user.nombre">
```

### radio button
Ponemos en todos los radiobuttons el **v-model** y a cada uno el **value** que se guardará al escoger dicha opción:
```[html]
<label>Sexo:</label>
<input type="radio" value="H" name="sexo" v-model="user.sexo">Hombre
<input type="radio" value="M" name="sexo" v-model="user.sexo">Mujer
```

### checkbox
Igual que cualquier input, le ponemos el **v-model**:
```[html]
```

## Inputs en subcomponentes

# Validar formularios
