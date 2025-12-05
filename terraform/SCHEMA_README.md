# Script de inicialización de la base de datos
# Ejecutar después de que Terraform haya creado la instancia

Este script SQL inicializa el esquema de la base de datos para el sistema de gestión de herramientas de IA.

## Cómo usar

### Método 1: Usando Cloud SQL Proxy

```bash
# 1. Obtener el connection name de Terraform
CONNECTION_NAME=$(cd terraform && terraform output -raw instance_connection_name)

# 2. Iniciar Cloud SQL Proxy
cloud_sql_proxy -instances=$CONNECTION_NAME=tcp:3306 &

# 3. Obtener credenciales
PASSWORD=$(cd terraform && terraform output -raw database_password)
DATABASE=$(cd terraform && terraform output -raw database_name)

# 4. Ejecutar el script
mysql -h 127.0.0.1 -u app_user -p$PASSWORD $DATABASE < terraform/schema.sql
```

### Método 2: Usando gcloud CLI

```bash
# 1. Obtener el nombre de la instancia
INSTANCE_NAME=$(cd terraform && terraform output -raw instance_name)

# 2. Copiar el archivo SQL a Cloud Storage (temporal)
gsutil cp terraform/schema.sql gs://MI-BUCKET/schema.sql

# 3. Importar a Cloud SQL
gcloud sql import sql $INSTANCE_NAME gs://MI-BUCKET/schema.sql \
  --database=herramientas_ia_db

# 4. Limpiar
gsutil rm gs://MI-BUCKET/schema.sql
```

### Método 3: Desde la consola de GCP

1. Ir a: https://console.cloud.google.com/sql/instances
2. Seleccionar la instancia
3. Ir a "Import"
4. Subir el archivo `schema.sql`
5. Ejecutar

## Estructura creada

El script crea las siguientes tablas:

- **usuarios**: Estudiantes, docentes y administradores
- **servicios_ia**: Catálogo de herramientas de IA
- **proyectos**: Proyectos desarrollados con IA
- **evaluaciones**: Opiniones sobre servicios
- **metricas_uso**: Estadísticas de uso
- **comparaciones**: Comparativas entre servicios
- **tutoriales**: Guías y tutoriales
- **suscripciones_servicios**: Control de suscripciones

También crea vistas útiles para consultas frecuentes.
