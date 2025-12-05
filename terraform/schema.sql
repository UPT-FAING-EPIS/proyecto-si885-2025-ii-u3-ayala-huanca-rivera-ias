-- Schema de Base de Datos para Herramientas de IA
-- Sistema de gestión de herramientas de IA para estudiantes de ingeniería

-- ============================================
-- Configuración de la base de datos
-- ============================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- ============================================
-- Tabla: usuarios
-- ============================================
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    codigo_universitario VARCHAR(20) UNIQUE,
    tipo_usuario ENUM('estudiante', 'docente', 'administrador') DEFAULT 'estudiante',
    facultad VARCHAR(100),
    escuela_profesional VARCHAR(100),
    ciclo INT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ultimo_acceso DATETIME,
    activo BOOLEAN DEFAULT TRUE,
    INDEX idx_email (email),
    INDEX idx_codigo (codigo_universitario),
    INDEX idx_tipo (tipo_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: servicios_ia
-- ============================================
CREATE TABLE IF NOT EXISTS servicios_ia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT,
    url_oficial VARCHAR(255),
    logo_url VARCHAR(255),
    tipo_servicio ENUM('editor', 'generador_codigo', 'asistente', 'ide_cloud', 'builder_ui', 'otro') NOT NULL,
    categoria VARCHAR(50),
    modelo_ia VARCHAR(100),
    lenguajes_soportados JSON,
    caracteristicas JSON,
    plan_gratuito BOOLEAN DEFAULT FALSE,
    precio_mensual DECIMAL(10, 2),
    requiere_tarjeta BOOLEAN DEFAULT FALSE,
    nivel_recomendado ENUM('principiante', 'intermedio', 'avanzado', 'todos') DEFAULT 'todos',
    fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    INDEX idx_slug (slug),
    INDEX idx_tipo (tipo_servicio),
    INDEX idx_categoria (categoria),
    INDEX idx_nivel (nivel_recomendado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: proyectos
-- ============================================
CREATE TABLE IF NOT EXISTS proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_ia_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    tipo_proyecto ENUM('web', 'mobile', 'api', 'script', 'ml', 'otro') NOT NULL,
    lenguaje_principal VARCHAR(50),
    frameworks_usados JSON,
    url_repositorio VARCHAR(255),
    url_demo VARCHAR(255),
    estado ENUM('en_desarrollo', 'completado', 'abandonado', 'en_pausa') DEFAULT 'en_desarrollo',
    tiempo_desarrollo_horas DECIMAL(6, 2),
    lineas_codigo_generadas INT,
    lineas_codigo_manual INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    calificacion_proyecto DECIMAL(3, 2),
    curso VARCHAR(100),
    ciclo_academico VARCHAR(20),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (servicio_ia_id) REFERENCES servicios_ia(id) ON DELETE RESTRICT,
    INDEX idx_usuario (usuario_id),
    INDEX idx_servicio (servicio_ia_id),
    INDEX idx_estado (estado),
    INDEX idx_tipo (tipo_proyecto),
    INDEX idx_curso (curso)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: evaluaciones
-- ============================================
CREATE TABLE IF NOT EXISTS evaluaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_ia_id INT NOT NULL,
    proyecto_id INT,
    puntuacion INT NOT NULL CHECK (puntuacion BETWEEN 1 AND 5),
    facilidad_uso INT CHECK (facilidad_uso BETWEEN 1 AND 5),
    calidad_codigo INT CHECK (calidad_codigo BETWEEN 1 AND 5),
    velocidad_desarrollo INT CHECK (velocidad_desarrollo BETWEEN 1 AND 5),
    documentacion INT CHECK (documentacion BETWEEN 1 AND 5),
    soporte INT CHECK (soporte BETWEEN 1 AND 5),
    comentario TEXT,
    aspectos_positivos TEXT,
    aspectos_negativos TEXT,
    recomendaria BOOLEAN DEFAULT TRUE,
    fecha_evaluacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (servicio_ia_id) REFERENCES servicios_ia(id) ON DELETE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id) ON DELETE SET NULL,
    INDEX idx_usuario (usuario_id),
    INDEX idx_servicio (servicio_ia_id),
    INDEX idx_puntuacion (puntuacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: metricas_uso
-- ============================================
CREATE TABLE IF NOT EXISTS metricas_uso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_ia_id INT NOT NULL,
    fecha_uso DATE NOT NULL,
    tiempo_uso_minutos INT DEFAULT 0,
    interacciones_totales INT DEFAULT 0,
    codigo_generado_lineas INT DEFAULT 0,
    errores_encontrados INT DEFAULT 0,
    prompts_enviados INT DEFAULT 0,
    sesiones INT DEFAULT 1,
    proyecto_id INT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (servicio_ia_id) REFERENCES servicios_ia(id) ON DELETE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id) ON DELETE SET NULL,
    UNIQUE KEY unique_user_service_date (usuario_id, servicio_ia_id, fecha_uso),
    INDEX idx_fecha (fecha_uso),
    INDEX idx_usuario (usuario_id),
    INDEX idx_servicio (servicio_ia_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: comparaciones
-- ============================================
CREATE TABLE IF NOT EXISTS comparaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    servicios_comparados JSON NOT NULL,
    criterios_comparacion JSON,
    resultado_comparacion JSON,
    conclusiones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    publico BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_usuario (usuario_id),
    INDEX idx_publico (publico)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: tutoriales
-- ============================================
CREATE TABLE IF NOT EXISTS tutoriales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    servicio_ia_id INT NOT NULL,
    autor_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    contenido LONGTEXT NOT NULL,
    nivel ENUM('principiante', 'intermedio', 'avanzado') NOT NULL,
    duracion_minutos INT,
    tags JSON,
    requisitos JSON,
    objetivos JSON,
    url_video VARCHAR(255),
    archivos_adjuntos JSON,
    vistas INT DEFAULT 0,
    likes INT DEFAULT 0,
    fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (servicio_ia_id) REFERENCES servicios_ia(id) ON DELETE CASCADE,
    FOREIGN KEY (autor_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_servicio (servicio_ia_id),
    INDEX idx_nivel (nivel),
    INDEX idx_activo (activo),
    FULLTEXT idx_contenido (titulo, descripcion, contenido)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Tabla: suscripciones_servicios
-- ============================================
CREATE TABLE IF NOT EXISTS suscripciones_servicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_ia_id INT NOT NULL,
    tipo_plan ENUM('gratuito', 'estudiante', 'profesional', 'empresarial') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    precio_pagado DECIMAL(10, 2),
    activa BOOLEAN DEFAULT TRUE,
    renovacion_automatica BOOLEAN DEFAULT FALSE,
    notas TEXT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (servicio_ia_id) REFERENCES servicios_ia(id) ON DELETE CASCADE,
    INDEX idx_usuario (usuario_id),
    INDEX idx_servicio (servicio_ia_id),
    INDEX idx_activa (activa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Inserción de datos de ejemplo
-- ============================================

-- Insertar servicios de IA populares
INSERT INTO servicios_ia (nombre, slug, descripcion, url_oficial, tipo_servicio, categoria, modelo_ia, plan_gratuito, nivel_recomendado) VALUES
('Lovable', 'lovable', 'Plataforma de desarrollo de aplicaciones web con IA que genera código React moderno', 'https://lovable.dev', 'builder_ui', 'frontend', 'GPT-4', TRUE, 'todos'),
('V0 by Vercel', 'v0', 'Generador de componentes React con IA usando shadcn/ui y Tailwind CSS', 'https://v0.dev', 'generador_codigo', 'frontend', 'GPT-4', TRUE, 'intermedio'),
('Bolt.new', 'bolt-new', 'IDE completo en el navegador con capacidades de IA para desarrollo full-stack', 'https://bolt.new', 'ide_cloud', 'fullstack', 'Claude', TRUE, 'todos'),
('Cursor', 'cursor', 'Editor de código basado en VS Code con IA avanzada integrada', 'https://cursor.sh', 'editor', 'general', 'GPT-4', TRUE, 'intermedio'),
('Replit', 'replit', 'Plataforma de desarrollo colaborativo en la nube con Ghostwriter AI', 'https://replit.com', 'ide_cloud', 'educacion', 'Propio', TRUE, 'principiante'),
('Claude', 'claude', 'Asistente de IA conversacional con capacidades avanzadas de programación', 'https://claude.ai', 'asistente', 'general', 'Claude-3-Sonnet', TRUE, 'todos'),
('GitHub Copilot', 'github-copilot', 'Asistente de programación que se integra en editores populares', 'https://github.com/features/copilot', 'asistente', 'general', 'GPT-4', FALSE, 'intermedio');

-- Vista para estadísticas de servicios
CREATE OR REPLACE VIEW vista_estadisticas_servicios AS
SELECT 
    s.id,
    s.nombre,
    s.tipo_servicio,
    COUNT(DISTINCT p.id) as total_proyectos,
    COUNT(DISTINCT e.id) as total_evaluaciones,
    AVG(e.puntuacion) as promedio_puntuacion,
    COUNT(DISTINCT m.usuario_id) as usuarios_activos,
    SUM(m.tiempo_uso_minutos) as minutos_uso_total
FROM servicios_ia s
LEFT JOIN proyectos p ON s.id = p.servicio_ia_id
LEFT JOIN evaluaciones e ON s.id = e.servicio_ia_id
LEFT JOIN metricas_uso m ON s.id = m.servicio_ia_id
WHERE s.activo = TRUE
GROUP BY s.id, s.nombre, s.tipo_servicio;

-- Vista para proyectos de usuarios
CREATE OR REPLACE VIEW vista_proyectos_usuarios AS
SELECT 
    u.id as usuario_id,
    u.nombres,
    u.apellidos,
    u.codigo_universitario,
    s.nombre as servicio_ia,
    p.titulo as proyecto,
    p.tipo_proyecto,
    p.estado,
    p.tiempo_desarrollo_horas,
    p.fecha_inicio,
    p.fecha_fin
FROM usuarios u
INNER JOIN proyectos p ON u.id = p.usuario_id
INNER JOIN servicios_ia s ON p.servicio_ia_id = s.id;

-- Comentarios en las tablas
ALTER TABLE usuarios COMMENT = 'Almacena información de estudiantes, docentes y administradores';
ALTER TABLE servicios_ia COMMENT = 'Catálogo de servicios de IA disponibles para desarrollo';
ALTER TABLE proyectos COMMENT = 'Proyectos realizados por usuarios usando servicios de IA';
ALTER TABLE evaluaciones COMMENT = 'Evaluaciones y opiniones sobre los servicios de IA';
ALTER TABLE metricas_uso COMMENT = 'Métricas de uso diario de servicios por usuario';
ALTER TABLE comparaciones COMMENT = 'Comparaciones realizadas entre diferentes servicios';
ALTER TABLE tutoriales COMMENT = 'Tutoriales y guías sobre el uso de servicios de IA';
ALTER TABLE suscripciones_servicios COMMENT = 'Control de suscripciones de usuarios a servicios';

-- ============================================
-- Finalización
-- ============================================
SELECT 'Schema de base de datos creado exitosamente' AS mensaje;
