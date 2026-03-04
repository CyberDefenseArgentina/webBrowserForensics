# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir a **Browser Forensics Toolkit**!

## 🎯 Formas de Contribuir

- 🐛 Reportar bugs
- 💡 Sugerir nuevas funcionalidades
- 📝 Mejorar documentación
- 🔧 Enviar pull requests con código
- 🎨 Diseñar nuevos iconos
- 🧪 Agregar tests
- 🌍 Traducir a otros idiomas

## 📋 Código de Conducta

Este proyecto sigue el [Contributor Covenant](https://www.contributor-covenant.org/). Esperamos que todos los participantes:

- Sean respetuosos y considerados
- Acepten críticas constructivas
- Se enfoquen en lo mejor para la comunidad
- Mantengan un ambiente profesional

## 🐛 Reportar Bugs

Antes de reportar un bug:

1. **Buscar** en los issues existentes para evitar duplicados
2. **Verificar** que estás usando la última versión
3. **Reproducir** el bug en un entorno limpio

### Template de Bug Report

```markdown
**Descripción del Bug**
Descripción clara y concisa del problema.

**Pasos para Reproducir**
1. Ejecutar script con '...'
2. Cargar archivo '....'
3. Ver error en '....'

**Comportamiento Esperado**
Lo que debería suceder.

**Comportamiento Actual**
Lo que realmente sucede.

**Screenshots**
Si aplica, adjuntar capturas de pantalla.

**Entorno**
- OS: [e.g. Windows 10 21H2]
- PowerShell: [e.g. 5.1.19041.1320]
- Navegador (para viewer): [e.g. Chrome 108]

**Logs**
```
Pegar output del script o errores de consola
```

**Contexto Adicional**
Cualquier otra información relevante.
```

## 💡 Sugerir Funcionalidades

### Template de Feature Request

```markdown
**¿Tu request está relacionado a un problema?**
Descripción clara del problema. Ej: "Siempre me frustro cuando [...]"

**Describe la solución que te gustaría**
Descripción clara de lo que quieres que suceda.

**Describe alternativas que consideraste**
Otras soluciones o funcionalidades que consideraste.

**Contexto Adicional**
Screenshots, ejemplos, referencias, etc.
```

## 🔧 Pull Requests

### Proceso

1. **Fork** el repositorio
2. **Crear** una rama para tu feature:
   ```bash
   git checkout -b feature/nombre-descriptivo
   ```
3. **Desarrollar** tu cambio con commits descriptivos:
   ```bash
   git commit -m "feat: agregar soporte para Opera browser"
   ```
4. **Pushear** a tu fork:
   ```bash
   git push origin feature/nombre-descriptivo
   ```
5. **Abrir** un Pull Request desde GitHub

### Convenciones de Commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: nueva funcionalidad
fix: corrección de bug
docs: cambios en documentación
style: formateo, puntos y comas, etc.
refactor: refactorización de código
test: agregar tests
chore: mantención, dependencias, etc.
```

Ejemplos:
```bash
feat(collector): agregar soporte para Brave browser
fix(viewer): corregir parsing de cookies de Firefox
docs(readme): actualizar instrucciones de instalación
style(collector): formatear código según PSScriptAnalyzer
```

### Checklist antes de PR

- [ ] El código sigue el estilo del proyecto
- [ ] He comentado el código en áreas difíciles
- [ ] He actualizado la documentación relevante
- [ ] Mis cambios no generan nuevos warnings
- [ ] He probado en Windows 10 y 11
- [ ] He agregado tests si corresponde

## 📝 Guía de Estilo

### PowerShell

```powershell
# ✅ Correcto
function Get-BrowserData {
    param(
        [string]$BrowserName,
        [string]$ProfilePath
    )
    
    Write-Host "[+] Processing $BrowserName..." -ForegroundColor Yellow
    
    if (Test-Path $ProfilePath) {
        # Proceso principal
        Copy-Item $ProfilePath $Destination -ErrorAction Stop
    }
}

# ❌ Incorrecto
function get_browser_data($browser,$path){
    echo "Processing..."
    cp $path $dest
}
```

**Reglas**:
- Usar `Verb-Noun` para nombres de funciones
- PascalCase para parámetros
- Comentarios descriptivos
- Manejo de errores con `-ErrorAction`
- Usar `Write-Host` con colores para output

### JavaScript (Viewer)

```javascript
// ✅ Correcto
function parseHistory(db, metadata) {
  const results = [];
  
  try {
    const query = 'SELECT url, title, visit_time FROM urls';
    const response = db.exec(query);
    
    if (response.length) {
      for (const row of response[0].values) {
        results.push({
          url: row[0],
          title: row[1],
          visitTime: chromeTime(row[2]),
          ...metadata
        });
      }
    }
  } catch (error) {
    console.error('Error parsing history:', error);
  }
  
  return results;
}

// ❌ Incorrecto
function parseHist(db,meta){
    var r=[];
    var q='SELECT * FROM urls';
    var res=db.exec(q);
    for(var i=0;i<res[0].values.length;i++){
        r.push({url:res[0].values[i][0]});
    }
    return r;
}
```

**Reglas**:
- camelCase para variables y funciones
- `const`/`let` en lugar de `var`
- Destructuring cuando sea apropiado
- Try-catch para operaciones de BD
- Comentarios para lógica compleja

### Markdown

```markdown
# ✅ Correcto
## Título de Sección

Descripción clara del tema.

### Subsección

- Item 1
- Item 2
  - Sub-item

**Código**:
\`\`\`powershell
Get-Process | Where-Object CPU -gt 100
\`\`\`

# ❌ Incorrecto
## titulo sin descripcion
-item1
-item2
codigo sin formato
```

## 🧪 Testing

### Casos de Prueba Mínimos

Antes de enviar PR, probar:

**Collector**:
- [ ] Ejecutar en Windows 10 y 11
- [ ] Ejecutar con y sin permisos de admin
- [ ] Probar con Chrome, Edge, Firefox instalados
- [ ] Probar con navegadores cerrados y abiertos
- [ ] Verificar que el ZIP se genera correctamente

**Viewer**:
- [ ] Cargar archivos de Chrome, Edge, Firefox
- [ ] Probar todos los filtros
- [ ] Exportar a CSV
- [ ] Verificar gráficos en la pestaña Analytics
- [ ] Probar en Chrome, Edge, Firefox (navegadores)

## 📚 Documentación

Al agregar nueva funcionalidad:

1. **Actualizar README.md** con la nueva feature
2. **Agregar comentarios** en el código
3. **Crear ejemplos** de uso
4. **Actualizar CHANGELOG.md**

## 🏗️ Arquitectura

### Estructura del Proyecto

```
browser-forensics/
├── collector/          # Scripts de recolección
│   └── *.ps1          # PowerShell scripts
├── viewer/            # Interfaz de visualización
│   └── *.html         # HTML/JS/CSS
├── icons/             # Assets gráficos
│   └── *.svg          # Iconos vectoriales
├── docs/              # Documentación extendida
└── tests/             # Tests (futuro)
```

### Principios de Diseño

1. **No dependencias externas** - Usar solo herramientas nativas
2. **Offline-first** - Debe funcionar sin internet
3. **Forense-friendly** - Mantener integridad de datos
4. **Cross-platform** (futuro) - Preparar para Linux/Mac
5. **Privacidad** - No enviar datos a servidores

## 🎨 Assets (Iconos)

Al contribuir nuevos iconos:

- Formato SVG
- 200x200px viewBox
- Líneas negras, fondo transparente
- stroke-width: 3-4 (principal), 1.5-2.5 (detalles)
- Incluir README.md con descripción

## 🔐 Seguridad

Si encontrás una vulnerabilidad de seguridad:

**NO abrir un issue público**

En su lugar:
1. Enviar email a: [seguridad@proyecto.com]
2. Describir la vulnerabilidad en detalle
3. Incluir pasos para reproducir
4. Dar tiempo para patch (responsible disclosure)

## 📜 Licencia

Al contribuir, aceptás que tu código será licenciado bajo [MIT License](LICENSE).

## 🙏 Reconocimientos

Todos los contribuidores serán listados en:
- README.md (sección Contributors)
- CHANGELOG.md (por release)

---

## ❓ Preguntas

Si tenés dudas sobre cómo contribuir:

1. Revisar issues existentes con label `question`
2. Abrir un nuevo issue con label `question`
3. Unirte a las [Discussions](../../discussions) de GitHub

---

**¡Gracias por contribuir a Browser Forensics Toolkit!** 🎉
