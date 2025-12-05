# Variables de configuración para el despliegue de Cloud SQL MySQL

# Variables del proyecto
variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
}

variable "region" {
  description = "Región de Google Cloud donde se desplegará la instancia"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Ambiente de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Variables de la instancia
variable "instance_name" {
  description = "Nombre base de la instancia de Cloud SQL"
  type        = string
  default     = "mysql-herramientas-ia"
}

variable "database_version" {
  description = "Versión de MySQL (MYSQL_8_0, MYSQL_5_7, etc.)"
  type        = string
  default     = "MYSQL_8_0"
}

variable "tier" {
  description = "Tier de la instancia (db-f1-micro para shared-core, db-n1-standard-1 para dedicado)"
  type        = string
  default     = "db-f1-micro"  # Instancia compartida económica
}

variable "availability_type" {
  description = "Tipo de disponibilidad (ZONAL o REGIONAL)"
  type        = string
  default     = "ZONAL"  # ZONAL es más económico, REGIONAL para alta disponibilidad
}

variable "deletion_protection" {
  description = "Protección contra eliminación accidental"
  type        = bool
  default     = true
}

# Variables de almacenamiento
variable "disk_type" {
  description = "Tipo de disco (PD_SSD o PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "disk_size" {
  description = "Tamaño inicial del disco en GB"
  type        = number
  default     = 10
}

variable "disk_autoresize_limit" {
  description = "Límite máximo de auto-redimensionamiento del disco en GB"
  type        = number
  default     = 50
}

# Variables de backup
variable "backup_enabled" {
  description = "Habilitar backups automáticos"
  type        = bool
  default     = true
}

variable "backup_start_time" {
  description = "Hora de inicio de backups (formato HH:MM)"
  type        = string
  default     = "03:00"
}

variable "point_in_time_recovery" {
  description = "Habilitar recuperación point-in-time"
  type        = bool
  default     = false  # Consumo adicional, deshabilitar en dev
}

variable "transaction_log_retention_days" {
  description = "Días de retención de logs de transacciones"
  type        = number
  default     = 7
}

variable "retained_backups" {
  description = "Número de backups automáticos a retener"
  type        = number
  default     = 7
}

# Variables de mantenimiento
variable "maintenance_window_day" {
  description = "Día de la semana para mantenimiento (1=Lunes, 7=Domingo)"
  type        = number
  default     = 7
}

variable "maintenance_window_hour" {
  description = "Hora del día para mantenimiento (0-23)"
  type        = number
  default     = 3
}

variable "maintenance_window_update_track" {
  description = "Track de actualizaciones (stable o canary)"
  type        = string
  default     = "stable"
}

# Variables de red
variable "ipv4_enabled" {
  description = "Habilitar dirección IPv4 pública"
  type        = bool
  default     = true
}

variable "private_network" {
  description = "Red VPC privada (dejar vacío para red pública)"
  type        = string
  default     = ""
}

variable "require_ssl" {
  description = "Requerir conexiones SSL/TLS"
  type        = bool
  default     = false  # Cambiar a true en producción
}

variable "authorized_networks" {
  description = "Redes autorizadas para acceso público"
  type = list(object({
    name = string
    cidr = string
  }))
  default = [
    {
      name = "allow-all-temp"
      cidr = "0.0.0.0/0"  # ADVERTENCIA: Permitir todo - solo para desarrollo
    }
  ]
}

# Variables de la base de datos
variable "database_name" {
  description = "Nombre de la base de datos principal"
  type        = string
  default     = "herramientas_ia_db"
}

variable "database_charset" {
  description = "Charset de la base de datos"
  type        = string
  default     = "utf8mb4"
}

variable "database_collation" {
  description = "Collation de la base de datos"
  type        = string
  default     = "utf8mb4_unicode_ci"
}

# Variables de usuario
variable "database_user" {
  description = "Nombre del usuario de la aplicación"
  type        = string
  default     = "app_user"
}

variable "database_password" {
  description = "Contraseña del usuario (dejar vacío para generar automáticamente)"
  type        = string
  default     = ""
  sensitive   = true
}

variable "database_user_host" {
  description = "Host desde el cual el usuario puede conectarse"
  type        = string
  default     = "%"
}

# Variables de insights
variable "query_insights_enabled" {
  description = "Habilitar Query Insights para análisis de rendimiento"
  type        = bool
  default     = true
}

variable "query_string_length" {
  description = "Longitud máxima de cadena de consulta para insights"
  type        = number
  default     = 1024
}

variable "record_application_tags" {
  description = "Registrar tags de aplicación en insights"
  type        = bool
  default     = false
}

variable "record_client_address" {
  description = "Registrar dirección del cliente en insights"
  type        = bool
  default     = false
}

# Configuraciones de MySQL
variable "database_flags" {
  description = "Flags de configuración de MySQL"
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name  = "max_connections"
      value = "100"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    },
    {
      name  = "collation_server"
      value = "utf8mb4_unicode_ci"
    }
  ]
}

# Etiquetas adicionales
variable "additional_labels" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}
