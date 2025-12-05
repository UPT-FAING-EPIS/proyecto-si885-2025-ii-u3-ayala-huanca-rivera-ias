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

Informe de Factibilidad

Versión *1.0*

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|Estudiante|Docente|Docente|05/12/2025|Versión Original|

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
    
    Herramientas de IA para Estudiantes de Ingeniería de Sistemas

    1.2. Duración del proyecto
    
    4 meses (Semestre Académico 2025-I)

    1.3. Descripción

    El proyecto consiste en el desarrollo e implementación de una plataforma web y dashboard analítico que centraliza, clasifica y evalúa herramientas de Inteligencia Artificial relevantes para la formación de ingenieros de sistemas. En el contexto actual, la proliferación de herramientas de IA dificulta que los estudiantes identifiquen cuáles son las más efectivas para sus necesidades académicas y profesionales. Este sistema busca solucionar esa brecha de información.

    1.4. Objetivos

        1.4.1 Objetivo general
        
        Desarrollar un sistema de información web y dashboard analítico para la gestión y visualización de herramientas de IA, facilitando la selección y aprendizaje de estas tecnologías por parte de los estudiantes de la EPIS.

        1.4.2 Objetivos Específicos
        
        - Implementar una base de datos relacional en Cloud SQL para catalogar herramientas de IA.
        - Desarrollar un dashboard interactivo en Looker Studio para visualizar métricas de uso y popularidad.
        - Automatizar la carga y actualización de datos mediante scripts de Python y Terraform.
        - Validar la utilidad de las herramientas mediante un sistema de evaluación y reseñas por parte de la comunidad estudiantil.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

2. <span id="_Toc52661347" class="anchor"></span>**Riesgos**

    - **Tecnológicos:** Cambios en las APIs de Google Cloud o costos imprevistos por uso excedente de la capa gratuita.
    - **Operativos:** Baja participación de los estudiantes en la evaluación de herramientas.
    - **De Cronograma:** Retrasos en el aprendizaje de herramientas de Infraestructura como Código (Terraform).
    - **De Datos:** Inconsistencia o falta de actualización en la información de las herramientas de IA, dado el rápido avance del sector.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

3. <span id="_Toc52661348" class="anchor"></span>**Análisis de la Situación actual**

    3.1. Planteamiento del problema

    Actualmente, los estudiantes de Ingeniería de Sistemas de la UPT carecen de una fuente centralizada y confiable que catalogue las herramientas de IA emergentes. La información se encuentra dispersa en foros, redes sociales y documentación técnica, lo que genera pérdida de tiempo y, a menudo, el uso de herramientas subóptimas o inseguras para sus proyectos académicos. No existe un mecanismo formal para compartir experiencias o métricas sobre la efectividad de estas herramientas en el entorno local.

    3.2. Consideraciones de hardware y software

    - **Hardware:** El proyecto no requiere hardware dedicado local, ya que se desplegará en la nube. Los estudiantes y administradores utilizarán sus computadoras personales (laptops/desktops) con conexión a internet.
    - **Software:** Se utilizará Google Cloud Platform (Cloud SQL, Cloud Storage), Terraform para IaC, Python para scripting, GitHub para control de versiones y Looker Studio para la visualización. Estas tecnologías son accesibles y muchas cuentan con capas gratuitas o licencias educativas.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

4. <span id="_Toc52661349" class="anchor"></span>**Estudio de Factibilidad**

    El estudio de factibilidad concluye que el proyecto es viable dado el acceso a recursos educativos de nube y la naturaleza de software del producto.

    4.1. <span id="_Toc52661350" class="anchor"></span>Factibilidad Técnica

    El equipo de proyecto cuenta con los conocimientos necesarios en programación y bases de datos. La tecnología seleccionada (GCP, Terraform, MySQL) es estándar en la industria y está bien documentada.
    
    - **Servidor:** Instancia db-f1-micro en Google Cloud SQL (capa gratuita/económica).
    - **Conectividad:** Acceso vía internet público con listas de control de acceso (ACL).
    - **Herramientas:** VS Code, Git, Terraform CLI.

    4.2. <span id="_Toc52661351" class="anchor"></span>Factibilidad Económica

    El proyecto se basa principalmente en el uso de servicios de capa gratuita (Free Tier) de Google Cloud y software de código abierto.
    
    4.2.1. Costos Generales
    | Concepto | Costo Mensual (Estimado) |
    | :--- | :--- |
    | Internet | S/. 0.00 (Existente) |
    | Material de Escritorio | S/. 20.00 |
    | **Total** | **S/. 20.00** |

    4.2.2. Costos operativos durante el desarrollo
    | Concepto | Costo Mensual |
    | :--- | :--- |
    | Energía Eléctrica | S/. 50.00 |
    | **Total** | **S/. 50.00** |

    4.2.3. Costos del ambiente
    | Concepto | Costo |
    | :--- | :--- |
    | Dominio | S/. 0.00 (Subdominio UPT/Looker) |
    | Hosting/Cloud | S/. 0.00 (Créditos Educativos) |
    | **Total** | **S/. 0.00** |

    4.2.4. Costos de personal
    Se considera como "costo de oportunidad" el tiempo de los estudiantes, valorizado simbólicamente.
    | Rol | Horas/Mes | Costo Unitario | Total |
    | :--- | :--- | :--- | :--- |
    | Desarrollador Fullstack | 40 | S/. 20.00 | S/. 800.00 |
    | Analista de Datos | 20 | S/. 20.00 | S/. 400.00 |
    | **Total Virtual** | | | **S/. 1200.00** |

    4.2.5. Costos totales del desarrollo del sistema
    El costo monetario real es mínimo (aprox S/. 200.00 en total por gastos varios), mientras que el costo virtual de desarrollo asciende a aprox. S/. 4,800.00 por el ciclo.

    4.3. <span id="_Toc52661352" class="anchor"></span>Factibilidad Operativa

    La UPT cuenta con la cultura organizacional y la infraestructura digital para adoptar este sistema. Los estudiantes (Interesados principales) son nativos digitales y buscan activamente estas herramientas. El mantenimiento técnico será transferido al centro de estudiantes o laboratorio de cómputo al finalizar el proyecto.

    4.4. <span id="_Toc52661353" class="anchor"></span>Factibilidad Legal

    El proyecto utilizará software con licencias compatibles (MIT, Apache 2.0). Se respetarán las políticas de privacidad de datos (Ley 29733) asegurando que no se exponga información sensible de los estudiantes.

    4.5. <span id="_Toc52661354" class="anchor"></span>Factibilidad Social 

    El proyecto tiene un impacto social positivo al democratizar el acceso al conocimiento sobre herramientas de IA, reduciendo la brecha digital entre estudiantes de diferentes niveles socioeconómicos.

    4.6. <span id="_Toc52661355" class="anchor"></span>Factibilidad Ambiental

    Al ser un servicio digital en la nube, el impacto ambiental directo es bajo. Se utilizará una región de Google Cloud con baja huella de carbono (ej. us-central1) y se optimizarán los recursos para evitar consumo energético innecesario.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

5. <span id="_Toc52661356" class="anchor"></span>**Análisis Financiero**

    5.1. Justificación de la Inversión

        5.1.1. Beneficios del Proyecto

            Beneficios Intangibles:
            - Mejora en la calidad de los proyectos académicos.
            - Ahorro de tiempo en la investigación de herramientas.
            - Fomento de la innovación tecnológica en la facultad.
        
        5.1.2. Criterios de Inversión

            Dado que es un proyecto académico sin fines de lucro directo, el VAN y la TIR financieros no son las métricas principales. Sin embargo, el "Retorno Social de la Inversión" es alto, dado el costo monetario casi nulo y el alto valor educativo.

            5.1.2.1. Relación Beneficio/Costo (B/C)
            B/C > 1, considerando el valor de mercado de la formación que recibirán los estudiantes vs los costos operativos mínimos.

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

6. <span id="_Toc52661357" class="anchor"></span>**Conclusiones**

    El proyecto "Herramientas de IA para Estudiantes de Ingeniería de Sistemas" es factible en todas sus dimensiones (Técnica, Económica, Operativa, Legal, Social y Ambiental). Los riesgos son manejables y los beneficios académicos superan ampliamente los costos de inversión. Se recomienda proceder con la fase de desarrollo.
