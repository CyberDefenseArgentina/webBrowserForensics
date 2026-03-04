# 🔧 Browser Forensics Collector

Script PowerShell para extracción forense de datos de navegadores web.

## ✨ Características

- ✅ **Sin dependencias externas** - Solo PowerShell nativo y `esentutl`
- ✅ **Multi-navegador** - Chrome, Edge, Firefox
- ✅ **Multi-perfil** - Detecta y extrae todos los perfiles
- ✅ **Multi-usuario** - Procesa todos los usuarios del sistema
- ✅ **Manejo de bloqueos** - Usa `esentutl` para copiar archivos en uso
- ✅ **Compresión automática** - Genera ZIP final

## 📦 Datos Extraídos

| Navegador | Historial | Cookies | Descargas | Búsquedas |
|-----------|-----------|---------|-----------|-----------|
| Chrome    | ✅ History | ✅ Cookies | ✅ History (tabla downloads) | ✅ Web Data |
| Edge      | ✅ History | ✅ Cookies | ✅ History (tabla downloads) | ✅ Web Data |
| Firefox   | ✅ places.sqlite | ✅ cookies.sqlite | ✅ places.sqlite (moz_annos) | ✅ formhistory.sqlite |

## 🚀 Uso

### Ejecución Básica

```powershell
.\browser_forensics_collector.ps1
```

### Con Permisos Elevados

```powershell
# Opción 1: Desde PowerShell como Admin
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\browser_forensics_collector.ps1

# Opción 2: Desde CMD como Admin
powershell -ExecutionPolicy Bypass -File browser_forensics_collector.ps1
```

### Ejecución Remota (múltiples equipos)

```powershell
$computers = Get-Content "computers.txt"
foreach ($pc in $computers) {
    Invoke-Command -ComputerName $pc -FilePath .\browser_forensics_collector.ps1
}
```

### Tarea Programada

```powershell
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File C:\Scripts\browser_forensics_collector.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 2am
Register-ScheduledTask -Action $action -Trigger $trigger `
    -TaskName "BrowserForensics" -Description "Recolección diaria de datos forenses"
```

## 📂 Salida

```
C:\Temp\browser_forensics_YYYYMMDD_HHMMSS\
├── usuario_chrome_history
├── usuario_chrome_cookies
├── usuario_chrome_webdata
├── usuario_edge_history
├── usuario_edge_cookies
├── usuario_edge_webdata
├── usuario_firefox_XXXXX_history (places.sqlite)
├── usuario_firefox_XXXXX_cookies
├── usuario_firefox_XXXXX_formhistory
└── ... (más perfiles)

C:\Temp\browser_forensics_YYYYMMDD_HHMMSS.zip  ← Archivo final
```

## 🔧 Requisitos

- **Sistema Operativo**: Windows 10/11, Windows Server 2016+
- **PowerShell**: 5.1 o superior (incluido en Windows)
- **Permisos**: Administrador (recomendado para acceder a perfiles de otros usuarios)
- **Espacio en disco**: ~500MB por usuario (dependiendo del historial)

## ⚙️ Configuración Avanzada

### Cambiar Directorio de Salida

Modificar línea 8:

```powershell
$dest = "D:\Forensics\browser_forensics_$timestamp"  # Cambiar ruta
```

### Excluir Usuarios Específicos

Modificar línea 15:

```powershell
$users = Get-ChildItem C:\Users -Directory | 
    Where-Object { $_.Name -notin @('Public','Default','UsuarioX','UsuarioY') }
```

### Deshabilitar Compresión

Comentar líneas 157-168:

```powershell
# try {
#     Compress-Archive -Path "$dest\*" -DestinationPath $zipPath -Force
#     ...
# }
```

## 🐛 Troubleshooting

### Error: "Execution Policy Restricted"

```powershell
# Solución temporal
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# O ejecutar con bypass
powershell -ExecutionPolicy Bypass -File browser_forensics_collector.ps1
```

### Error: "Access Denied"

**Causa**: Navegador abierto o permisos insuficientes

**Solución**:
1. Ejecutar como Administrador
2. Cerrar navegadores:
   ```powershell
   Get-Process chrome,msedge,firefox -EA SilentlyContinue | Stop-Process -Force
   ```

### Advertencia: "archivo SKIP (en uso)"

**Causa**: Archivo bloqueado por el navegador

**Solución**: El script automáticamente intenta usar `esentutl` como fallback. Si persiste:
- Cerrar el navegador manualmente
- Reiniciar el equipo si es crítico

### Error: "Path too long"

**Causa**: Rutas de archivos muy largas en perfiles de Firefox

**Solución**: Cambiar destino a ruta más corta:
```powershell
$dest = "C:\F\bf_$timestamp"  # Ruta corta
```

## 🔒 Consideraciones de Seguridad

### Datos Sensibles

Los archivos extraídos contienen:
- ⚠️ Historial completo de navegación
- ⚠️ Cookies (pueden incluir tokens de sesión)
- ⚠️ Búsquedas y formularios completados
- ⚠️ Lista de descargas

**Recomendaciones**:
1. **Cifrar** el ZIP generado inmediatamente
2. **Eliminar** archivos temporales después de comprimir
3. **Transferir** por canales seguros (no email sin cifrar)
4. **Almacenar** en ubicación con control de acceso

### Autorización

✅ **Obtener autorización escrita** antes de ejecutar
✅ **Documentar** fecha, hora, y motivo de la extracción
✅ **Cumplir** con políticas de privacidad de la organización
✅ **Notificar** a usuarios según legislación aplicable

### Cadena de Custodia

Para evidencia legal:

```powershell
# Calcular hash del ZIP para integridad
Get-FileHash -Path "C:\Temp\browser_forensics_*.zip" -Algorithm SHA256 | 
    Select-Object Hash, Path | 
    Export-Csv -Path "C:\Temp\chain_of_custody.csv" -NoTypeInformation
```

## 📝 Logs

El script genera output en consola con códigos de color:

- 🔵 **Cyan**: Información general
- 🟡 **Yellow**: Procesando usuario/navegador
- 🟢 **Green**: Operación exitosa
- 🔴 **Red**: Error crítico
- ⚪ **Gray**: Detalles de perfil
- 🟠 **DarkYellow**: Advertencia (archivo omitido)

## 🔄 Versionado

Versión actual: **1.0.0**

Para verificar la versión en el script, ver encabezado (líneas 1-5).

## 🤝 Contribuciones

Para mejorar el collector:

1. **Nuevos navegadores**: Agregar sección similar a Chrome/Edge/Firefox
2. **Nuevos artefactos**: Agregar archivos a `$filesToCopy`
3. **Optimizaciones**: Mejorar velocidad de copia
4. **Logging**: Agregar logs a archivo

Ver [CONTRIBUTING.md](../CONTRIBUTING.md) para guidelines.

## 📚 Referencias

- [ESEDB File Format](https://github.com/libyal/libesedb/blob/main/documentation/Extensible%20Storage%20Engine%20(ESE)%20Database%20File%20(EDB)%20format.asciidoc)
- [Chrome History Format](https://www.forensicswiki.org/wiki/Google_Chrome)
- [Firefox Places.sqlite](https://www.forensicswiki.org/wiki/Mozilla_Firefox_3_History_File_Format)
- [PowerShell Forensics](https://github.com/Invoke-IR/PowerForensics)
