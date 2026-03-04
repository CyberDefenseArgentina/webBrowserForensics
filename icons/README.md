# 🎨 Browser Forensics Icons

Colección de iconos SVG profesionales para presentaciones de ciberseguridad.

## 📦 Iconos Incluidos

### 🔍 reconnaissance_icon.svg
**Reconocimiento / Asset Discovery**
- Lupa con puntos de escaneo conectados
- Ondas de radar indicando escaneo activo
- Uso: Fases de reconocimiento, descubrimiento de activos

### 📋 inventory_icon.svg
**Inventario de Activos**
- Clipboard con checklist
- Items marcados y sin marcar
- Pequeño servidor en la parte inferior
- Uso: Gestión de inventario, catalogación de activos

### 📋 inventory_alt_icon.svg
**Inventario de Activos (Alternativa)**
- Tres servidores apilados numerados
- Lupa indicando catalogación
- Uso: Inventario técnico, infraestructura de servidores

### 📁 project_icon.svg
**Proyectos Web**
- Carpeta con globo terráqueo/web dentro
- Símbolo de "+" indicando adición
- Uso: Gestión de proyectos web, sitios en análisis

### 🛡️ cyberintel_icon.svg
**Ciberinteligencia**
- Escudo con ojo (vigilancia + seguridad)
- Líneas binarias indicando datos
- Uso: Inteligencia de amenazas, monitoreo de seguridad

### 🎯 redteam_icon.svg
**Red Team**
- Diana/objetivo con círculos concéntricos
- Flechas convergiendo desde múltiples ángulos
- Uso: Pruebas de penetración, simulación de ataques

### 🔧 remediation_icon.svg
**Remediación de Vulnerabilidades**
- Escudo agrietado (vulnerabilidad)
- Llave inglesa (herramienta de reparación)
- Checkmark grande (corrección exitosa)
- Lista de tareas abajo
- Uso: Gestión de vulnerabilidades, parches de seguridad

## 🎨 Características

- ✅ **Formato SVG** - Escalable sin pérdida de calidad
- ✅ **Transparente** - Fondo sin color
- ✅ **Líneas negras** - Perfectos para presentaciones claras/oscuras
- ✅ **200x200px** - Tamaño base optimizado
- ✅ **Vectorial** - Editable en Inkscape, Illustrator, etc.

## 📐 Especificaciones Técnicas

```xml
viewBox="0 0 200 200"
width="200"
height="200"
stroke="black"
stroke-width="3-4" (principal)
stroke-width="1.5-2.5" (detalles)
fill="none" (transparente)
```

## 🖼️ Uso en Presentaciones

### PowerPoint / Google Slides

1. Insertar → Imagen → Seleccionar SVG
2. Redimensionar sin pérdida de calidad
3. Funciona en fondos claros y oscuros

### HTML / Web

```html
<img src="reconnaissance_icon.svg" alt="Reconocimiento" width="64" height="64">
```

### Markdown

```markdown
![Reconocimiento](icons/reconnaissance_icon.svg)
```

## 🎨 Personalización

### Cambiar Color de Líneas

```svg
<!-- Original -->
<circle cx="100" cy="100" r="50" stroke="black" />

<!-- Modificado (azul) -->
<circle cx="100" cy="100" r="50" stroke="#0078d4" />
```

### Cambiar Grosor de Líneas

```svg
<!-- Original -->
<path d="..." stroke-width="4" />

<!-- Más grueso -->
<path d="..." stroke-width="6" />

<!-- Más fino -->
<path d="..." stroke-width="2" />
```

### Agregar Fondo de Color

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">
  <!-- Agregar rectángulo de fondo -->
  <rect x="0" y="0" width="200" height="200" fill="#f0f0f0"/>
  
  <!-- Resto del contenido -->
  ...
</svg>
```

## 📏 Dimensiones Recomendadas

| Uso | Tamaño Recomendado |
|-----|-------------------|
| Favicon | 16x16, 32x32 |
| Íconos de toolbar | 24x24, 32x32 |
| Cards/botones | 48x48, 64x64 |
| Presentaciones | 128x128, 256x256 |
| Hero images | 512x512+ |

## 🛠️ Herramientas de Edición

- **Inkscape** (gratis) - https://inkscape.org/
- **Adobe Illustrator** (pago)
- **Figma** (gratis/pago) - https://figma.com/
- **VS Code** con extensión SVG (para edición de código)

## 📦 Conversión a Otros Formatos

### SVG → PNG

```bash
# Con Inkscape (línea de comandos)
inkscape reconnaissance_icon.svg --export-type=png --export-width=512

# Con ImageMagick
convert -density 300 reconnaissance_icon.svg reconnaissance_icon.png
```

### SVG → ICO (favicon)

```bash
# Con ImageMagick
convert -density 300 -background transparent reconnaissance_icon.svg \
    -define icon:auto-resize=16,32,48,64 reconnaissance_icon.ico
```

## 🎨 Paleta de Colores Sugerida

Para personalizar con colores corporativos:

```css
/* Colores de ciberseguridad */
--cyber-blue: #0078d4;
--cyber-red: #dc4e41;
--cyber-green: #48bb78;
--cyber-purple: #7b68ee;
--cyber-orange: #ff6b35;
--cyber-cyan: #00d4ff;
```

## 📄 Licencia

Estos iconos están bajo la misma licencia MIT del proyecto principal.

Puedes:
- ✅ Usar en proyectos comerciales
- ✅ Modificar y redistribuir
- ✅ Usar sin atribución (aunque es apreciada)

## 🙏 Créditos

Diseñados específicamente para **Browser Forensics Toolkit**

Inspirados en:
- Material Design Icons
- Font Awesome
- Iconografía de ciberseguridad moderna

---

**¿Necesitás más iconos?** Abrí un issue describiendo el concepto y lo agregamos al proyecto.
