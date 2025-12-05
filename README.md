[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/ykj1qgxA)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=21216804)

# 🤖 Herramientas de IA para Estudiantes de Ingeniería de Sistemas

## 📊 Dashboard de Análisis

Visualiza las métricas y análisis de las herramientas de IA en nuestro dashboard interactivo:

**[Ver Dashboard en Looker Studio](https://lookerstudio.google.com/s/te-HqUfRLug)**

---

## 📋 Descripción del Proyecto

Este proyecto documenta y analiza las principales **herramientas de Inteligencia Artificial** disponibles en línea para estudiantes de Ingeniería de Sistemas. El objetivo es proporcionar una guía comprensiva de las plataformas más relevantes que facilitan el desarrollo de software, la generación de código y la creación de aplicaciones web mediante IA.

## 🛠️ Servicios y Herramientas Analizadas

### **Plataformas de Desarrollo con IA**

#### 🎨 **Lovable (lovable.dev)**
Plataforma de desarrollo de aplicaciones web impulsada por IA que permite crear interfaces de usuario modernas mediante descripciones en lenguaje natural. Ideal para prototipos rápidos y desarrollo frontend.

- **Tipo:** Generación de código frontend
- **Lenguajes:** React, TypeScript, Tailwind CSS
- **Casos de uso:** Desarrollo rápido de UI/UX, prototipos interactivos

#### ⚡ **V0 by Vercel (v0.dev)**
Herramienta de Vercel que genera componentes de React utilizando IA. Permite describir la interfaz deseada y obtener código listo para producción basado en shadcn/ui y Tailwind CSS.

- **Tipo:** Generación de componentes React
- **Lenguajes:** React, TypeScript, Tailwind CSS
- **Casos de uso:** Componentes UI reutilizables, diseño de interfaces

#### 🚀 **Bolt.new**
Entorno de desarrollo completo en el navegador con capacidades de IA. Permite escribir, ejecutar y desplegar aplicaciones full-stack directamente desde el navegador.

- **Tipo:** IDE en línea con IA
- **Lenguajes:** JavaScript, TypeScript, Python, Node.js
- **Casos de uso:** Desarrollo full-stack, experimentación rápida

#### 🧠 **Cursor**
Editor de código basado en VS Code con capacidades avanzadas de IA integradas. Ofrece autocompletado inteligente y generación de código contextual.

- **Tipo:** Editor de código con IA
- **Lenguajes:** Múltiples lenguajes de programación
- **Casos de uso:** Desarrollo de software asistido por IA

#### 💻 **Replit**
Plataforma de desarrollo colaborativo en la nube con soporte de IA (Ghostwriter). Permite programar, colaborar y desplegar aplicaciones desde el navegador.

- **Tipo:** IDE en la nube con IA
- **Lenguajes:** Python, JavaScript, Java, C++, y más
- **Casos de uso:** Aprendizaje, colaboración, proyectos educativos

#### 🤖 **Claude by Anthropic**
Asistente de IA conversacional avanzado, especialmente útil para programación y análisis de código. Versión Sonnet ofrece un equilibrio entre velocidad y capacidad.

- **Tipo:** Asistente de IA conversacional
- **Capacidades:** Generación de código, debugging, explicaciones técnicas
- **Casos de uso:** Resolución de problemas, aprendizaje de conceptos

#### 🧪 **GitHub Copilot**
Asistente de programación de IA desarrollado por GitHub y OpenAI. Se integra directamente en editores de código populares.

- **Tipo:** Autocompletado de código con IA
- **Lenguajes:** Soporte para la mayoría de lenguajes
- **Casos de uso:** Aceleración del desarrollo, sugerencias contextuales

## 🗄️ Arquitectura de Datos

El proyecto incluye una arquitectura de base de datos diseñada para almacenar información sobre:

- **Usuarios y perfiles** de estudiantes
- **Servicios de IA** catalogados y sus características
- **Métricas de uso** y estadísticas
- **Proyectos** generados con cada herramienta
- **Evaluaciones** y retroalimentación de usuarios

![Diagrama de Base de Datos](base%20de%20datos.png)

### Despliegue de Infraestructura

Este repositorio incluye scripts de **Terraform** para desplegar automáticamente la infraestructura de base de datos en **Google Cloud Platform**:

- **Base de datos:** Cloud SQL MySQL (instancia compartida)
- **Región:** Configurable
- **Backups:** Automatizados
- **Alta disponibilidad:** Opcional

Ver directorio `/terraform` para más detalles sobre el despliegue.

## 📚 Documentación del Proyecto

El proyecto incluye documentación completa siguiendo estándares de ingeniería de software:

- **[FD01 - Informe de Factibilidad](FD01-Informe-Factibilidad.md)**: Análisis de viabilidad técnica, económica y operativa
- **[FD02 - Informe de Visión](FD02-Informe-Vision.md)**: Visión del producto, interesados y características principales
- **[PDF - Herramientas de IA](Herramientas_de_IA_dirigido_para_los_Estudiantes_de_Ingeniería_de_Sistemas.pdf)**: Documento técnico completo

## 🎯 Objetivos del Proyecto

1. **Catalogar** las principales herramientas de IA para desarrollo de software
2. **Analizar** las capacidades y limitaciones de cada plataforma
3. **Proporcionar métricas** sobre el uso y efectividad de estas herramientas
4. **Facilitar** la toma de decisiones informadas sobre qué herramienta usar según el contexto
5. **Documentar** mejores prácticas y casos de uso reales

## 🚀 Casos de Uso

### Para Estudiantes
- Acelerar el aprendizaje de nuevas tecnologías
- Generar prototipos rápidos para proyectos académicos
- Obtener asistencia en debugging y optimización de código
- Explorar diferentes enfoques de solución

### Para Docentes
- Evaluar el uso de herramientas de IA en el aula
- Diseñar ejercicios que integren IA de manera efectiva
- Monitorear tendencias en tecnologías educativas

### Para la Institución
- Tomar decisiones sobre licencias y suscripciones
- Identificar necesidades de capacitación
- Medir el impacto de la IA en el proceso educativo

## 📊 Métricas y Análisis

El dashboard de Looker Studio proporciona visualizaciones sobre:

- Comparativa de características entre plataformas
- Análisis de popularidad y uso
- Evaluación de curva de aprendizaje
- Costos y modelos de licenciamiento
- Casos de éxito documentados

## 🏗️ Tecnologías del Proyecto

- **Análisis de Datos:** Google Looker Studio
- **Base de Datos:** Google Cloud SQL (MySQL)
- **Infraestructura como Código:** Terraform
- **Control de Versiones:** Git & GitHub
- **Documentación:** Markdown

## 👥 Contribuciones

Este proyecto es parte del curso SI885 - Sistemas de Información de la Universidad Privada de Tacna.

**Facultad de Ingeniería**  
**Escuela Profesional de Ingeniería de Sistemas**

---

## 📝 Licencia

Proyecto académico - Universidad Privada de Tacna © 2025

---

## 🔗 Enlaces Útiles

- [Lovable](https://lovable.dev)
- [V0 by Vercel](https://v0.dev)
- [Bolt.new](https://bolt.new)
- [Cursor](https://cursor.sh)
- [Replit](https://replit.com)
- [Claude](https://claude.ai)
- [GitHub Copilot](https://github.com/features/copilot)

---

**Última actualización:** Noviembre 2025