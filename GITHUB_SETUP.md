# 🚀 Quick Start - Subir a GitHub

## Opción 1: Usando los scripts automatizados

### En Windows:
```cmd
init-git-repo.bat
```

### En Linux/Mac:
```bash
bash init-git-repo.sh
```

---

## Opción 2: Manual (si los scripts fallan)

### 1. Descomprimir el archivo

```bash
tar -xzf browser-forensics-repo.tar.gz
cd browser-forensics
```

### 2. Inicializar Git

```bash
git init
git add .
git commit -m "Initial commit: Browser Forensics Toolkit v1.0.0"
```

### 3. Crear repo en GitHub

Ve a: https://github.com/new

Nombre sugerido: `browser-forensics` o `browser-forensics-toolkit`

**NO marcar** "Initialize with README" (ya lo tenemos)

### 4. Conectar y subir

```bash
# Reemplazar TU-USUARIO con tu username de GitHub
git remote add origin https://github.com/TU-USUARIO/browser-forensics.git
git branch -M main
git push -u origin main
```

---

## 🎨 Configurar el repo en GitHub

### Topics sugeridos:
En Settings → Topics, agregar:
- `forensics`
- `cybersecurity`
- `browser-forensics`
- `digital-forensics`
- `incident-response`
- `powershell`
- `security-tools`
- `dfir` (Digital Forensics & Incident Response)

### Descripción sugerida:
```
🔍 Browser forensics toolkit for Chrome, Edge & Firefox - Extract and analyze browsing history, cookies, downloads & searches
```

### Website:
Si querés hostear el viewer como GitHub Page:
```
https://TU-USUARIO.github.io/browser-forensics/viewer/browser_forensics_viewer.html
```

---

## 📱 Habilitar GitHub Pages (opcional)

1. Settings → Pages
2. Source: Deploy from branch
3. Branch: main / (root)
4. Save

Después de unos minutos, el viewer estará disponible en:
`https://TU-USUARIO.github.io/browser-forensics/viewer/browser_forensics_viewer.html`

---

## 🏷️ Crear primera release

1. Ir a "Releases" → "Create a new release"
2. Tag: `v1.0.0`
3. Title: `Browser Forensics Toolkit v1.0.0`
4. Description:
```markdown
## 🎉 Primera Release

Herramienta completa para análisis forense de navegadores web.

### ✨ Características

- 🔧 **Collector** - Script PowerShell para extraer datos
- 📊 **Viewer** - Interfaz HTML para visualizar
- 🎨 **Icons** - 7 iconos SVG profesionales

### 📦 Descarga

- [browser_forensics_viewer.html](viewer/browser_forensics_viewer.html) - Viewer con collector embebido
- [browser_forensics_collector.ps1](collector/browser_forensics_collector.ps1) - Script standalone

### 📚 Documentación

Ver [README.md](README.md) para instrucciones completas.
```

5. Marcar "Set as latest release"
6. Publish release

---

## 🔒 Agregar badges al README (opcional)

Editar README.md y actualizar los badges con tu username:

```markdown
[![GitHub release](https://img.shields.io/github/v/release/TU-USUARIO/browser-forensics)](https://github.com/TU-USUARIO/browser-forensics/releases)
[![GitHub stars](https://img.shields.io/github/stars/TU-USUARIO/browser-forensics)](https://github.com/TU-USUARIO/browser-forensics/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/TU-USUARIO/browser-forensics)](https://github.com/TU-USUARIO/browser-forensics/issues)
```

---

## 📢 Promocionar el proyecto (opcional)

- Compartir en r/cybersecurity
- Compartir en r/netsec
- Tweet con #cybersecurity #forensics #DFIR
- Agregar a awesome-lists de forensics
- Compartir en LinkedIn

---

## ✅ Checklist Post-Setup

- [ ] Repo creado y código subido
- [ ] README.md se ve correctamente
- [ ] Topics configurados
- [ ] Descripción agregada
- [ ] Primera release creada
- [ ] GitHub Pages habilitado (opcional)
- [ ] Badges actualizados (opcional)

---

**¡Listo!** 🎉 Tu proyecto está en GitHub.

Para futuras actualizaciones:
```bash
git add .
git commit -m "feat: descripción del cambio"
git push
```
