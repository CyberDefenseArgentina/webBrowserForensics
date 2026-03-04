# ============================================================
#  Browser Forensics Collector
#  Recolecta: historial, cookies, descargas, búsquedas
#  Navegadores: Chrome, Edge, Firefox
# ============================================================

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$dest = "C:\Temp\browser_forensics_$timestamp"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Write-Host "`n[*] Browser Forensics Collector" -ForegroundColor Cyan
Write-Host "[*] Destino: $dest" -ForegroundColor Cyan
Write-Host "[*] Inicio: $(Get-Date)`n" -ForegroundColor Cyan

$users = Get-ChildItem C:\Users -Directory | Where-Object { $_.Name -notin @('Public','Default','Default User','All Users') }

foreach ($userDir in $users) {
    $user = $userDir.Name
    $base = $userDir.FullName
    Write-Host "[+] Usuario: $user" -ForegroundColor Yellow

    # ----------------------------------------------------------
    # CHROME
    # ----------------------------------------------------------
    $chromeBase = "$base\AppData\Local\Google\Chrome\User Data"
    if (Test-Path $chromeBase) {
        $profiles = @("Default") + (Get-ChildItem $chromeBase -Directory | Where-Object { $_.Name -match "^Profile" } | Select-Object -ExpandProperty Name)
        
        foreach ($profile in $profiles) {
            $profilePath = "$chromeBase\$profile"
            if (-not (Test-Path $profilePath)) { continue }

            $suffix = if ($profile -eq "Default") { "" } else { "_$profile" }
            $tag = "${user}_chrome${suffix}"

            Write-Host "  [Chrome] Perfil: $profile" -ForegroundColor Gray

            # Historial
            $src = "$profilePath\History"
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_history" -ErrorAction Stop; Write-Host "    -> history OK" -ForegroundColor Green }
                catch { 
                    & esentutl /y "$src" /d "$dest\${tag}_history" /o 2>$null
                    Write-Host "    -> history (esentutl)" -ForegroundColor Green
                }
            }

            # Cookies
            $src = "$profilePath\Network\Cookies"
            if (-not (Test-Path $src)) { $src = "$profilePath\Cookies" }
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_cookies" -ErrorAction Stop; Write-Host "    -> cookies OK" -ForegroundColor Green }
                catch {
                    & esentutl /y "$src" /d "$dest\${tag}_cookies" /o 2>$null
                    Write-Host "    -> cookies (esentutl)" -ForegroundColor Green
                }
            }

            # Descargas (están en History, tabla downloads - se copia junto con history)
            # Búsquedas - Web Data (contiene search terms y autofill)
            $src = "$profilePath\Web Data"
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_webdata" -ErrorAction Stop; Write-Host "    -> webdata OK" -ForegroundColor Green }
                catch {
                    & esentutl /y "$src" /d "$dest\${tag}_webdata" /o 2>$null
                    Write-Host "    -> webdata (esentutl)" -ForegroundColor Green
                }
            }
        }
    }

    # ----------------------------------------------------------
    # EDGE
    # ----------------------------------------------------------
    $edgeBase = "$base\AppData\Local\Microsoft\Edge\User Data"
    if (Test-Path $edgeBase) {
        $profiles = @("Default") + (Get-ChildItem $edgeBase -Directory | Where-Object { $_.Name -match "^Profile" } | Select-Object -ExpandProperty Name)

        foreach ($profile in $profiles) {
            $profilePath = "$edgeBase\$profile"
            if (-not (Test-Path $profilePath)) { continue }

            $suffix = if ($profile -eq "Default") { "" } else { "_$profile" }
            $tag = "${user}_edge${suffix}"

            Write-Host "  [Edge] Perfil: $profile" -ForegroundColor Gray

            # Historial
            $src = "$profilePath\History"
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_history" -ErrorAction Stop; Write-Host "    -> history OK" -ForegroundColor Green }
                catch {
                    & esentutl /y "$src" /d "$dest\${tag}_history" /o 2>$null
                    Write-Host "    -> history (esentutl)" -ForegroundColor Green
                }
            }

            # Cookies
            $src = "$profilePath\Network\Cookies"
            if (-not (Test-Path $src)) { $src = "$profilePath\Cookies" }
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_cookies" -ErrorAction Stop; Write-Host "    -> cookies OK" -ForegroundColor Green }
                catch {
                    & esentutl /y "$src" /d "$dest\${tag}_cookies" /o 2>$null
                    Write-Host "    -> cookies (esentutl)" -ForegroundColor Green
                }
            }

            # Web Data
            $src = "$profilePath\Web Data"
            if (Test-Path $src) {
                try { Copy-Item $src "$dest\${tag}_webdata" -ErrorAction Stop; Write-Host "    -> webdata OK" -ForegroundColor Green }
                catch {
                    & esentutl /y "$src" /d "$dest\${tag}_webdata" /o 2>$null
                    Write-Host "    -> webdata (esentutl)" -ForegroundColor Green
                }
            }
        }
    }

    # ----------------------------------------------------------
    # FIREFOX
    # ----------------------------------------------------------
    $ffBase = "$base\AppData\Roaming\Mozilla\Firefox\Profiles"
    if (Test-Path $ffBase) {
        $ffProfiles = Get-ChildItem $ffBase -Directory

        foreach ($ffProfile in $ffProfiles) {
            $profilePath = $ffProfile.FullName
            $profileName = $ffProfile.Name
            $tag = "${user}_firefox_${profileName}"

            Write-Host "  [Firefox] Perfil: $profileName" -ForegroundColor Gray

            $filesToCopy = @(
                @{ src = "places.sqlite";      dst = "${tag}_history"   },  # historial + descargas
                @{ src = "cookies.sqlite";     dst = "${tag}_cookies"   },  # cookies
                @{ src = "formhistory.sqlite"; dst = "${tag}_formhistory" } # búsquedas y formularios
            )

            foreach ($item in $filesToCopy) {
                $src = "$profilePath\$($item.src)"
                if (Test-Path $src) {
                    try { 
                        Copy-Item $src "$dest\$($item.dst)" -ErrorAction Stop
                        Write-Host "    -> $($item.src) OK" -ForegroundColor Green
                    } catch {
                        Write-Host "    -> $($item.src) SKIP (en uso)" -ForegroundColor DarkYellow
                    }
                }
            }
        }
    }
}

# ----------------------------------------------------------
# COMPRIMIR
# ----------------------------------------------------------
Write-Host "`n[*] Comprimiendo..." -ForegroundColor Cyan
$zipPath = "C:\Temp\browser_forensics_$timestamp.zip"

try {
    Compress-Archive -Path "$dest\*" -DestinationPath $zipPath -Force
    $size = [math]::Round((Get-Item $zipPath).Length / 1MB, 2)
    Write-Host "[+] ZIP generado: $zipPath ($size MB)" -ForegroundColor Green
} catch {
    Write-Host "[-] Error al comprimir: $_" -ForegroundColor Red
}

# Limpiar carpeta temporal
Remove-Item $dest -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n[*] Archivos recolectados:" -ForegroundColor Cyan
Write-Host "    Historial   -> *_history    (Chrome/Edge: History.db | Firefox: places.sqlite)" -ForegroundColor Gray
Write-Host "    Cookies     -> *_cookies    (Chrome/Edge: Cookies.db | Firefox: cookies.sqlite)" -ForegroundColor Gray
Write-Host "    Búsquedas   -> *_webdata    (Chrome/Edge: Web Data  | Firefox: formhistory.sqlite)" -ForegroundColor Gray
Write-Host "    Descargas   -> incluidas en *_history (tabla downloads) y places.sqlite" -ForegroundColor Gray
Write-Host "`n[DONE] Fin: $(Get-Date)`n" -ForegroundColor Cyan