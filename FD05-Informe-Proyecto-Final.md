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

Informe de Proyecto Final

Versión *1.0*

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|Estudiante|Docente|Docente|05/12/2025|Versión Original|

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

# **INDICE GENERAL**

[1. Resumen Ejecutivo](#_Toc52661346)

[2. Gestión del Proyecto](#_Toc52661347)

[3. Desarrollo Técnico](#_Toc52661348)

[4. Aseguramiento de la Calidad](#_Toc52661349)

[5. Lecciones Aprendidas](#_Toc52661350)

[6. Conclusiones y Trabajo Futuro](#_Toc52661351)

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Informe de Proyecto Final</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Resumen Ejecutivo**

    El proyecto "Herramientas de IA para Estudiantes de Ingeniería de Sistemas" se ha completado exitosamente, entregando una plataforma funcional que centraliza el conocimiento sobre herramientas de inteligencia artificial. El sistema integra una base de datos en la nube (Google Cloud SQL), scripts de automatización para la ingesta de datos y un dashboard interactivo en Looker Studio. Se han cumplido los objetivos principales de catalogar, evaluar y visualizar herramientas relevantes para la comunidad académica.

2. <span id="_Toc52661347" class="anchor"></span>**Gestión del Proyecto**

    2.1. Metodología Utilizada
    
    Se utilizó una metodología ágil híbrida, adaptada al contexto académico. Se realizaron iteraciones semanales (Sprints) enfocadas en entregables tangibles:
    - **Fase 1:** Diseño de BD y aprovisionamiento de infraestructura (Terraform).
    - **Fase 2:** Desarrollo de scripts de carga de datos (Python).
    - **Fase 3:** Configuración de visualizaciones (Looker Studio).
    - **Fase 4:** Documentación y cierre.

    2.2. Cronograma Ejecutado
    
    El proyecto se ejecutó dentro del plazo de 4 meses establecido en el semestre académico 2025-I, sin desviaciones significativas en la ruta crítica.

3. <span id="_Toc52661348" class="anchor"></span>**Desarrollo Técnico**

    3.1. Infraestructura
    
    Se desplegó exitosamente la infraestructura en Google Cloud Platform utilizando Terraform. Se provisionó una instancia MySQL `db-f1-micro` en la región `us-central1`. La configuración de red permite conexiones seguras para la administración y la ingesta de datos.

    3.2. Base de Datos
    
    El esquema relacional implementado soporta eficientemente las entidades de Usuarios, Servicios IA, Proyectos y Evaluaciones. La normalización de datos hasta la 3FN asegura la integridad de la información.

    3.3. Automatización
    
    Se desarrolló un script en Python (`simulate_data_upload.py`) que utiliza la librería `Faker` para generar datos sintéticos realistas. Esto permitió poblar la base de datos con miles de registros de prueba para validar las métricas del dashboard.

4. <span id="_Toc52661349" class="anchor"></span>**Aseguramiento de la Calidad**

    4.1. Pruebas Funcionales
    
    Se verificaron los flujos principales:
    - Registro de nuevas herramientas.
    - Generación correcta de métricas de uso.
    - Actualización en tiempo real del dashboard.

    4.2. Pruebas de Carga
    
    El script de simulación se utilizó para estresar la base de datos, confirmando que la instancia `db-f1-micro` es suficiente para la carga académica esperada (hasta 50 usuarios concurrentes).

5. <span id="_Toc52661350" class="anchor"></span>**Lecciones Aprendidas**

    - **Infraestructura como Código:** El uso de Terraform, aunque tuvo una curva de aprendizaje inicial, simplificó enormemente el redespliegue del entorno de pruebas.
    - **Calidad de Datos:** La generación de datos de prueba coherentes es crucial para diseñar visualizaciones efectivas en Looker Studio antes de tener usuarios reales.
    - **Costos Cloud:** Es vital monitorear el consumo de recursos en la nube para mantenerse dentro de la capa gratuita o créditos educativos.

6. <span id="_Toc52661351" class="anchor"></span>**Conclusiones y Trabajo Futuro**

    6.1. Conclusiones
    
    El proyecto demuestra que es factible crear herramientas de gestión de conocimiento sofisticadas utilizando recursos de nube de bajo costo. La integración de IA en el flujo de trabajo de los estudiantes es inevitable, y esta plataforma sirve como un primer paso para ordenarla.

    6.2. Trabajo Futuro
    
    - Implementar un sistema de autenticación OAuth con correos institucionales.
    - Desarrollar una API REST para que otras aplicaciones universitarias consuman el catálogo.
    - Integrar un chatbot (RAG) que responda preguntas sobre las herramientas utilizando la base de datos como contexto.
