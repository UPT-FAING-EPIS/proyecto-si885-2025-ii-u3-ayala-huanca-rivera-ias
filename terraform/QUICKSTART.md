# 🚀 Guía de Inicio Rápido - Cloud SQL MySQL en GCP

## Pasos para desplegar en 5 minutos

### 1️⃣ Prerrequisitos (2 minutos)

```powershell
# Verificar que tienes las herramientas instaladas
terraform --version
gcloud --version

# Si no las tienes:
# - Terraform: https://www.terraform.io/downloads
# - gcloud: https://cloud.google.com/sdk/docs/install
```

### 2️⃣ Configuración de GCP (2 minutos)

```powershell
# Autenticarse
gcloud auth login
gcloud auth application-default login

# Establecer proyecto
gcloud config set project TU-PROYECTO-ID

# Habilitar APIs
gcloud services enable sqladmin.googleapis.com
gcloud services enable compute.googleapis.com
```

### 3️⃣ Configurar Terraform (1 minuto)

```powershell
# Ir al directorio terraform
cd terraform

# Copiar archivo de configuración
cp terraform.tfvars.example terraform.tfvars

# Editar con tu PROJECT_ID (usar notepad o tu editor favorito)
notepad terraform.tfvars
```

**En `terraform.tfvars`, cambiar:**
```hcl
project_id = "TU-PROYECTO-GCP-ID"  # ⚠️ CAMBIAR ESTO
```

### 4️⃣ Desplegar (5-10 minutos)

```powershell
# Inicializar Terraform
terraform init

# Ver qué se va a crear
terraform plan

# Crear la infraestructura
terraform apply
# Escribir 'yes' cuando pregunte
```

### 5️⃣ Obtener Información de Conexión

```powershell
# Ver todas las salidas
terraform output

# Ver IP de la base de datos
terraform output instance_ip_address

# Ver contraseña (guardarla en lugar seguro)
terraform output -raw database_password

# Ver comando de conexión
terraform output connection_command
```

### 6️⃣ Conectarse a la Base de Datos

**Opción A: Usando gcloud (más fácil)**
```powershell
# Copiar y ejecutar el comando que muestra terraform output connection_command
gcloud sql connect NOMBRE-INSTANCIA --user=app_user --database=herramientas_ia_db
```

**Opción B: MySQL Client directo**
```powershell
# Obtener valores
$IP = terraform output -raw instance_ip_address
$PASSWORD = terraform output -raw database_password

# Conectar
mysql -h $IP -u app_user -p$PASSWORD herramientas_ia_db
```

### 7️⃣ Inicializar el Schema (opcional)

```powershell
# Desde el directorio raíz del proyecto
$PASSWORD = cd terraform; terraform output -raw database_password; cd ..
$IP = cd terraform; terraform output -raw instance_ip_address; cd ..

mysql -h $IP -u app_user -p$PASSWORD herramientas_ia_db < terraform/schema.sql
```

## 📊 Conectar con Looker Studio

1. Ir a: https://lookerstudio.google.com
2. Crear nueva fuente de datos
3. Seleccionar "Cloud SQL"
4. Usar los datos de `terraform output`:
   - **Instancia**: `terraform output instance_connection_name`
   - **Base de datos**: `herramientas_ia_db`
   - **Usuario**: `app_user`
   - **Contraseña**: `terraform output -raw database_password`

## 🧹 Limpiar Recursos (eliminar todo)

```powershell
cd terraform
terraform destroy
# Escribir 'yes' cuando pregunte
```

## ⚠️ Notas Importantes

1. **Costos**: La instancia `db-f1-micro` cuesta ~$7-10 USD/mes
2. **Seguridad**: La configuración por defecto permite acceso desde cualquier IP (0.0.0.0/0)
   - En producción, cambiar en `terraform.tfvars` a tu IP específica
3. **Backups**: Los backups automáticos están habilitados por defecto
4. **Eliminación**: Tiene protección contra eliminación activada

## 🆘 Ayuda Rápida

### Error: API not enabled
```powershell
gcloud services enable sqladmin.googleapis.com
```

### Error: Insufficient permissions
Tu cuenta necesita el rol `Cloud SQL Admin` en el proyecto.

### No puedo conectarme
1. Verifica que tu IP esté en authorized_networks
2. Espera 5-10 minutos tras crear la instancia
3. Verifica que el firewall de tu red permita conexiones al puerto 3306

### ¿Cómo veo los logs?
```powershell
$INSTANCE = terraform output -raw instance_name
gcloud sql operations list --instance=$INSTANCE
```

## 📚 Más Información

- **README completo**: Ver `terraform/README.md`
- **Schema de DB**: Ver `terraform/SCHEMA_README.md`
- **Documentación de GCP**: https://cloud.google.com/sql/docs

---

**¿Problemas?** Revisa el archivo `terraform/README.md` para troubleshooting detallado.
