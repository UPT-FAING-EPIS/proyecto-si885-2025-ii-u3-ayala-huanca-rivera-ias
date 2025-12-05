import os
import random
import time
from datetime import datetime, timedelta
import mysql.connector
from mysql.connector import Error
import sys

# Try to import Faker, but don't fail if it's not installed (fallback to simple random)
try:
    from faker import Faker
    fake = Faker('es_ES')
except ImportError:
    fake = None
    print("Warning: Faker module not found. Using simple random data.")

# Configuration from Environment Variables (adapted to Terraform outputs)
DB_HOST = os.environ.get("DB_HOST", "127.0.0.1")
DB_USER = os.environ.get("DB_USER", "app_user")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "password")
DB_NAME = os.environ.get("DB_NAME", "herramientas_ia_db")
DB_PORT = os.environ.get("DB_PORT", "3306")

def create_connection():
    """Create a database connection to the MySQL database specified by env vars."""
    connection = None
    try:
        print(f"Connecting to database {DB_NAME} at {DB_HOST}...")
        connection = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            passwd=DB_PASSWORD,
            database=DB_NAME,
            port=DB_PORT
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

def generate_user():
    """Generate a random user dictionary."""
    if fake:
        return {
            'nombres': fake.first_name(),
            'apellidos': fake.last_name(),
            'email': fake.email(),
            'codigo_universitario': str(fake.random_number(digits=9)),
            'tipo_usuario': random.choice(['estudiante', 'docente']),
            'facultad': 'Ingeniería',
            'escuela_profesional': 'Ingeniería de Sistemas',
            'ciclo': random.randint(1, 10)
        }
    else:
        # Fallback without Faker
        uid = random.randint(1000, 9999)
        return {
            'nombres': f"User{uid}",
            'apellidos': f"Test{uid}",
            'email': f"user{uid}@example.com",
            'codigo_universitario': str(random.randint(201800000, 202400000)),
            'tipo_usuario': 'estudiante',
            'facultad': 'Ingeniería',
            'escuela_profesional': 'Ingeniería de Sistemas',
            'ciclo': random.randint(1, 10)
        }

def insert_user(connection, user):
    query = """
    INSERT INTO usuarios (nombres, apellidos, email, codigo_universitario, tipo_usuario, facultad, escuela_profesional, ciclo)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """
    val = (user['nombres'], user['apellidos'], user['email'], user['codigo_universitario'], 
           user['tipo_usuario'], user['facultad'], user['escuela_profesional'], user['ciclo'])
    
    cursor = connection.cursor()
    try:
        cursor.execute(query, val)
        connection.commit()
        print(f"User {user['email']} inserted successfully.")
        return cursor.lastrowid
    except Error as e:
        print(f"Failed to insert user: {e}")
        return None

def generate_usage_metric(user_id, service_id):
    """Generate random usage metric."""
    return {
        'usuario_id': user_id,
        'servicio_ia_id': service_id,
        'fecha_uso': (datetime.now() - timedelta(days=random.randint(0, 30))).strftime('%Y-%m-%d'),
        'tiempo_uso_minutos': random.randint(10, 240),
        'interacciones_totales': random.randint(5, 100),
        'codigo_generado_lineas': random.randint(0, 500),
        'errores_encontrados': random.randint(0, 10),
        'prompts_enviados': random.randint(2, 50)
    }

def insert_usage_metric(connection, metric):
    query = """
    INSERT INTO metricas_uso (usuario_id, servicio_ia_id, fecha_uso, tiempo_uso_minutos, interacciones_totales, codigo_generado_lineas, errores_encontrados, prompts_enviados)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    ON DUPLICATE KEY UPDATE 
    tiempo_uso_minutos = tiempo_uso_minutos + VALUES(tiempo_uso_minutos),
    interacciones_totales = interacciones_totales + VALUES(interacciones_totales)
    """
    val = (metric['usuario_id'], metric['servicio_ia_id'], metric['fecha_uso'], metric['tiempo_uso_minutos'],
           metric['interacciones_totales'], metric['codigo_generado_lineas'], metric['errores_encontrados'], metric['prompts_enviados'])
    
    cursor = connection.cursor()
    try:
        cursor.execute(query, val)
        connection.commit()
        print(f"Usage metric for User {metric['usuario_id']} Service {metric['servicio_ia_id']} inserted.")
    except Error as e:
        print(f"Failed to insert usage metric: {e}")

def get_service_ids(connection):
    query = "SELECT id FROM servicios_ia"
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        return [row[0] for row in cursor.fetchall()]
    except Error as e:
        print(f"Failed to fetch services: {e}")
        return []

def simulate_data_upload():
    """Main function to simulate the data upload process."""
    conn = create_connection()
    
    if conn is None:
        print("Could not establish connection. Running in DRY RUN mode (simulation only).")
        # In a real scenario, we might just exit, but for simulation purposes, we'll print what would happen.
        print("Generating 5 fake users...")
        for _ in range(5):
            u = generate_user()
            print(f" [DRY RUN] Would insert user: {u['nombres']} {u['apellidos']}")
        return

    # 1. Insert some new users
    print("--- Inserting Users ---")
    new_user_ids = []
    for _ in range(random.randint(1, 5)):
        user_data = generate_user()
        uid = insert_user(conn, user_data)
        if uid:
            new_user_ids.append(uid)
    
    # 2. Get existing services
    service_ids = get_service_ids(conn)
    if not service_ids:
        print("No services found in DB. Make sure the schema is loaded.")
        # Attempt to insert default services if none exist? 
        # For this script, we assume schema is populated as per schema.sql
        return

    # 3. Simulate usage for random users (new or existing)
    # Ideally we'd fetch existing user IDs too, but let's use the new ones for now
    # or if no new ones, try to fetch some
    if not new_user_ids:
        cursor = conn.cursor()
        cursor.execute("SELECT id FROM usuarios ORDER BY RAND() LIMIT 10")
        new_user_ids = [row[0] for row in cursor.fetchall()]
    
    if new_user_ids:
        print("--- Inserting Usage Metrics ---")
        for uid in new_user_ids:
            # Randomly use 1-3 services
            for sid in random.sample(service_ids, min(len(service_ids), random.randint(1, 3))):
                metric = generate_usage_metric(uid, sid)
                insert_usage_metric(conn, metric)
    
    conn.close()
    print("Data upload simulation completed.")

if __name__ == "__main__":
    simulate_data_upload()
