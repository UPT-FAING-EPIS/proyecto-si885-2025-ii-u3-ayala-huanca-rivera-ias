<center>

[comment]: <img src="./media/media/image1.png" style="width:1.088in;height:1.46256in" alt="escudo.png" />

![./media/media/image1.png](./media/logo-upt.png)

**UNIVERSIDAD PRIVADA DE TACNA**

**FACULTAD DE INGENIERIA**

**Escuela Profesional de Ingeniería de Sistemas**

**Proyecto Herramientas de IA para Estudiantes de Ingeniería de Sistemas**

Curso: SI885 - Sistemas de Información

Docente: Por definir

Integrantes:

Ayala · Huanca · Rivera (códigos por definir)

**Tacna – Perú**

**2025**

**  
**
</center>
<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|MPV|ELV|ARV|10/10/2020|Versión Original|












**Sistema Sistema de Gestión y Análisis de Herramientas de IA**

**Documento de Visión**

**Versión 1.0**
**

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|MPV|ELV|ARV|10/10/2020|Versión Original|


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

b) Estandares legales

c) Estandares de comunicación	](#_toc394513800)37

d) Estandaraes de cumplimiento de la plataforma	](#_toc394513800)42

e) Estandaraes de calidad y seguridad	](#_toc394513800)42

[CONCLUSIONES](#_Toc52661355)

[RECOMENDACIONES](#_Toc52661356)

[BIBLIOGRAFIA](#_Toc52661357)

[WEBGRAFIA](#_Toc52661358)


<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Informe de Visión</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Introducción**

    1.1 Propósito

    Definir la visión del sistema que cataloga y analiza el uso de herramientas de IA por estudiantes, proporcionando información para decisiones académicas.

    1.2 Alcance

    Registro de servicios de IA, usuarios, proyectos, evaluaciones y métricas; visualización en dashboard; despliegue de base de datos en GCP.

    1.3 Definiciones, Siglas y Abreviaturas

    IA: Inteligencia Artificial; GCP: Google Cloud Platform; IaC: Infraestructura como Código; Cloud SQL: servicio de base de datos administrado.

    1.4 Referencias

    Documentación institucional, `README.md` del proyecto y documentación en `terraform/README.md` y `terraform/QUICKSTART.md`.

    1.5 Visión General

    Plataforma académica ligera que centraliza información de uso de IA y produce indicadores comparativos para orientar aprendizaje y adopción.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Posicionamiento**

    2.1 Oportunidad de negocio

    A nivel académico, existe oportunidad de medir y comparar el impacto de herramientas de IA en el aprendizaje y productividad.

    2.2 Definición del problema

    No hay repositorios con datos objetivos y consistentes sobre uso y resultados de herramientas de IA en la institución.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Descripción de los interesados y usuarios**

    3.1 Resumen de los interesados
    - Docentes y coordinación académica.
    - Estudiantes de Ingeniería de Sistemas.
    - Área de TI institucional.

    3.2 Resumen de los usuarios
    - Estudiantes: registran proyectos y evaluaciones.
    - Docentes: consultan métricas y comparativas.

    3.3 Entorno de usuario
    Acceso web a dashboard; base de datos gestionada en la nube; clientes estándar (navegador y herramientas CLI).

    3.4 Perfiles de los interesados
    - Docente: define criterios y analiza resultados.
    - Coordinación: evalúa adopción y costos.

    3.5 Perfiles de los Usuarios
    - Estudiante: utiliza servicios de IA y reporta métricas y evaluaciones.

    3.6 Necesidades de los interesados y usuarios
    Indicadores confiables, comparativas claras, bajo costo, facilidad de uso y seguridad de datos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Vista General del Producto**

    4.1 Perspectiva del producto
    Módulo de datos en Cloud SQL y visualización en Looker Studio; se integra con prácticas de curso y repositorios académicos.

    4.2 Resumen de capacidades
    Catalogación de servicios de IA, registro de proyectos, evaluaciones, métricas de uso, vistas analíticas y comparativas.

    4.3 Suposiciones y dependencias
    Cuenta GCP activa, APIs habilitadas, conectividad estable, uso responsable de herramientas de IA.

    4.4 Costos y precios
    Nivel mínimo: instancia `db-f1-micro` (~$7–10 USD/mes) más almacenamiento y tráfico según uso.

    4.5 Licenciamiento e instalación
    Uso de planes gratuitos de servicios de IA cuando sea posible; despliegue mediante Terraform; acceso autorizado a la base de datos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661350" class="anchor"></span>**Características del producto**

    - Catálogo de servicios de IA con metadatos.
    - Registro de proyectos y relación con servicios.
    - Evaluaciones multi-criterio de servicios.
    - Métricas de uso por usuario y servicio.
    - Vistas analíticas para comparaciones y tendencias.
    - Dashboard en Looker Studio.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

6. <span id="_Toc52661351" class="anchor"></span>**Restricciones**

    - Dependencia de Internet y cuentas GCP.
    - Presupuesto académico limitado.
    - Cumplimiento de políticas de privacidad y licencias.
    - Límite de cuotas y recursos en Cloud SQL.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

7. <span id="_Toc52661352" class="anchor"></span>**Rangos de Calidad**

    - Disponibilidad: adecuada para uso académico (horario de clases).
    - Seguridad: acceso autorizado, contraseñas seguras, backups.
    - Rendimiento: consultas básicas rápidas; optimización con Query Insights.
    - Usabilidad: dashboard claro y filtros útiles.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

8. <span id="_Toc52661353" class="anchor"></span>**Precedencia y Prioridad**

    MVP: catálogo, proyectos, evaluaciones y métricas; luego comparativas avanzadas y tutoriales.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

9. <span id="_Toc52661354" class="anchor"></span>**Otros requerimientos del producto**

    Estándares legales: protección de datos y uso responsable de IA.
    Estándares de comunicación: documentación en Markdown, repositorio Git.
    Cumplimiento de plataforma: políticas de GCP y términos de servicios de IA.
    Calidad y seguridad: backups, control de acceso, monitoreo básico.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661355" class="anchor"></span>**CONCLUSIONES**

El producto propuesto responde a necesidades académicas con bajo costo y alto valor informativo. Viable técnica y operativamente.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661356" class="anchor"></span>**RECOMENDACIONES**

Desplegar con IaC, habilitar seguridad (red privada y SSL), establecer políticas de datos y revisar métricas cada ciclo.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661357" class="anchor"></span>**BIBLIOGRAFIA**

Documentación de Cloud SQL, MySQL 8.0, Terraform Google Provider.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

<span id="_Toc52661358" class="anchor"></span>**WEBGRAFIA**

Lovable, V0 by Vercel, Bolt.new, Cursor, Replit, Claude, GitHub Copilot.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>
