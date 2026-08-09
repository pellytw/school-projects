# School Projects

School Projects es una aplicacion Rails simple para practicar instalacion, configuracion y primeros cambios en un proyecto real.

El dominio es educativo: una localidad tiene escuelas, y una escuela tiene proyectos escolares.

## Versiones

- Ruby: `3.3.2`
- Rails: `7.2.x`
- Base de datos: SQLite
- Vistas: ERB

Podes usar el manejador de versiones que prefieras: `rbenv`, `asdf`, `mise`, `chruby` u otro. Lo importante es que tu terminal use la version indicada en `.ruby-version`.

## Instalacion

1. Clonar o descargar el proyecto.

2. Entrar al directorio:

   ```bash
   cd school-projects
   ```

3. Instalar Ruby `3.3.2` con tu manejador de versiones.

   Ejemplos:

   ```bash
   rbenv install 3.3.2
   rbenv local 3.3.2
   ```

   ```bash
   asdf install ruby 3.3.2
   asdf local ruby 3.3.2
   ```

4. Verificar la version activa:

   ```bash
   ruby -v
   ```

5. Instalar dependencias:

   ```bash
   bundle install
   ```

6. Crear la base de datos, ejecutar migraciones y cargar datos de ejemplo:

   ```bash
   bin/rails db:setup
   ```

7. Levantar el servidor:

   ```bash
   bin/rails server
   ```

8. Abrir la aplicacion:

   ```text
   http://localhost:3000
   ```

## Tests

Para correr la suite principal:

```bash
bin/rails test
```

## Que Incluye

- CRUD de localidades.
- CRUD de escuelas.
- CRUD de proyectos escolares.
- Asociaciones `has_many` y `belongs_to`.
- Validaciones de presencia.
- Enums para nivel escolar, categoria y estado de proyectos.
- Dashboard con conteos y ultimos proyectos.
- Seeds con datos realistas.
- Tests de modelos y controladores generados por Rails.

## Errores Comunes

Si `ruby -v` no muestra `3.3.2`, revisa tu manejador de versiones y vuelve a abrir la terminal.

Si `bundle install` falla por la version de Ruby, confirma que estas dentro del directorio del proyecto y que `.ruby-version` existe.

Si aparece un error de base de datos, ejecuta:

```bash
bin/rails db:prepare
```

Si queres reiniciar los datos de desarrollo:

```bash
bin/rails db:reset
```

## Ejercicios Sugeridos

- Agregar busqueda de escuelas por nombre.
- Filtrar proyectos por estado.
- Agregar una entidad `Teacher` para docentes responsables.
- Agregar una entidad `Milestone` para hitos o entregas del proyecto.
- Traducir mensajes de validacion al español.
- Agregar tests para los filtros.
- Agregar autenticacion como ejercicio avanzado.
