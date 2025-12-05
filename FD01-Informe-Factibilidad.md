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

Sistema Sistema de Gestión y Análisis de Herramientas de IA

Informe de Factibilidad

Versión 1.0

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|MPV|ELV|ARV|10/10/2020|Versión Original|

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

# **INDICE GENERAL**

[1. Descripción del Proyecto](#_Toc52661346)

[2. Riesgos](#_Toc52661347)

[3. Análisis de la Situación actual](#_Toc52661348)

[4. Estudio de Factibilidad](#_Toc52661349)

[4.1 Factibilidad Técnica](#_Toc52661350)

[4.2 Factibilidad económica](#_Toc52661351)

[4.3 Factibilidad Operativa](#_Toc52661352)

[4.4 Factibilidad Legal](#_Toc52661353)

[4.5 Factibilidad Social](#_Toc52661354)

[4.6 Factibilidad Ambiental](#_Toc52661355)

[5. Análisis Financiero](#_Toc52661356)

[6. Conclusiones](#_Toc52661357)


<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

**<u>Informe de Factibilidad</u>**

1. <span id="_Toc52661346" class="anchor"></span>**Descripción del Proyecto**

    1.1. Nombre del proyecto

    Herramientas de IA para Estudiantes de Ingeniería de Sistemas.

    1.2. Duración del proyecto

    Semestre académico 2025-II.

    1.3. Descripción

    Proyecto académico que cataloga, evalúa y analiza plataformas de IA aplicables al desarrollo de software. Incluye un esquema de datos desplegable con Terraform en Google Cloud (Cloud SQL MySQL) y un dashboard analítico en Google Looker Studio para visualizar métricas de uso y comparativas entre servicios.

    1.4. Objetivos

        1.4.1 Objetivo general
        Diseñar e implementar una solución académica para registrar y analizar el uso de herramientas de IA por estudiantes de Ingeniería de Sistemas, apoyando la toma de decisiones educativas.

        1.4.2 Objetivos específicos
        - Catalogar servicios de IA relevantes (Lovable, V0, Bolt.new, Cursor, Replit, Claude, GitHub Copilot).
        - Desplegar una base de datos MySQL en Cloud SQL con IaC (Terraform).
        - Definir un esquema que soporte usuarios, proyectos, evaluaciones y métricas.
        - Construir visualizaciones en Looker Studio con indicadores clave.
        - Documentar arquitectura, procesos y mejores prácticas de uso.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Riesgos**

    - Dependencia de servicios de terceros (cambios de políticas, disponibilidad).
    - Costos de nube superiores a lo estimado por uso o región.
    - Limitaciones de seguridad y privacidad de datos académicos.
    - Curva de aprendizaje de Terraform/GCP para el equipo.
    - Conectividad a Internet inestable para despliegue y acceso.
    - Falta de datos suficientes para análisis significativos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Análisis de la Situación actual**

    3.1. Planteamiento del problema

    La proliferación de herramientas de IA para programación dificulta elegir la más adecuada según contexto académico. No existe un repositorio institucional con métricas objetivas de uso y resultados, lo que limita la adopción informada y la evaluación pedagógica.

    3.2. Consideraciones de hardware y software

    - Hardware: equipos estándar de estudiantes/docentes con conexión a Internet.
    - Software: Google Cloud SDK, Terraform, cliente MySQL, Looker Studio.
    - Nube: instancia Cloud SQL MySQL (db-f1-micro) con backups y Query Insights.
    - Control de versiones: Git y GitHub.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Estudio de Factibilidad**

    Se evaluaron aspectos técnicos, económicos y operativos del despliegue en GCP y el uso institucional del sistema de análisis.

    4.1. <span id="_Toc52661350" class="anchor"></span>Factibilidad Técnica

    Tecnologías disponibles y suficientes: Terraform para IaC, Cloud SQL MySQL 8.0, cliente MySQL, Looker Studio. Requiere cuentas GCP con APIs habilitadas (sqladmin, compute, servicenetworking) y conexión a Internet. Se implementan backups automáticos y Query Insights; se recomienda red privada y `require_ssl` para producción.

    4.2. <span id="_Toc52661351" class="anchor"></span>Factibilidad Económica

    Costos estimados de infraestructura mínima:
    - Instancia Cloud SQL `db-f1-micro`: ~$7–10 USD/mes.
    - Tráfico y almacenamiento: variables por uso; mínimo dentro del rango académico.
    - Herramientas de IA: uso de planes gratuitos cuando sea posible.
    - Personal: dedicación académica de estudiantes/docentes.

    4.2.1. Costos Generales
    Insumos y herramientas básicas (conectividad, equipo de cómputo ya disponible institucionalmente).

    4.2.2. Costos operativos durante el desarrollo
    Conectividad y tiempo de laboratorio; sin alquileres adicionales.

    4.2.3. Costos del ambiente
    Configuración de red, dominio institucional opcional, acceso controlado a la instancia.

    4.2.4. Costos de personal
    Participación del equipo académico; no se requiere contratación externa.

    4.2.5. Costos totales del desarrollo del sistema
    Bajo, dentro del presupuesto académico; se recomienda seguimiento mensual.

    4.3. <span id="_Toc52661352" class="anchor"></span>Factibilidad Operativa

    El sistema apoya decisiones académicas, mejora el seguimiento de uso de IA y facilita comparativas. La institución cuenta con capacidad para operar y mantener el sistema con apoyo del área TI.

    4.4. <span id="_Toc52661353" class="anchor"></span>Factibilidad Legal

    Considera protección de datos personales (RGPD/LPDP), licencias de servicios de IA, y términos de uso de GCP. Se evitará almacenar información sensible.

    4.5. <span id="_Toc52661354" class="anchor"></span>Factibilidad Social

    Promueve uso responsable de IA, mejora el aprendizaje y la equidad de acceso.

    4.6. <span id="_Toc52661355" class="anchor"></span>Factibilidad Ambiental

    Impacto ambiental bajo al ser infraestructura en la nube y documentación digital.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661356" class="anchor"></span>**Análisis Financiero**

    Plan financiero orientado al control de costos operativos de nube y al valor académico generado.

    5.1. Justificación de la Inversión

        5.1.1. Beneficios del Proyecto

        Beneficios tangibles: reducción de tiempo de desarrollo, consolidación de métricas, estandarización de evaluación, baja inversión en infraestructura.
        Beneficios intangibles: mejor toma de decisiones académicas, mejora en la enseñanza de herramientas de IA, mayor adopción responsable.

        5.1.2. Criterios de Inversión

        - Relación Beneficio/Costo (B/C): esperada > 1 por bajo costo mensual y alto valor pedagógico.
        - Valor Actual Neto (VAN): positivo bajo escenarios académicos; requiere seguimiento semestral.
        - Tasa Interna de Retorno (TIR): no aplicable estrictamente en contexto académico, se evalúa por impacto educativo.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

6. <span id="_Toc52661357" class="anchor"></span>**Conclusiones**

El proyecto es técnica y económicamente viable en un contexto académico, con costos controlados y tecnologías accesibles. Se recomienda su adopción con políticas de seguridad y uso responsable de IA, y monitoreo de costos y métricas mediante el dashboard.
