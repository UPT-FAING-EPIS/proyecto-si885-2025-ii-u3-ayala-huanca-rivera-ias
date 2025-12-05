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

Informe de Especificación de Requerimientos

Versión *1.0*

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|Estudiante|Docente|Docente|05/12/2025|Versión Original|

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

# **INDICE GENERAL**

[1. Introducción](#_Toc52661346)

[2. Descripción General](#_Toc52661347)

[3. Requerimientos Funcionales](#_Toc52661348)

[4. Requerimientos No Funcionales](#_Toc52661349)

[5. Modelado de Casos de Uso](#_Toc52661350)

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Especificación de Requerimientos de Software</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Introducción**

    1.1. Propósito
    
    El propósito de este documento es definir los requerimientos funcionales y no funcionales para el sistema "Herramientas de IA para Estudiantes de Ingeniería de Sistemas". Este sistema permitirá catalogar, analizar y visualizar métricas sobre el uso de herramientas de Inteligencia Artificial en el entorno académico.

    1.2. Alcance
    
    El sistema abarca una base de datos de herramientas de IA, un módulo de gestión de usuarios y proyectos, un sistema de evaluaciones y un dashboard analítico. No incluye el desarrollo de las herramientas de IA en sí, sino su gestión y análisis.

    1.3. Definiciones, Siglas y Abreviaturas
    
    - **IA:** Inteligencia Artificial.
    - **Dashboard:** Tablero de control visual para métricas.
    - **CRUD:** Create, Read, Update, Delete.
    - **UPT:** Universidad Privada de Tacna.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Descripción General**

    2.1. Perspectiva del Producto
    
    El sistema es una solución web que integra una base de datos relacional (MySQL en Google Cloud) con una interfaz de visualización (Looker Studio) y scripts de automatización (Python/Terraform). Es independiente pero se integra con servicios de nube.

    2.2. Características de los Usuarios
    
    - **Estudiante:** Busca herramientas, registra sus proyectos y evalúa servicios.
    - **Docente:** Analiza tendencias, recomienda herramientas y revisa métricas.
    - **Administrador:** Gestiona el catálogo de herramientas y usuarios.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Requerimientos Funcionales**

    | Código | Nombre | Descripción |
    | :--- | :--- | :--- |
    | **RF-01** | Gestión de Usuarios | El sistema debe permitir el registro, autenticación y gestión de perfiles de estudiantes y docentes. |
    | **RF-02** | Catálogo de Servicios IA | El sistema debe permitir listar, buscar y filtrar herramientas de IA por categoría, precio y funcionalidades. |
    | **RF-03** | Registro de Proyectos | Los usuarios deben poder registrar proyectos desarrollados con herramientas de IA, detallando lenguaje y estado. |
    | **RF-04** | Sistema de Evaluaciones | Los usuarios deben poder calificar y comentar sobre las herramientas utilizadas (puntuación 1-5). |
    | **RF-05** | Métricas de Uso | El sistema debe registrar métricas de uso como tiempo, líneas de código generadas y errores. |
    | **RF-06** | Visualización de Datos | El sistema debe proveer un dashboard interactivo para visualizar estadísticas y tendencias. |
    | **RF-07** | Comparación de Herramientas | El sistema debe permitir comparar características entre dos o más herramientas de IA. |

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Requerimientos No Funcionales**

    | Código | Nombre | Descripción |
    | :--- | :--- | :--- |
    | **RNF-01** | Disponibilidad | El sistema debe estar disponible el 99.5% del tiempo. |
    | **RNF-02** | Seguridad | Las contraseñas de usuarios deben estar encriptadas. El acceso a la BD debe ser restringido. |
    | **RNF-03** | Rendimiento | Las consultas al dashboard deben cargar en menos de 5 segundos. |
    | **RNF-04** | Escalabilidad | La base de datos debe soportar un crecimiento vertical en Google Cloud SQL. |
    | **RNF-05** | Usabilidad | La interfaz debe ser intuitiva y responsive para dispositivos móviles y escritorio. |

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661350" class="anchor"></span>**Modelado de Casos de Uso**

    5.1. Diagrama General de Casos de Uso

    ```mermaid
    useCaseDiagram
        actor Estudiante as "Estudiante"
        actor Docente as "Docente"
        actor Admin as "Administrador"

        package Sistema_Herramientas_IA {
            usecase "Registrar Usuario" as UC1
            usecase "Iniciar Sesión" as UC2
            usecase "Buscar Herramienta IA" as UC3
            usecase "Evaluar Herramienta" as UC4
            usecase "Registrar Proyecto" as UC5
            usecase "Visualizar Dashboard" as UC6
            usecase "Gestionar Catálogo" as UC7
            usecase "Exportar Reportes" as UC8
        }

        Estudiante --> UC1
        Estudiante --> UC2
        Estudiante --> UC3
        Estudiante --> UC4
        Estudiante --> UC5
        Estudiante --> UC6

        Docente --> UC2
        Docente --> UC3
        Docente --> UC6
        Docente --> UC8

        Admin --> UC2
        Admin --> UC7
        Admin --> UC6
    ```

    5.2. Especificación Resumida de Casos de Uso

    - **UC1 Registrar Usuario:** Permite a un estudiante crear una cuenta con su código universitario.
    - **UC3 Buscar Herramienta IA:** Permite filtrar herramientas por "frontend", "backend", "gratuito", etc.
    - **UC4 Evaluar Herramienta:** El estudiante asigna estrellas y deja un comentario sobre una herramienta.
    - **UC6 Visualizar Dashboard:** Muestra gráficos de torta y barras sobre las herramientas más populares en Looker Studio.
