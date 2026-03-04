#!/bin/bash
# Script para inicializar el repositorio de Git
# Uso: bash init-git-repo.sh

echo "🚀 Inicializando repositorio Browser Forensics Toolkit..."

# Verificar que estamos en el directorio correcto
if [ ! -f "README.md" ]; then
    echo "❌ Error: Ejecutar este script desde la raíz del proyecto (donde está README.md)"
    exit 1
fi

# Inicializar Git
git init
echo "✅ Git inicializado"

# Agregar todos los archivos
git add .
echo "✅ Archivos agregados al staging"

# Commit inicial
git commit -m "Initial commit: Browser Forensics Toolkit v1.0.0

- Collector script para Chrome, Edge, Firefox
- HTML viewer con dark mode
- 7 iconos SVG profesionales
- Documentación completa
- Licencia MIT"
echo "✅ Commit inicial creado"

# Instrucciones para GitHub
echo ""
echo "📋 Próximos pasos:"
echo ""
echo "1. Crear repositorio en GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Conectar con tu repo remoto:"
echo "   git remote add origin https://github.com/TU-USUARIO/browser-forensics.git"
echo ""
echo "3. Subir el código:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. (Opcional) Agregar topics en GitHub:"
echo "   - forensics"
echo "   - cybersecurity"
echo "   - browser-forensics"
echo "   - digital-forensics"
echo "   - incident-response"
echo "   - powershell"
echo "   - security-tools"
echo ""
echo "✨ ¡Listo! Tu repositorio está preparado."
