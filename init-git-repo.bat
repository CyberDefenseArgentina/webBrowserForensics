@echo off
REM Script para inicializar el repositorio de Git en Windows
REM Uso: init-git-repo.bat

echo.
echo === Inicializando repositorio Browser Forensics Toolkit ===
echo.

REM Verificar que estamos en el directorio correcto
if not exist "README.md" (
    echo [ERROR] Ejecutar este script desde la raiz del proyecto
    echo         Debe estar en la carpeta donde esta README.md
    pause
    exit /b 1
)

REM Inicializar Git
git init
if errorlevel 1 (
    echo [ERROR] Git no esta instalado o no esta en PATH
    echo         Instalar desde: https://git-scm.com/download/win
    pause
    exit /b 1
)
echo [OK] Git inicializado

REM Agregar todos los archivos
git add .
echo [OK] Archivos agregados al staging

REM Commit inicial
git commit -m "Initial commit: Browser Forensics Toolkit v1.0.0" -m "- Collector script para Chrome, Edge, Firefox" -m "- HTML viewer con dark mode" -m "- 7 iconos SVG profesionales" -m "- Documentacion completa" -m "- Licencia MIT"
echo [OK] Commit inicial creado

REM Instrucciones para GitHub
echo.
echo === Proximos pasos ===
echo.
echo 1. Crear repositorio en GitHub:
echo    https://github.com/new
echo.
echo 2. Conectar con tu repo remoto:
echo    git remote add origin https://github.com/TU-USUARIO/browser-forensics.git
echo.
echo 3. Subir el codigo:
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. (Opcional) Agregar topics en GitHub:
echo    - forensics
echo    - cybersecurity
echo    - browser-forensics
echo    - digital-forensics
echo    - incident-response
echo    - powershell
echo    - security-tools
echo.
echo [OK] Tu repositorio esta preparado!
echo.
pause
