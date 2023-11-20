# PC03-CC3S2-Grupo-07: Introducción a Rails: Agrega funciones a RottenPotatoes
- Chavez Chico Joel Jhotan 20210058J
- Espinoza Pari Franklin 20210135D
- Pisfil Puicon Angello Jamir 20210035J

## Configuración del Github
Primero vamos a crear nuestro repositorio de trabajo, bajo el nombre de `PC03-CC3S2-Grupo-07`, y vamos a agregar a nuestros colaboradores de proyecto.
![](img/1.png)
![](img/2.png)

Ahora bien, necesitaremos inicializar nuestro proyecto usando el comando git init para establecer un sistema de control de versiones Git en el directorio de nuestro proyecto. Este proceso es crucial para realizar un seguimiento eficiente de los cambios en nuestros archivos a lo largo del tiempo y facilitar la colaboración entre los miembros de nuestro equipo.

![](img/3.png)

Luego vamos a clonar el repositorio sobre el cual trabajaremos el cual se indica en la guía de la práctica.

![](img/4.png)

Una vez hecho esto, ejecutamos `git add` para seleccionar los cambios que queremos incluir en el próximo commit y luego usamos `git commit` para crear un registro permanente de esos cambios con un mensaje descriptivo. Este proceso se repite a medida que desarrollamos, construyendo un historial de versiones estructurado y significativo en nuestro repositorio Git.

![](img/5.png)

Ahora, ejecutamos un `git branch`, para poder crear una nueva rama en nuestro repositorio. Las ramas en Git permiten trabajar en funcionalidades o correcciones por separado, sin afectar la rama principal. Luego, con `git remote`, establecemos conexiones con repositorios remotos, como GitHub, para facilitar la colaboración y compartir nuestro código. Finalmente, al usar `git push`, subimos nuestros commits al repositorio remoto, asegurando que otros colaboradores puedan acceder a nuestros cambios y mantener una versión actualizada del proyecto. Este conjunto de comandos respalda un flujo de trabajo colaborativo y eficiente en el desarrollo de software.

![](img/6.png)
![](img/7.png)
![](img/8.png)


Una vez establecida la infraestructura inicial de nuestro proyecto, procederemos con la ramificación del repositorio. Esta fase implica la creación de ramas específicas para cada integrante del equipo, dividiendo el desarrollo en partes distintas. Crearemos nuestra primera rama como se muestra a continuación:

![](img/9.png)
![](img/10.png)


Usando el `git branch Parte01-Joel` pudimos crear una nueva rama llamada `Parte01-Joel`. Luego, se realiza un cambio a esta nueva rama con el comando `git checkout Parte01-Joel`. Este proceso establece una rama separada para trabajar en una parte específica del proyecto, permitiendo a "Joel" realizar cambios y commits de manera aislada en esa parte del código sin afectar la rama principal.

Ahora bien, vamos a trabajar en esta rama siguiendo las demás instrucciones de la guía. Para comenzar, se indica que ejecutemos el comando `bundle install --without production`. Este comando se utiliza para instalar las gemas y dependencias especificadas en el archivo `Gemfile`, excluyendo aquellas relacionadas con el entorno de producción. De esta manera, se asegura la instalación de las dependencias necesarias para el desarrollo sin cargar aquellas destinadas únicamente al entorno de producción, optimizando así el entorno de trabajo.

![](img/11.png)
![](img/12.png)


Finalmente, ejecutamos la migración inicial mediante el comando bin/rake db:migrate. Esta acción, al ser la primera migración, también implica la creación de la base de datos. El comando se encarga de aplicar las migraciones definidas en el proyecto, estableciendo la estructura inicial de la base de datos de acuerdo con las especificaciones proporcionadas en los archivos de migración.

![](img/13.png)

**Pregunta**: ¿Cómo decide Rails dónde y cómo crear la base de datos de desarrollo? (Sugerencia: verifica los subdirectorios db y config)

**Respuesta**
Rails utiliza la configuración del archivo config/database.yml para determinar dónde y cómo crear la base de datos de desarrollo. En este archivo, podemos encontrar configuraciones para diferentes entornos, como desarrollo, prueba y producción. Por defecto, las configuraciones para el entorno de desarrollo se encuentran bajo la clave development.



**Pregunta**: ¿Qué tablas se crearon mediante las migraciones?

**Respueta:**
La migración `20150809022253_create_movies.rb` crea la tabla `Movies` en la base de datos. Esta tabla contendrá la información relacionada con las películas. Al ejecutar la migración, se establecen las columnas y sus tipos de datos correspondientes, definiendo así la estructura de la tabla. Los detalles específicos de la tabla `Movies` estarán definidos en el contenido de la migración, como por ejemplo, los campos para el título de la película, la fecha de lanzamiento, el director, y cualquier otro atributo relevante.

Ahora vamos a insertar *datos semilla* en la BD, mediante el comando `rake db:seed`.
![](img/14.png)


**Pregunta** ¿Qué datos de semilla se insertaron y dónde se especificaron? (Pista: rake -T db:seed explica la tarea de semilla, rake -T explica otras tareas de Rake disponibles)

En el archivo `/db/seeds.rb`, se especifican los datos de semilla que se insertarán en la base de datos cuando se ejecute el comando `rake db:seed`. Este archivo contiene una serie de hashes que representan películas con sus respectivos atributos, como título, clasificación y fecha de lanzamiento. Aquí, se están creando registros para películas como 'Aladdin', 'The Terminator', 'When Harry Met Sally', entre otras.
```rb
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
```

Cada hash dentro del arreglo `movies` representa un conjunto de datos para una película específica. La tarea de semilla (`rake db:seed`) utiliza estos datos para poblar la base de datos con valores iniciales. La estructura del archivo de semilla permite la creación eficiente de registros en la base de datos cuando sea necesario inicializarla con datos predefinidos. En resumen, al ejecutar `rake db:seed`, se insertarán estos datos en la tabla correspondiente de la base de datos, proporcionando un conjunto inicial de registros para trabajar en la aplicación.

Muy bien ahora vamos a desplegar nuestra app para poder visualizarla en nuestra máquina local, con ayuda del comando `rails server`

![](img/15.png)

Se puede observar que se ha iniciado el servidor de desarrollo de Rails. Al arrancar, el servidor informa que está utilizando WEBrick como servidor web y que la aplicación Rails 4.2.11 está en ejecución en el entorno de desarrollo. La aplicación estará disponible para su visualización en la dirección http://localhost:3000, así que nos dirigimos a dicho puerto desde el navegador para poder observar.

![](img/16.png)

## Despliegue inicial de Heroku / Render
@Angello




## Parte 1: filtrar la lista de películas por clasificación
