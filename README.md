# Tarea para SGE04

## Instrucciones de Ejecución de la Tarea

Los códigos y documentos han sido desarrollados utilizando contenedores Docker. Para su correcta ejecución y despliegue, se dispone de un repositorio en GitHub donde se encuentran tanto las soluciones como los archivos necesarios para su prueba:

📌 [Repositorio en GitHub](https://github.com/alvarowau/sge-tarea4)

### **Requisitos Previos**

- Tener instalado Docker y Docker Compose en el equipo.
- Antes de la puesta en marcha, asegurarse de que el archivo `odoo.conf` ubicado en la carpeta `config_odoo` no contenga la referencia `admin_passwd`, ya que esta se generará automáticamente en el primer arranque del contenedor.

### **Levantamiento del Contenedor Docker**

Para levantar el contenedor Docker y ejecutar la aplicación, sigue estos pasos:

1. **Clona el repositorio desde GitHub:**

   ```bash
   git clone https://github.com/alvarowau/sge-tarea4.git
   cd sge-tarea4
   ```

2. **Construir y levantar los contenedores:**

   Asegúrate de estar en la raíz del proyecto y ejecuta:

   ```bash
   docker-compose up --build
   ```

   Esto construirá las imágenes necesarias y levantará los contenedores definidos en el archivo `docker-compose.yml`.

3. **Acceso a Odoo:**

   Una vez que los contenedores estén corriendo, podrás acceder a Odoo a través de tu navegador web en la siguiente URL:

   ```plaintext
   http://localhost:8069
   ```

   Allí podrás ingresar con las credenciales predeterminadas o configuradas previamente.

4. **Reiniciar contenedores:**

   Si necesitas reiniciar los contenedores, usa:

   ```bash
   docker-compose restart
   ```

5. **Detener los contenedores:**

   Para detener los contenedores cuando termines, ejecuta:

   ```bash
   docker-compose down
   ```

---

## Descripción de la Tarea

En esta unidad se ha abordado el proceso de implantación de un ERP-CRM en una organización. Dicho proceso requiere habilidades específicas para desarrollar herramientas de importación, informes personalizados y elementos de comprobación de que los datos importados sean correctos.

Esta tarea demuestra la capacidad de implantar Odoo 17 en una empresa mediante diferentes ejercicios que abarcan la generación de informes, la migración de datos y la actualización masiva de registros en PostgreSQL a través de pgAdmin4.

## Ejercicio 1: Creación de un informe personalizado (3 puntos)

- Creación de un archivo XML denominado `report.xml` en la carpeta `/views` de un módulo ficticio llamado `formAABB`.
- Desarrollo del código necesario para diseñar un informe que muestre los clientes con sus datos básicos: nombre, teléfono y correo electrónico.
- Modificación del archivo `__manifest__.py` del módulo para incluir el informe en los elementos cargados.

**La solución completa está disponible en** [ejercicio1](./ejercicio1.md).

## Ejercicio 2: Migración de datos (4 puntos)

- Creación de un archivo CSV con los datos de tres clientes arbitrarios y posterior importación en Odoo 17. Se documentan los errores encontrados y sus respectivas soluciones.
- Importación de un archivo CSV de ejemplo con datos de productos en la tabla correspondiente del módulo "Inventario" de Odoo. Se detallan los errores detectados y las soluciones implementadas.

**La solución completa está disponible en** [ejercicio2](./ejercicio2.md).

## Ejercicio 3: Actualización masiva de datos desde pgAdmin4 (3 puntos)

- Creación de un procedimiento almacenado que muestre el nombre, la provincia y el país de un cliente determinado, permitiendo la selección del cliente mediante un parámetro.
- Implementación de un *trigger* que registre en la tabla `milog` información básica sobre los clientes recién creados (`user_id`, `id`, `create_date`).
- Verificación de que la tabla `milog` se complete correctamente en todos los casos, ya sea desde la interfaz de Odoo, la importación de datos desde un archivo CSV o la inserción manual en PostgreSQL.

**La solución completa está disponible en** [ejercicio3](./ejercicio3.md).
