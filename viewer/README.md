# 📊 Browser Forensics Viewer

Interfaz web para visualización y análisis de datos forenses de navegadores.

## 🎯 Características

- **Multi-navegador**: Chrome, Edge, Firefox
- **Visualización completa**: Historial, cookies, descargas, búsquedas
- **Filtros avanzados**: Por navegador, usuario, fecha, texto
- **Exportación CSV**: Datos filtrados listos para análisis
- **Gráficos**: Chart.js para estadísticas visuales
- **Offline**: Funciona sin conexión a internet (CDN fallback)

## 🚀 Uso

1. Abrí `browser_forensics_viewer.html` en tu navegador
2. Arrastrá o seleccioná los archivos de la carpeta del collector:
   - `*_history`
   - `*_cookies`
   - `*_webdata` o `*_formhistory`
3. Explorá las pestañas de análisis

## 📥 Descarga del Collector

El viewer incluye un botón para descargar el script collector embebido.
No necesitás tener el archivo .ps1 por separado.

## 🔧 Tecnologías

- **sql.js** - SQLite compilado a WebAssembly
- **Chart.js** - Gráficos y visualizaciones
- **Vanilla JS** - Sin frameworks pesados
- **CSS Grid/Flexbox** - Layout responsive

## 🎨 Dark Mode

Tema oscuro por defecto, optimizado para análisis prolongado sin fatiga visual.

## 📊 Estructura de Datos Esperada

### Chrome/Edge:
- `History` → tabla `urls`
- `Cookies` → tabla `cookies`
- `Web Data` → tabla `keywords` (búsquedas)
- `History` → tabla `downloads` (descargas)

### Firefox:
- `places.sqlite` → tabla `moz_places` (historial)
- `cookies.sqlite` → tabla `moz_cookies`
- `formhistory.sqlite` → tabla `moz_formhistory` (búsquedas)
- `places.sqlite` → tabla `moz_annos` (descargas)

## 🐛 Troubleshooting

**Problema**: "No se puede cargar archivo"
- **Solución**: Verificar que el archivo tenga extensión correcta (`*_history`, etc.)

**Problema**: "Tabla no encontrada"
- **Solución**: El archivo puede estar corrupto o ser de una versión no soportada del navegador

**Problema**: Funciona en local pero no en servidor
- **Solución**: Configurar headers CORS si es necesario
