# Changelog

Todos los cambios notables de este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Planeado
- Soporte para Brave y Opera browsers
- Extracción de extensiones instaladas
- Task Scheduler forensics
- Análisis de contraseñas guardadas
- Integración con MISP/OpenCTI
- Exportación a formato STIX
- Detección automática de IOCs

## [1.0.0] - 2025-01-04

### Añadido

#### Collector (PowerShell)
- Script de extracción forense para Chrome, Edge, Firefox
- Soporte multi-perfil por navegador
- Soporte multi-usuario en el sistema
- Manejo automático de archivos bloqueados con `esentutl`
- Compresión automática a ZIP
- Output con colores para mejor legibilidad
- Extracción de:
  - Historial de navegación
  - Cookies
  - Descargas
  - Búsquedas y formularios

#### Viewer (HTML)
- Interfaz web moderna con dark mode
- Visualización de historial, cookies, descargas, búsquedas
- Filtros avanzados por navegador, usuario, fecha
- Búsqueda en tiempo real
- Exportación a CSV
- Gráficos con Chart.js
- Panel de analytics con estadísticas
- Botón de descarga del collector embebido
- Soporte offline (funciona con file:///)
- Mejora en extracción de descargas de Firefox:
  - Método 1: moz_annos (Firefox antiguo)
  - Método 2: Inferencia por extensiones (.zip, .pdf, etc.)
  - Método 3: tabla moz_downloads (Firefox nuevo)
- Recolección de downloads.sqlite adicional para Firefox

#### Icons
- 7 iconos SVG profesionales:
  - reconnaissance_icon.svg - Reconocimiento
  - inventory_icon.svg - Inventario (clipboard)
  - inventory_alt_icon.svg - Inventario (servidores)
  - project_icon.svg - Proyectos web
  - cyberintel_icon.svg - Ciberinteligencia
  - redteam_icon.svg - Red Team
  - remediation_icon.svg - Remediación

#### Documentación
- README.md principal con instrucciones completas
- README.md individual por componente (collector, viewer, icons)
- GUIA_IMPLEMENTACION.md con guía extendida
- CONTRIBUTING.md con guías de contribución
- LICENSE (MIT)
- .gitignore configurado
- CHANGELOG.md (este archivo)

### Seguridad
- Advertencias legales sobre uso autorizado
- Disclaimers de privacidad
- Guías de cadena de custodia
- Recomendaciones de cifrado de datos

---

## Tipos de Cambios

- **Añadido** (`Added`) - Nuevas funcionalidades
- **Cambiado** (`Changed`) - Cambios en funcionalidades existentes
- **Obsoleto** (`Deprecated`) - Funcionalidades que serán removidas
- **Removido** (`Removed`) - Funcionalidades removidas
- **Corregido** (`Fixed`) - Corrección de bugs
- **Seguridad** (`Security`) - Vulnerabilidades corregidas

---

## Links

- [Unreleased]: Comparar con última versión
- [1.0.0]: Primera release pública
