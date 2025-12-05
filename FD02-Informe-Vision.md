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

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|Estudiante|Docente|Docente|05/12/2025|Versión Original|


<div style="page-break-after: always; visibility: hidden">\pagebreak</div>


**INDICE GENERAL**
#
[1.	Introducción](#_Toc52661346)

1.1	Propósito

1.2	Alcance

1.3	Definiciones, Siglas y Abreviaturas

1.4	Referencias

1.5	Visión General

[2.	Posicionamiento](#_Toc52661347)

2.1	Oportunidad de negocio

2.2	Definición del problema

[3.	Descripción de los interesados y usuarios](#_Toc52661348)

3.1	Resumen de los interesados

3.2	Resumen de los usuarios

3.3	Entorno de usuario

3.4	Perfiles de los interesados

3.5	Perfiles de los Usuarios

3.6	Necesidades de los interesados y usuarios

[4.	Vista General del Producto](#_Toc52661349)

4.1	Perspectiva del producto

4.2	Resumen de capacidades

4.3	Suposiciones y dependencias

4.4	Costos y precios

4.5	Licenciamiento e instalación

[5.	Características del producto](#_Toc52661350)

[6.	Restricciones](#_Toc52661351)

[7.	Rangos de calidad](#_Toc52661352)

[8.	Precedencia y Prioridad](#_Toc52661353)

[9.	Otros requerimientos del producto](#_Toc52661354)

[CONCLUSIONES](#_Toc52661355)

[RECOMENDACIONES](#_Toc52661356)

[BIBLIOGRAFIA](#_Toc52661357)

[WEBGRAFIA](#_Toc52661358)


<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Informe de Visión</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Introducción**

    1.1	Propósito
    
    El propósito de este documento es definir la visión del proyecto "Herramientas de IA para Estudiantes de Ingeniería de Sistemas", estableciendo el alcance, los objetivos y las características principales que satisfarán las necesidades de los estudiantes y docentes de la UPT.

    1.2	Alcance
    
    El sistema proporcionará un catálogo web interactivo, un dashboard de análisis de datos y un módulo de gestión de reseñas. No incluye el desarrollo de herramientas de IA, sino la integración de información sobre ellas.

    1.3	Definiciones, Siglas y Abreviaturas
    
    - **Stakeholder:** Interesado en el proyecto.
    - **MVP:** Producto Mínimo Viable.
    - **SaaS:** Software as a Service.

    1.4	Referencias
    
    - Documento de Especificación de Requerimientos (FD03).
    - Documento de Arquitectura de Software (FD04).

    1.5	Visión General
    
    Este documento organiza los requisitos de alto nivel, identificando a los usuarios y sus problemas, y describe cómo el sistema propuesto ofrecerá una solución efectiva y moderna.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Posicionamiento**

    2.1	Oportunidad de negocio
    
    La rápida evolución de la Inteligencia Artificial ha creado un mercado saturado de herramientas. En el ámbito académico, existe una oportunidad para "curar" este contenido y ofrecer una guía confiable que ahorre tiempo y mejore la calidad del aprendizaje.

    2.2	Definición del problema
    
    | El problema de | La dispersión y sobreoferta de herramientas de IA |
    | :--- | :--- |
    | Afecta a | Estudiantes y docentes de Ingeniería de Sistemas |
    | Cuyo impacto es | Dificultad para seleccionar la herramienta adecuada, pérdida de tiempo y uso de herramientas ineficientes |
    | Una solución exitosa sería | Una plataforma centralizada que catalogue, evalúe y compare estas herramientas basándose en métricas reales de uso |

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Descripción de los interesados y usuarios**

    3.1	Resumen de los interesados
    
    | Nombre | Descripción | Responsabilidades |
    | :--- | :--- | :--- |
    | Docentes | Profesores de la EPIS | Validar la calidad académica de las herramientas sugeridas |
    | Dirección de Escuela | Autoridades académicas | Supervisar el impacto del proyecto en la currícula |

    3.2	Resumen de los usuarios
    
    | Nombre | Descripción |
    | :--- | :--- |
    | Estudiante Regular | Busca herramientas para tareas específicas (ej. generar código, resumir papers) |
    | Estudiante Avanzado | Busca herramientas complejas para tesis o proyectos de investigación |
    | Administrador | Gestiona el contenido de la plataforma |

    3.3	Entorno de usuario
    
    Los usuarios accederán desde navegadores web (Chrome, Firefox, Edge) en dispositivos de escritorio y móviles, principalmente dentro del campus universitario o desde sus hogares.

    3.6	Necesidades de los interesados y usuarios
    
    - Acceso rápido a información filtrada por categoría.
    - Ver opiniones de otros estudiantes (prueba social).
    - Visualizar estadísticas para saber qué herramientas son tendencia.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Vista General del Producto**

    4.1	Perspectiva del producto
    
    El sistema es una aplicación web independiente que consume servicios de Google Cloud. Se integra conceptualmente con las necesidades académicas de los cursos de programación e investigación.

    4.2	Resumen de capacidades
    
    - **Catálogo:** Listado searchable y filtrable de herramientas.
    - **Evaluación:** Sistema de estrellas y comentarios.
    - **Dashboard:** Gráficos interactivos de uso.
    - **Administración:** Panel para agregar/editar herramientas.

    4.3	Suposiciones y dependencias
    
    - Se asume que los estudiantes tienen cuentas de correo institucional para el registro.
    - Depende de la disponibilidad de los servicios de Google Cloud.

    4.4	Costos y precios
    
    El acceso será gratuito para la comunidad universitaria. Los costos de infraestructura son absorbidos por créditos educativos o capa gratuita.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661350" class="anchor"></span>**Características del producto**

    - **Filtros Avanzados:** Por precio, tipo de uso (código, texto, imagen), nivel de dificultad.
    - **Top Charts:** Rankings semanales de herramientas más populares.
    - **Integración con Looker:** Reportes visuales embebidos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

6. <span id="_Toc52661351" class="anchor"></span>**Restricciones**

    - **Conectividad:** Requiere conexión a internet permanente.
    - **Idioma:** La interfaz estará inicialmente solo en español.
    - **Plataforma:** Diseño optimizado para web, sin aplicación nativa móvil por el momento.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

7. <span id="_Toc52661352" class="anchor"></span>**Rangos de Calidad**

    - **Usabilidad:** Interfaz intuitiva que no requiera manual de usuario.
    - **Fiabilidad:** Datos precisos y actualizados.
    - **Performance:** Tiempo de carga menor a 3 segundos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661355" class="anchor"></span>**CONCLUSIONES**

El documento de visión establece una hoja de ruta clara para el desarrollo de la plataforma. Se ha identificado una necesidad real y se ha propuesto una solución tecnológica viable y de alto valor para la comunidad académica.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661356" class="anchor"></span>**RECOMENDACIONES**

Se recomienda iniciar con un prototipo funcional (MVP) que incluya las 10 herramientas más populares y validar la experiencia de usuario con un grupo piloto de estudiantes antes del lanzamiento masivo.
