<center>

[comment]: <img src="./media/media/image1.png" style="width:1.088in;height:1.46256in" alt="escudo.png" />

![./media/media/image1.png](./media/logo-upt.png)

**UNIVERSIDAD PRIVADA DE TACNA**

**FACULTAD DE INGENIERIA**

**Escuela Profesional de Ingeniería de Sistemas**

**Proyecto *Herramientas de IA para Estudiantes de Ingeniería de Sistemas***

Curso: *Sistemas de Información*

Docente: *Patrick Cuadros*

Integrantes:

***{Apellidos y nombres del estudiante}***

**Tacna – Perú**

***2025***

**  
**
</center>
<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

Sistema *Herramientas de IA*

Informe de Arquitectura de Software

Versión *1.0*

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|Estudiante|Docente|Docente|05/12/2025|Versión Original|

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

# **INDICE GENERAL**

[1. Introducción](#_Toc52661346)

[2. Representación Arquitectónica](#_Toc52661347)

[3. Metas y Restricciones de la Arquitectura](#_Toc52661348)

[4. Vista Lógica](#_Toc52661349)

[5. Vista de Despliegue](#_Toc52661350)

[6. Vista de Datos](#_Toc52661351)

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Arquitectura de Software</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Introducción**

    1.1. Propósito
    
    Este documento describe la arquitectura de software del sistema de gestión y análisis de herramientas de IA. Proporciona una visión integral de los componentes, sus interacciones y el diseño de datos.

    1.2. Alcance
    
    Aplica al diseño de la base de datos en Cloud SQL, la infraestructura como código (Terraform), los scripts de automatización en Python y la capa de presentación en Looker Studio.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Representación Arquitectónica**

    El sistema sigue un enfoque de arquitectura moderna basada en la nube y orientada a datos (Data-Centric).

    - **Capa de Datos:** Google Cloud SQL (MySQL) que almacena toda la información relacional.
    - **Capa de Lógica/Automatización:** Scripts de Python y Terraform para aprovisionamiento y gestión de datos.
    - **Capa de Presentación/Análisis:** Google Looker Studio para visualización de métricas y reportes.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Metas y Restricciones de la Arquitectura**

    3.1. Metas
    
    - **Modularidad:** Separación clara entre datos, lógica de carga y visualización.
    - **Portabilidad:** Uso de contenedores o entornos virtuales para los scripts de Python.
    - **Automatización:** Despliegue de infraestructura mediante Terraform.

    3.2. Restricciones
    
    - Uso obligatorio de Google Cloud Platform (GCP).
    - Base de datos relacional MySQL 8.0.
    - Presupuesto limitado (uso de Free Tier o créditos educativos).

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Vista Lógica**

    4.1. Diagrama de Clases (Conceptual)

    ```mermaid
    classDiagram
        class Usuario {
            +Int id
            +String nombres
            +String apellidos
            +String email
            +registrar()
            +iniciarSesion()
        }

        class ServicioIA {
            +Int id
            +String nombre
            +String tipo
            +Boolean plan_gratuito
            +listar()
        }

        class Proyecto {
            +Int id
            +String titulo
            +String estado
            +crear()
            +actualizar()
        }

        class Evaluacion {
            +Int id
            +Int puntuacion
            +String comentario
            +publicar()
        }

        Usuario "1" --> "*" Proyecto : crea
        Usuario "1" --> "*" Evaluacion : escribe
        ServicioIA "1" <.. "*" Proyecto : utiliza
        ServicioIA "1" <.. "*" Evaluacion : califica
    ```

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661350" class="anchor"></span>**Vista de Despliegue**

    5.1. Diagrama de Despliegue

    ```mermaid
    graph TD
        subgraph "Cliente"
            Browser[Navegador Web / Looker Studio]
            DevPC[Equipo de Desarrollo]
        end

        subgraph "Google Cloud Platform"
            subgraph "VPC Network"
                CloudSQL[(Cloud SQL MySQL Instance)]
            end
        end

        DevPC -->|Terraform Apply| GCP[GCP API]
        DevPC -->|Python Script| CloudSQL
        GCP -.->|Provisiona| CloudSQL
        Browser -->|Consulta JDBC/Connector| CloudSQL
    ```

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

6. <span id="_Toc52661351" class="anchor"></span>**Vista de Datos**

    6.1. Modelo Entidad-Relación (DER)

    ```mermaid
    erDiagram
        USUARIOS ||--o{ PROYECTOS : crea
        USUARIOS ||--o{ EVALUACIONES : realiza
        USUARIOS ||--o{ METRICAS_USO : genera
        USUARIOS ||--o{ SUSCRIPCIONES : tiene

        SERVICIOS_IA ||--o{ PROYECTOS : usado_en
        SERVICIOS_IA ||--o{ EVALUACIONES : recibe
        SERVICIOS_IA ||--o{ METRICAS_USO : tiene
        SERVICIOS_IA ||--o{ TUTORIALES : tiene
        SERVICIOS_IA ||--o{ SUSCRIPCIONES : ofrece

        USUARIOS {
            int id PK
            string nombres
            string email
            string codigo_universitario
        }

        SERVICIOS_IA {
            int id PK
            string nombre
            string tipo_servicio
            decimal precio_mensual
        }

        PROYECTOS {
            int id PK
            int usuario_id FK
            int servicio_ia_id FK
            string titulo
            string estado
        }

        EVALUACIONES {
            int id PK
            int usuario_id FK
            int servicio_ia_id FK
            int puntuacion
            string comentario
        }
    ```
