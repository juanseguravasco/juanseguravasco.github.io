# Vuetify

## Instalación
Instalamos la aplicación Vue 
```bash
vue init webpack intro-vuetify
cd intro-vuetify
npm install
npm install vuetify -S
```

En **main.js**:
```javascript
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)
```

En **index.js**:
```html
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
```



### Fuentes
* [Vuetify Material Framework in 60 minutes](https://www.youtube.com/watch?v=GeUhmMJUFZQ)
* [Intro and Overview of Vuetify.js (Build a CRUD client with Vue.js)](https://www.youtube.com/watch?v=5GfpGaHKfyo)
