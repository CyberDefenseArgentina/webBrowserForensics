# 🔍 Browser Forensics Toolkit

> Herramienta forense completa para extracción y análisis de datos de navegadores web (Chrome, Edge, Firefox)

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://github.com/PowerShell/PowerShell)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)](https://www.microsoft.com/windows)

---

## 📋 Descripción

**Browser Forensics Toolkit** es un conjunto de herramientas diseñadas para análisis forense digital, permitiendo la extracción y visualización de datos de navegadores web de forma no invasiva y forense.

### 🎯 Casos de Uso

- **Investigación de incidentes de seguridad** - Rastrear actividad web sospechosa
- **Análisis forense digital** - Recolectar evidencia de navegación web
- **Auditoría de cumplimiento** - Verificar uso apropiado de recursos corporativos
- **Detección de amenazas** - Identificar accesos a sitios maliciosos o phishing
- **Respuesta a incidentes** - Línea de tiempo de actividad del usuario

---

## ✨ Características

### 🔧 Collector (PowerShell)

- ✅ **Sin dependencias externas** - Usa herramientas nativas de Windows
- ✅ **Múltiples navegadores** - Chrome, Edge, Firefox
- ✅ **Múltiples perfiles** - Detecta y extrae todos los perfiles de usuario
- ✅ **Datos completos**:
  - 🌐 Historial de navegación
  - 🍪 Cookies
  - ⬇️ Descargas
  - 🔍 Búsquedas y formularios
- ✅ **Compresión automática** - Genera ZIP con todos los datos
- ✅ **Manejo de archivos bloqueados** - Usa `esentutl` para copiar bases de datos en uso
- ✅ **Multi-usuario** - Extrae datos de todos los usuarios del sistema

### 📊 Viewer (HTML)

- ✅ **Interfaz moderna** - Dark mode, responsive
- ✅ **Visualización completa** - Historial, cookies, descargas, búsquedas, analytics
- ✅ **Filtros avanzados** - Por navegador, usuario, fecha, texto
- ✅ **Búsqueda en tiempo real** - Filtra miles de registros instantáneamente
- ✅ **Exportación CSV** - Exporta datos filtrados para análisis externo
- ✅ **Gráficos y estadísticas** - Visualiza patrones de navegación
- ✅ **Descarga integrada** - Botón para descargar el collector directamente
- ✅ **Funciona offline** - No requiere servidor web, funciona con `file://`

### 🎨 Icons

- ✅ **7 iconos profesionales** en formato SVG
- ✅ **Transparentes con líneas negras** - Perfectos para presentaciones
- ✅ **Temática de ciberseguridad**:
  - Reconocimiento (reconnaissance)
  - Inventario (inventory)
  - Proyecto (project)
  - Ciberinteligencia (cyber intelligence)
  - Red Team
  - Remediación de vulnerabilidades

---

## 🚀 Instalación y Uso

### 📥 Método 1: Descarga desde el Viewer (Recomendado)

1. Abrí `viewer/browser_forensics_viewer.html` en tu navegador
2. Hacé click en el botón **"⬇️ DESCARGAR COLLECTOR.PS1"**
3. Guardá el script en la máquina a analizar

### 📥 Método 2: Descarga Directa

```bash
git clone https://github.com/TU-USUARIO/browser-forensics.git
cd browser-forensics
```

---

## 🎮 Guía de Uso Rápido

### 1️⃣ Ejecutar el Collector

```powershell
# Opción A: Ejecución básica (requiere permisos de administrador)
.\collector\browser_forensics_collector.ps1

# Opción B: Desde cualquier ubicación
powershell -ExecutionPolicy Bypass -File .\browser_forensics_collector.ps1
```

**Salida:**
- Se crea `C:\Temp\browser_forensics_YYYYMMDD_HHMMSS\` con todos los archivos
- Se genera `C:\Temp\browser_forensics_YYYYMMDD_HHMMSS.zip` automáticamente

### 2️⃣ Analizar en el Viewer

1. Abrí `viewer/browser_forensics_viewer.html` en tu navegador
2. Arrastrá o seleccioná los archivos recolectados:
   - `*_history` - Historial de navegación
   - `*_cookies` - Cookies
   - `*_webdata` - Búsquedas (Chrome/Edge)
   - `*_formhistory` - Búsquedas (Firefox)
3. Explorá las pestañas:
   - **📜 HISTORIAL** - URLs visitadas con timestamps
   - **🍪 COOKIES** - Cookies almacenadas
   - **⬇️ DESCARGAS** - Archivos descargados
   - **🔍 BÚSQUEDAS** - Términos buscados
   - **📊 ANALYTICS** - Gráficos y estadísticas

---

## 📂 Estructura del Proyecto

```
browser-forensics/
├── README.md                          # Este archivo
├── LICENSE                            # Licencia MIT
├── .gitignore                         # Archivos ignorados por Git
│
├── collector/                         # Script de recolección
│   └── browser_forensics_collector.ps1
│
├── viewer/                            # Visor HTML
│   └── browser_forensics_viewer.html
│
├── icons/                             # Iconos SVG para presentaciones
│   ├── reconnaissance_icon.svg
│   ├── inventory_icon.svg
│   ├── inventory_alt_icon.svg
│   ├── project_icon.svg
│   ├── cyberintel_icon.svg
│   ├── redteam_icon.svg
│   └── remediation_icon.svg
│
├── docs/                              # Documentación adicional
│   └── GUIA_IMPLEMENTACION.md
│
└── .github/                           # Configuración de GitHub
    └── workflows/
```

---

## 🔒 Consideraciones de Seguridad y Legal

### ⚠️ ADVERTENCIA LEGAL

**Este toolkit está diseñado exclusivamente para:**
- ✅ Análisis forense legítimo con autorización apropiada
- ✅ Auditorías de seguridad autorizadas
- ✅ Investigaciones corporativas internas con consentimiento
- ✅ Investigación académica en entornos controlados

**PROHIBIDO:**
- ❌ Uso sin autorización explícita del propietario del sistema
- ❌ Violación de leyes de privacidad (GDPR, CCPA, etc.)
- ❌ Espionaje no autorizado
- ❌ Cualquier actividad ilegal

### 🛡️ Mejores Prácticas

1. **Obtener autorización escrita** antes de ejecutar en sistemas corporativos
2. **Documentar cadena de custodia** para evidencia legal
3. **Cifrar datos recolectados** en tránsito y reposo
4. **Limitar acceso** a personal autorizado únicamente
5. **Cumplir con políticas** de retención de datos
6. **Notificar a usuarios** según legislación local

---

## 🛠️ Requisitos Técnicos

### Collector (PowerShell)

- **Sistema Operativo**: Windows 10/11, Windows Server 2016+
- **PowerShell**: 5.1 o superior (incluido en Windows)
- **Permisos**: Administrador (recomendado)
- **Herramientas**: `esentutl.exe` (incluido en Windows)

### Viewer (HTML)

- **Navegador**: Chrome, Edge, Firefox (versiones modernas)
- **JavaScript**: Habilitado
- **Librerías externas** (cargadas desde CDN):
  - sql.js 1.10.2
  - Chart.js 4.4.0

---

## 📊 Datos Extraídos por Navegador

| Dato | Chrome | Edge | Firefox |
|------|--------|------|---------|
| Historial | ✅ | ✅ | ✅ |
| Cookies | ✅ | ✅ | ✅ |
| Descargas | ✅ | ✅ | ✅* |
| Búsquedas | ✅ | ✅ | ✅ |
| Múltiples perfiles | ✅ | ✅ | ✅ |

*Firefox: Usa 3 métodos de extracción con fallback automático

---

## 🐛 Troubleshooting

### Problema: "Execution Policy Restricted"

```powershell
# Solución temporal (sesión actual)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# O ejecutar directamente
powershell -ExecutionPolicy Bypass -File .\browser_forensics_collector.ps1
```

### Problema: "Access Denied" al leer bases de datos

**Causa**: Navegador abierto bloqueando archivos

**Solución**: 
```powershell
# Cerrar navegadores antes de ejecutar
Get-Process chrome,msedge,firefox -ErrorAction SilentlyContinue | Stop-Process -Force
```

El script usa `esentutl` automáticamente como fallback.

### Problema: No aparecen descargas de Firefox

**Solución**: El viewer usa 3 métodos de extracción. Si aún no aparecen:
1. Verificar que Firefox tenga descargas registradas
2. Asegurar que se cargó el archivo `*_history` de Firefox
3. Las descargas muy antiguas pueden haber sido eliminadas de la BD

---

## 🔄 Roadmap

- [ ] Soporte para Brave y Opera
- [ ] Extracción de extensiones instaladas
- [ ] Análisis de contraseñas guardadas (con consentimiento)
- [ ] Detección automática de IOCs (Indicators of Compromise)
- [ ] Integración con MISP/OpenCTI
- [ ] Exportación a formato STIX
- [ ] Línea de tiempo unificada multi-navegador
- [ ] Task Scheduler forensics (próximo release)

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Creá una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrí un Pull Request

### 📝 Guidelines

- Mantener compatibilidad con PowerShell 5.1+
- Documentar nuevas funcionalidades
- Incluir ejemplos de uso
- Respetar el código de conducta

---

## 📄 Licencia

Este proyecto está bajo la licencia **MIT** - ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 👤 Autor

**Equipo de Ciberseguridad**

- 🔗 GitHub: [@TU-USUARIO](https://github.com/TU-USUARIO)
- 📧 Email: tu-email@ejemplo.com

---

## 🙏 Agradecimientos

- Comunidad de Digital Forensics
- Proyecto sql.js por el port de SQLite a JavaScript
- Chart.js por las visualizaciones
- Microsoft por las herramientas nativas de Windows

---

## ⚖️ Disclaimer

Esta herramienta se proporciona "tal cual" sin garantías de ningún tipo. Los autores no se hacen responsables del uso indebido o ilegal de este software. El usuario es el único responsable de cumplir con todas las leyes aplicables de privacidad y protección de datos en su jurisdicción.

**USE RESPONSABLEMENTE. OBTENGA AUTORIZACIÓN. RESPETE LA PRIVACIDAD.**

---

<div align="center">

**Si este proyecto te resultó útil, dejá una ⭐ en GitHub!**

Made with 🔒 for the cybersecurity community

</div>
