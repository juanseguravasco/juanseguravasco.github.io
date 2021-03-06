# Uso de Gthub classroom para entregas en DWC
En primer lugar crearemos una organización de github para cada grupo al que damos clase y una _classroom_ asociada a dicha organización.

El resumen del flujo de trabajo es el siguiente:
1. Creación del repositorio con el código base de la tarea
2. Archivo _README_ con enunciado o descripción de la tarea
3. En _GitHub Classroom_, se crea una tarea individual
4. Se elige el repositorio con el código base sobre el que se basará la tarea
5. Se elige si los repositorios serán públicos o privados
6. Se asigna una fecha de entrega (opcional)
7. Se proporciona a los alumnos el enlace con la invitación
8. Cada alumno accede al enlace de invitación y se le crea un repositorio para él en la organización
9. El alumno trabaja en su repositorio asignado
10. Inicialmente, el alumno crea una rama nueva sobre la que va a trabajar
11. Cuando quiera solicitar ayuda o revisión del profesor, el alumno genera una _pull request_ a la rama principal de su repositorio en la que cita al profesor para que reciba una notificación
12. El profesor proporciona retroalimentación mediante comentarios en la _pull request_ o en un determinado _commit_ individual
13. Opcionalmente se pueden utilizar los _issues_ y las _citas_ de usuario para solicitar la intervención del profesor
14. Los comentarios se pueden realizar a nivel de línea de código
15. Cuando el alumno finaliza la tarea, genera una última _pull request_
16. El profesor revisa la _pull request_ y opcionalmente hace comentarios sobre la misma

## Preparar el entorno para una práctica
- Creamos un nuevo repositorio para la tarea. En el README ponemos el enunciado de la misma.
  - En el PC clonamos y descargamos el repositorio
```bash
git clone https://github/..../repositorio.git
```
  - Creamos un fichero _.gitignore_ donde añadimos la carpeta _solucion/_
  - Copiamos los ficheros (la solución dentro de ea carpeta para que no se suba) y lo subimos
```bash
git add .
git commit -m "Subida de ficheros"
git push otigin master
```
- Creamos la tarea (_assignment_)
  - Indicamos el título de la tarea y su prefijo
  - Indicamos que queremos que sean privados para que no vean lo de los otros
  - Indicamos el repositorio creado antes con el código inicial
  - Podemos poner la fecha límite (Deadline). Ese día se hace un _pull request_ automáticamente

### Qué tienen que hacer los alumnos
