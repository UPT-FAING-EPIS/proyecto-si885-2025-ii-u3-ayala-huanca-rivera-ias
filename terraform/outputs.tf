# Outputs del despliegue de Cloud SQL MySQL

output "instance_name" {
  description = "Nombre de la instancia de Cloud SQL"
  value       = google_sql_database_instance.mysql_instance.name
}

output "instance_connection_name" {
  description = "Nombre de conexión de la instancia (formato: project:region:instance)"
  value       = google_sql_database_instance.mysql_instance.connection_name
}

output "instance_self_link" {
  description = "URI de la instancia de Cloud SQL"
  value       = google_sql_database_instance.mysql_instance.self_link
}

output "instance_ip_address" {
  description = "Dirección IP pública de la instancia"
  value       = google_sql_database_instance.mysql_instance.public_ip_address
}

output "instance_private_ip_address" {
  description = "Dirección IP privada de la instancia (si está configurada)"
  value       = google_sql_database_instance.mysql_instance.private_ip_address
}

output "database_name" {
  description = "Nombre de la base de datos principal"
  value       = google_sql_database.app_database.name
}

output "database_user" {
  description = "Nombre del usuario de la aplicación"
  value       = google_sql_user.app_user.name
}

output "database_password" {
  description = "Contraseña del usuario de la aplicación (sensible)"
  value       = google_sql_user.app_user.password
  sensitive   = true
}

output "root_password" {
  description = "Contraseña del usuario root (sensible)"
  value       = random_password.mysql_root_password.result
  sensitive   = true
}

output "connection_string" {
  description = "String de conexión MySQL (sin contraseña)"
  value       = "mysql://${google_sql_user.app_user.name}@${google_sql_database_instance.mysql_instance.public_ip_address}:3306/${google_sql_database.app_database.name}"
}

output "connection_command" {
  description = "Comando para conectar via Cloud SQL Proxy"
  value       = "gcloud sql connect ${google_sql_database_instance.mysql_instance.name} --user=${google_sql_user.app_user.name} --database=${google_sql_database.app_database.name}"
}

output "instance_tier" {
  description = "Tier de la instancia desplegada"
  value       = google_sql_database_instance.mysql_instance.settings[0].tier
}

output "database_version" {
  description = "Versión de MySQL desplegada"
  value       = google_sql_database_instance.mysql_instance.database_version
}

output "region" {
  description = "Región donde se desplegó la instancia"
  value       = google_sql_database_instance.mysql_instance.region
}

output "backup_enabled" {
  description = "Estado de los backups automáticos"
  value       = google_sql_database_instance.mysql_instance.settings[0].backup_configuration[0].enabled
}
