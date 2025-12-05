# Configuración principal de Terraform para Google Cloud SQL MySQL

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# Proveedor de Google Cloud
provider "google" {
  project = var.project_id
  region  = var.region
}

# Generar una contraseña aleatoria segura para el usuario root de MySQL
resource "random_password" "mysql_root_password" {
  length  = 32
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Instancia de Cloud SQL MySQL (versión compartida)
resource "google_sql_database_instance" "mysql_instance" {
  name             = "${var.instance_name}-${var.environment}"
  database_version = var.database_version
  region           = var.region
  deletion_protection = var.deletion_protection

  settings {
    # Tier para instancia compartida (más económica)
    tier = var.tier
    
    # Configuración de disponibilidad
    availability_type = var.availability_type
    
    # Configuración de disco
    disk_type = var.disk_type
    disk_size = var.disk_size
    disk_autoresize = true
    disk_autoresize_limit = var.disk_autoresize_limit

    # Configuración de backups
    backup_configuration {
      enabled                        = var.backup_enabled
      start_time                     = var.backup_start_time
      point_in_time_recovery_enabled = var.point_in_time_recovery
      transaction_log_retention_days = var.transaction_log_retention_days
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = "COUNT"
      }
    }

    # Configuración de mantenimiento
    maintenance_window {
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
      update_track = var.maintenance_window_update_track
    }

    # Configuración de red IP
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
      require_ssl     = var.require_ssl

      # Redes autorizadas (acceso público)
      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.value.name
          value = authorized_networks.value.cidr
        }
      }
    }

    # Configuración de insights
    insights_config {
      query_insights_enabled  = var.query_insights_enabled
      query_string_length     = var.query_string_length
      record_application_tags = var.record_application_tags
      record_client_address   = var.record_client_address
    }

    # Flags de base de datos (configuración MySQL)
    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }
  }

  # Etiquetas para organización
  labels = merge(
    {
      environment = var.environment
      managed_by  = "terraform"
      project     = "herramientas-ia"
    },
    var.additional_labels
  )
}

# Base de datos para la aplicación
resource "google_sql_database" "app_database" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql_instance.name
  charset  = var.database_charset
  collation = var.database_collation
}

# Usuario de base de datos para la aplicación
resource "google_sql_user" "app_user" {
  name     = var.database_user
  instance = google_sql_database_instance.mysql_instance.name
  password = var.database_password != "" ? var.database_password : random_password.mysql_root_password.result
  host     = var.database_user_host
}

# Usuario root con contraseña segura
resource "google_sql_user" "root" {
  name     = "root"
  instance = google_sql_database_instance.mysql_instance.name
  password = random_password.mysql_root_password.result
  host     = "%"
}
