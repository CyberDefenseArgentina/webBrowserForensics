# Guía de Implementación - Análisis Forense de Historial de Navegación

## 📋 Descripción General
Sistema completo para extracción, ingesta y análisis forense de historial de navegación web mediante PowerShell y Splunk.

## 🎯 Valor Forense
- **Investigación de incidentes**: Rastrear actividad web sospechosa
- **Detección de amenazas**: Identificar accesos a sitios maliciosos/phishing
- **Auditoría de cumplimiento**: Verificar uso apropiado de recursos
- **Análisis de comportamiento**: Patrones de navegación anómalos
- **Evidencia digital**: Timestamping y trazabilidad completa

---

## 📦 Componentes del Sistema

### 1. Script PowerShell (`Extract-BrowserHistory.ps1`)
**Función**: Extrae historial de Chrome, Edge, Firefox y Brave

**Navegadores soportados**:
- ✅ Google Chrome
- ✅ Microsoft Edge
- ✅ Mozilla Firefox
- ✅ Brave Browser

**Campos extraídos**:
- URL completa
- Título de la página
- Fecha/hora de visita
- Contador de visitas
- Navegador utilizado
- Usuario del sistema
- Nombre del equipo
- Timestamp de extracción

### 2. Dashboard Splunk (`Splunk_Dashboard_BrowserForensics.xml`)
**Función**: Visualización y análisis forense de datos

**Paneles incluidos**:
1. 📊 **Estadísticas generales**: Total registros, navegadores, dominios, usuarios
2. 📈 **Distribución temporal**: Timeline de actividad por navegador
3. 🌐 **Top dominios**: Los 20 sitios más visitados
4. 🔴 **URLs sospechosas**: Detección de phishing, malware, descargas
5. 🌙 **Actividad nocturna**: Uso fuera de horario laboral (22:00-06:00)
6. 🔍 **Búsqueda flexible**: Por término en URL o título
7. 👤 **Análisis por usuario**: Top sitios de cada usuario

---

## 🚀 Implementación Paso a Paso

### FASE 1: Preparación del Entorno

#### Requisitos previos:
```powershell
# 1. Verificar versión de PowerShell (requiere 5.1+)
$PSVersionTable.PSVersion

# 2. Descargar System.Data.SQLite
# Opción A: Desde NuGet
Install-Package System.Data.SQLite.Core -Source nuget.org

# Opción B: Descarga manual desde
# https://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki
```

#### Instalar SQLite DLL:
```powershell
# Ubicar el DLL en la misma carpeta que el script, O:
# Modificar la línea en el script para apuntar a la ruta correcta:
Add-Type -Path "C:\Path\To\System.Data.SQLite.dll"
```

---

### FASE 2: Ejecución del Script

#### Opción 1: Ejecución básica
```powershell
.\Extract-BrowserHistory.ps1
# Output: Desktop\BrowserHistory_YYYYMMDD_HHMMSS.csv
```

#### Opción 2: Ruta personalizada
```powershell
.\Extract-BrowserHistory.ps1 -OutputPath "C:\Forensics\browser_data.csv"
```

#### Opción 3: Ejecución remota (múltiples equipos)
```powershell
$computers = Get-Content "C:\computers.txt"
foreach ($pc in $computers) {
    Invoke-Command -ComputerName $pc -FilePath ".\Extract-BrowserHistory.ps1" -ArgumentList "\\FileServer\Forensics\$pc`_history.csv"
}
```

#### Opción 4: Ejecución programada
```powershell
# Crear tarea programada (diaria a las 2 AM)
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\Extract-BrowserHistory.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 2am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BrowserForensics" -Description "Extracción diaria de historial"
```

---

### FASE 3: Configuración de Splunk

#### 3.1 Crear índice forense
```bash
# En Splunk Web: Settings > Indexes > New Index
Index name: forensics
Max size: 100GB (ajustar según necesidad)
```

#### 3.2 Configurar inputs.conf
```ini
# $SPLUNK_HOME/etc/apps/search/local/inputs.conf

[monitor://C:\Forensics\*.csv]
disabled = false
index = forensics
sourcetype = browser_history
ignoreOlderThan = 7d
```

#### 3.3 Configurar props.conf
```ini
# $SPLUNK_HOME/etc/apps/search/local/props.conf

[browser_history]
INDEXED_EXTRACTIONS = csv
TIMESTAMP_FIELDS = VisitTime
TIME_FORMAT = %Y-%m-%d %H:%M:%S
SHOULD_LINEMERGE = false
KV_MODE = none
FIELD_NAMES = Browser,URL,Title,VisitTime,VisitCount,User,Computer,Timestamp
FIELD_DELIMITER = ,
```

#### 3.4 Instalar dashboard
```bash
# Splunk Web: Settings > Dashboards > Create New Dashboard
# Pegar el contenido de Splunk_Dashboard_BrowserForensics.xml
# O via CLI:
cp Splunk_Dashboard_BrowserForensics.xml $SPLUNK_HOME/etc/apps/search/local/data/ui/views/
```

---

## 🔍 Casos de Uso Forense

### 1. Investigación de Phishing
```spl
index=forensics sourcetype=browser_history
| rex field=URL "^https?://(?:www\.)?(?P<domain>[^/]+)"
| where like(URL, "%login%") OR like(URL, "%verify%") OR like(URL, "%secure%")
| where NOT like(domain, "%google.com%") AND NOT like(domain, "%microsoft.com%")
| table VisitTime, User, domain, URL, Title
```

### 2. Detección de Exfiltración
```spl
index=forensics sourcetype=browser_history
| rex field=URL "https?://(?P<domain>[^/]+)"
| where like(URL, "%upload%") OR like(URL, "%share%") OR like(URL, "%transfer%")
| stats sum(VisitCount) as total_uploads by User, domain
| where total_uploads > 10
```

### 3. Análisis de Comportamiento Anómalo
```spl
index=forensics sourcetype=browser_history
| eval hour = strftime(strptime(VisitTime, "%Y-%m-%d %H:%M:%S"), "%H")
| stats count by User, hour
| where (hour >= 22 OR hour <= 6) AND count > 50
```

### 4. Rastreo de Campaña de Malware
```spl
index=forensics sourcetype=browser_history
| rex field=URL "https?://(?P<domain>[^/]+)"
| lookup threat_intel_domains domain OUTPUT threat_level
| where threat_level="high"
| table VisitTime, User, Computer, domain, URL
```

---

## ⚠️ Consideraciones Importantes

### Privacidad y Legal
- ✅ Obtener autorización escrita antes de implementar
- ✅ Documentar política de monitoreo en contrato laboral
- ✅ Notificar a empleados sobre monitoreo (según legislación local)
- ✅ Limitar acceso a datos sensibles (principio de mínimo privilegio)
- ✅ Implementar retención de datos según compliance (GDPR, etc.)

### Seguridad del Sistema
- 🔒 Encriptar archivos CSV en tránsito y reposo
- 🔒 Restringir permisos del script (solo administradores)
- 🔒 Validar integridad con hashing (SHA256)
- 🔒 Almacenar en ubicación segura con auditoría

### Rendimiento
- ⚡ Evitar ejecución en horario laboral
- ⚡ Programar durante ventanas de mantenimiento
- ⚡ Considerar impacto en equipos con discos lentos
- ⚡ Monitorear uso de CPU/RAM durante extracción

---

## 🛠️ Troubleshooting

### Problema: "No se puede cargar System.Data.SQLite.dll"
**Solución**:
```powershell
# Verificar que el DLL esté en la ruta correcta
Test-Path ".\System.Data.SQLite.dll"

# O instalar via NuGet
Install-Package System.Data.SQLite.Core
```

### Problema: "Access Denied al leer base de datos"
**Solución**:
```powershell
# Ejecutar como administrador
Start-Process powershell -Verb runAs

# O cerrar navegadores antes de ejecutar
Get-Process chrome,msedge,firefox,brave -ErrorAction SilentlyContinue | Stop-Process -Force
```

### Problema: "Splunk no indexa correctamente"
**Solución**:
```bash
# Verificar formato CSV
head -5 archivo.csv

# Reiniciar Splunk
$SPLUNK_HOME/bin/splunk restart

# Verificar logs
tail -f $SPLUNK_HOME/var/log/splunk/splunkd.log
```

---

## 📈 Métricas de Éxito

**KPIs a monitorear**:
- ✅ Cobertura: % de equipos monitoreados
- ✅ Volumen: Registros/día ingresados en Splunk
- ✅ Detección: Alertas de URLs sospechosas/semana
- ✅ Respuesta: Tiempo promedio de investigación de incidentes
- ✅ Falsos positivos: Ratio de alertas vs. incidentes reales

---

## 🔄 Mejoras Futuras

1. **Integración con Threat Intelligence**
   - Consultar VirusTotal API para dominios
   - Correlacionar con feeds de IoCs

2. **Machine Learning**
   - Detectar patrones anómalos automáticamente
   - Clasificación de URLs por categorías

3. **Extracción Adicional**
   - Cookies y sesiones
   - Descargas de archivos
   - Formularios enviados

4. **Automatización**
   - Response automático ante detecciones
   - Envío de alertas por Slack/Email

---

## 📞 Soporte

Para reportar issues o sugerir mejoras, documentar en:
- Repositorio interno
- Sistema de tickets
- Documentación wiki del equipo

---

## 📄 Licencia y Responsabilidad

Este sistema es para uso forense legítimo únicamente.
El uso inadecuado puede violar leyes de privacidad.
Consultar con departamento legal antes de implementar.

