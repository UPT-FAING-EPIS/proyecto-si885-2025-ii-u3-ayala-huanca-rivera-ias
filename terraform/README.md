# Terraform - Despliegue de Cloud SQL MySQL en Google Cloud Platform

Este directorio contiene la infraestructura como código (IaC) usando Terraform para desplegar una instancia de **Cloud SQL MySQL** en Google Cloud Platform.

## 📋 Requisitos Previos

### 1. Herramientas Necesarias
- [Terraform](https://www.terraform.io/downloads) >= 1.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (gcloud CLI)
- Cuenta de Google Cloud Platform con proyecto creado

### 2. Configuración de GCP

```bash
# Autenticarse en Google Cloud
gcloud auth login

# Establecer el proyecto predeterminado
gcloud config set project MI-PROYECTO-ID

# Habilitar las APIs necesarias
gcloud services enable sqladmin.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com

# Crear credenciales de aplicación para Terraform
gcloud auth application-default login
```

## 🚀 Uso

### 1. Configurar Variables

Copiar el archivo de ejemplo y personalizarlo:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Editar `terraform.tfvars` y establecer al menos:

```hcl
project_id = "tu-proyecto-gcp-id"
region     = "us-central1"
```

### 2. Inicializar Terraform

```bash
terraform init
```

Este comando descarga los providers necesarios (Google Cloud, Random).

### 3. Revisar el Plan

```bash
terraform plan
```

Revisa los recursos que se crearán antes de aplicar los cambios.

### 4. Aplicar la Configuración

```bash
terraform apply
```

Confirma con `yes` cuando se solicite. El proceso tomará varios minutos.

### 5. Ver Outputs

```bash
# Ver todas las salidas
terraform output

# Ver información específica
terraform output instance_ip_address
terraform output connection_string

# Ver contraseñas (sensibles)
terraform output -raw database_password
terraform output -raw root_password
```

## 📦 Recursos Creados

Esta configuración crea los siguientes recursos en GCP:

1. **Instancia de Cloud SQL MySQL**
   - Versión: MySQL 8.0 (configurable)
   - Tier: `db-f1-micro` (instancia compartida económica)
   - Disponibilidad: Zonal (configurable a Regional)
   - Almacenamiento: SSD con auto-redimensionamiento

2. **Base de Datos**
   - Nombre: `herramientas_ia_db`
   - Charset: UTF8MB4
   - Collation: utf8mb4_unicode_ci

3. **Usuarios**
   - Usuario de aplicación: `app_user`
   - Usuario root: `root`
   - Contraseñas generadas automáticamente

4. **Configuraciones**
   - Backups automáticos diarios
   - Query Insights habilitado
   - IP pública asignada
   - Red autorizada configurable

## 💰 Costos Estimados

**Instancia db-f1-micro (Shared-Core)**:
- ~$7-10 USD/mes
- 0.6 GB RAM
- 250 GB almacenamiento incluido
- Backups automáticos incluidos

> **Nota**: Los costos pueden variar según la región y el uso real. Consulta la [calculadora de precios de GCP](https://cloud.google.com/products/calculator).

## 🔐 Seguridad

### Recomendaciones para Producción

1. **Redes Autorizadas**: 
   ```hcl
   authorized_networks = [
     {
       name = "mi-oficina"
       cidr = "203.0.113.0/24"  # IP específica
     }
   ]
   ```

2. **SSL Requerido**:
   ```hcl
   require_ssl = true
   ```

3. **Red Privada** (recomendado):
   ```hcl
   ipv4_enabled    = false
   private_network = "projects/MI-PROYECTO/global/networks/MI-VPC"
   ```

4. **Alta Disponibilidad**:
   ```hcl
   availability_type = "REGIONAL"
   tier              = "db-n1-standard-1"  # Instancia dedicada
   ```

5. **Protección contra Eliminación**:
   ```hcl
   deletion_protection = true  # Ya habilitado por defecto
   ```

## 🔌 Conectarse a la Base de Datos

### Opción 1: Usando Cloud SQL Proxy (Recomendado)

```bash
# Descargar Cloud SQL Proxy
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
chmod +x cloud_sql_proxy

# Obtener connection name
CONNECTION_NAME=$(terraform output -raw instance_connection_name)

# Iniciar el proxy
./cloud_sql_proxy -instances=$CONNECTION_NAME=tcp:3306

# En otra terminal, conectar con MySQL client
mysql -h 127.0.0.1 -u app_user -p herramientas_ia_db
```

### Opción 2: Conexión Directa (IP Pública)

```bash
# Obtener IP y credenciales
IP=$(terraform output -raw instance_ip_address)
USER=$(terraform output -raw database_user)
PASSWORD=$(terraform output -raw database_password)
DB=$(terraform output -raw database_name)

# Conectar
mysql -h $IP -u $USER -p$PASSWORD $DB
```

### Opción 3: Usando gcloud CLI

```bash
# Comando de conexión
terraform output connection_command

# Ejecutar (te pedirá la contraseña)
gcloud sql connect INSTANCE-NAME --user=app_user --database=herramientas_ia_db
```

## 📊 Monitoreo

### Ver Métricas en Google Cloud Console

1. Ir a: https://console.cloud.google.com/sql/instances
2. Seleccionar la instancia creada
3. Ver tabs: Monitoring, Backups, Connections

### Usar Query Insights

1. En la consola de Cloud SQL, ir a "Query Insights"
2. Ver consultas más lentas y frecuentes
3. Identificar oportunidades de optimización

## 🔄 Gestión

### Actualizar la Configuración

1. Modificar `terraform.tfvars`
2. Ejecutar:
   ```bash
   terraform plan
   terraform apply
   ```

### Crear un Backup Manual

```bash
INSTANCE_NAME=$(terraform output -raw instance_name)
gcloud sql backups create --instance=$INSTANCE_NAME
```

### Ver Backups

```bash
gcloud sql backups list --instance=$INSTANCE_NAME
```

### Restaurar desde Backup

```bash
# Listar backups
gcloud sql backups list --instance=$INSTANCE_NAME

# Restaurar
gcloud sql backups restore BACKUP_ID --backup-instance=$INSTANCE_NAME --backup-id=BACKUP_ID
```

## 🗑️ Destruir Recursos

⚠️ **ADVERTENCIA**: Esto eliminará permanentemente la instancia y todos los datos.

```bash
# Ver qué se eliminará
terraform plan -destroy

# Eliminar recursos
terraform destroy
```

> Si tienes `deletion_protection = true`, primero debes cambiarlo a `false` y aplicar el cambio antes de destruir.

## 📁 Estructura de Archivos

```
terraform/
├── main.tf                      # Recursos principales
├── variables.tf                 # Definición de variables
├── outputs.tf                   # Outputs del despliegue
├── terraform.tfvars.example     # Ejemplo de configuración
├── terraform.tfvars             # Tu configuración (no versionada)
├── .gitignore                   # Archivos a ignorar en Git
└── README.md                    # Esta documentación
```

## 🐛 Troubleshooting

### Error: API not enabled

```bash
gcloud services enable sqladmin.googleapis.com
```

### Error: Insufficient permissions

Asegúrate de tener los roles necesarios:
- `roles/cloudsql.admin`
- `roles/compute.networkAdmin`

### Instancia tarda mucho en crearse

Es normal. Una instancia de Cloud SQL puede tomar 5-10 minutos en estar lista.

### No puedo conectarme desde mi IP

1. Verifica que tu IP esté en `authorized_networks`
2. Obtén tu IP pública: `curl ifconfig.me`
3. Agrega a `terraform.tfvars`:
   ```hcl
   authorized_networks = [
     {
       name = "mi-ip"
       cidr = "TU.IP.PUB.LICA/32"
     }
   ]
   ```
4. Aplica: `terraform apply`

## 📚 Referencias

- [Documentación de Cloud SQL](https://cloud.google.com/sql/docs)
- [Terraform Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Cloud SQL Pricing](https://cloud.google.com/sql/pricing)
- [MySQL 8.0 Documentation](https://dev.mysql.com/doc/refman/8.0/en/)

## 🤝 Soporte

Para preguntas sobre este proyecto académico:
- **Curso**: SI885 - Sistemas de Información
- **Institución**: Universidad Privada de Tacna
- **Facultad**: Ingeniería - Escuela Profesional de Ingeniería de Sistemas

---

**Última actualización**: Noviembre 2025
