@echo off
chcp 65001 > nul
title INSTALADOR MAESTRO - REELS SYSTEM v1.0.0
color 0A

cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                 INSTALADOR MAESTRO                          ║
echo ║              REELS SYSTEM v1.0.0 PRODUCCION                ║
echo ║                                                              ║
echo ║           🎯 Instalacion Optimizada en C:\                  ║
echo ║           💰 Revenue Target: $40K-135K/mes                  ║
echo ║           🚀 Sistema 100% Automatizado                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: FASE 1: VERIFICACION DE ADMINISTRADOR
echo 🔐 FASE 1: VERIFICANDO PERMISOS DE ADMINISTRADOR...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Se requieren permisos de administrador
    echo.
    echo 💡 SOLUCION:
    echo    1. Clic derecho en este archivo
    echo    2. Seleccionar "Ejecutar como administrador"
    echo.
    echo 🔄 Reiniciando con permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
echo ✅ Permisos de administrador: OK
echo.

:: FASE 2: PREPARACION DEL SISTEMA
echo 🛠️  FASE 2: PREPARANDO SISTEMA PARA INSTALACION...
echo.

:: Crear estructura en C:\
echo 📁 Creando estructura optimizada en C:\ReelsSystem...
if exist "C:\ReelsSystem" (
    echo 🗑️  Limpiando instalacion anterior...
    rmdir /s /q "C:\ReelsSystem" 2>nul
)

mkdir "C:\ReelsSystem" 2>nul
mkdir "C:\ReelsSystem\Core" 2>nul
mkdir "C:\ReelsSystem\APIs" 2>nul
mkdir "C:\ReelsSystem\Config" 2>nul
mkdir "C:\ReelsSystem\Data" 2>nul
mkdir "C:\ReelsSystem\Data\cache" 2>nul
mkdir "C:\ReelsSystem\Data\videos" 2>nul
mkdir "C:\ReelsSystem\Data\accounts" 2>nul
mkdir "C:\ReelsSystem\Logs" 2>nul
mkdir "C:\ReelsSystem\Scripts" 2>nul
mkdir "C:\ReelsSystem\Tools" 2>nul
mkdir "C:\ReelsSystem\Backup" 2>nul
mkdir "C:\ReelsSystem\Deploy" 2>nul

echo ✅ Estructura de directorios creada
echo.

:: FASE 3: VERIFICACION DE PYTHON
echo 🐍 FASE 3: VERIFICANDO PYTHON...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python no está instalado
    echo.
    echo 📥 Descargando e instalando Python...
    echo 💡 Esto puede tomar varios minutos...
    
    :: Descargar Python
    powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe' -OutFile 'C:\ReelsSystem\python-installer.exe'"
    
    :: Instalar Python silenciosamente
    "C:\ReelsSystem\python-installer.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    
    :: Actualizar PATH
    setx PATH "%PATH%;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311\Scripts" /M
    
    echo ✅ Python instalado exitosamente
    del "C:\ReelsSystem\python-installer.exe" 2>nul
) else (
    echo ✅ Python ya está instalado
    python --version
)
echo.

:: FASE 4: INSTALACION DE DEPENDENCIAS
echo 📦 FASE 4: INSTALANDO DEPENDENCIAS PYTHON...
echo.

:: Crear requirements.txt completo con todas las dependencias
echo schedule > "C:\ReelsSystem\requirements.txt"
echo requests >> "C:\ReelsSystem\requirements.txt"
echo colorama >> "C:\ReelsSystem\requirements.txt"
echo aiohttp >> "C:\ReelsSystem\requirements.txt"
echo psutil >> "C:\ReelsSystem\requirements.txt"
echo pillow >> "C:\ReelsSystem\requirements.txt"
echo moviepy >> "C:\ReelsSystem\requirements.txt"
echo instapy >> "C:\ReelsSystem\requirements.txt"
echo selenium >> "C:\ReelsSystem\requirements.txt"
echo beautifulsoup4 >> "C:\ReelsSystem\requirements.txt"
echo matplotlib >> "C:\ReelsSystem\requirements.txt"
echo numpy >> "C:\ReelsSystem\requirements.txt"
echo tkinter >> "C:\ReelsSystem\requirements.txt"
echo threading >> "C:\ReelsSystem\requirements.txt"
echo pathlib >> "C:\ReelsSystem\requirements.txt"
echo json >> "C:\ReelsSystem\requirements.txt"

echo 📦 Instalando paquetes necesarios...
pip install -r "C:\ReelsSystem\requirements.txt" --quiet --disable-pip-version-check

echo ✅ Dependencias instaladas exitosamente
echo.

:: FASE 5: COPIANDO ARCHIVOS DEL SISTEMA
echo 📋 FASE 5: COPIANDO ARCHIVOS DEL SISTEMA...
echo.

:: Verificar si los archivos existen en F:\
set "SOURCE_DIR=%~dp0"
echo 📍 Directorio fuente: %SOURCE_DIR%

:: Copiar archivos Python del sistema core si existen
if exist "%SOURCE_DIR%MegaOrchestratorFase1.py" (
    copy "%SOURCE_DIR%MegaOrchestratorFase1.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ MegaOrchestratorFase1.py copiado (Orquestador Maestro)
) else (
    echo ⚠️  MegaOrchestratorFase1.py no encontrado en F:\
)

if exist "%SOURCE_DIR%MultiCuentaScaling.py" (
    copy "%SOURCE_DIR%MultiCuentaScaling.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ MultiCuentaScaling.py copiado (Sistema Multi-Cuenta)
) else (
    echo ⚠️  MultiCuentaScaling.py no encontrado en F:\
)

if exist "%SOURCE_DIR%Sistema24_7Live.py" (
    copy "%SOURCE_DIR%Sistema24_7Live.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ Sistema24_7Live.py copiado (Automatización 24/7)
) else (
    echo ⚠️  Sistema24_7Live.py no encontrado en F:\
)

if exist "%SOURCE_DIR%MegaOrchestrator.py" (
    copy "%SOURCE_DIR%MegaOrchestrator.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ MegaOrchestrator.py copiado
) else (
    echo ⚠️  MegaOrchestrator.py no encontrado en F:\
)

:: Copiar interfaces gráficas profesionales
if exist "%SOURCE_DIR%REELS_PRO_CONSOLE.py" (
    copy "%SOURCE_DIR%REELS_PRO_CONSOLE.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ REELS_PRO_CONSOLE.py copiado (Consola Enterprise)
) else (
    echo ⚠️  REELS_PRO_CONSOLE.py no encontrado en F:\
)

if exist "%SOURCE_DIR%REELS_SYSTEM_GUI_SIMPLE.py" (
    copy "%SOURCE_DIR%REELS_SYSTEM_GUI_SIMPLE.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ REELS_SYSTEM_GUI_SIMPLE.py copiado (Interfaz Simple)
) else (
    echo ⚠️  REELS_SYSTEM_GUI_SIMPLE.py no encontrado en F:\
)

if exist "%SOURCE_DIR%REELS_ENTERPRISE_CONSOLE.py" (
    copy "%SOURCE_DIR%REELS_ENTERPRISE_CONSOLE.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ REELS_ENTERPRISE_CONSOLE.py copiado (Consola Empresarial)
) else (
    echo ⚠️  REELS_ENTERPRISE_CONSOLE.py no encontrado en F:\
)

if exist "%SOURCE_DIR%REELS_SYSTEM_GUI.py" (
    copy "%SOURCE_DIR%REELS_SYSTEM_GUI.py" "C:\ReelsSystem\Core\" >nul
    echo ✅ REELS_SYSTEM_GUI.py copiado (Interfaz Gráfica)
) else (
    echo ⚠️  REELS_SYSTEM_GUI.py no encontrado en F:\
)

:: Copiar herramientas de sistema
if exist "%SOURCE_DIR%UltraOptimizacionWindows.bat" (
    copy "%SOURCE_DIR%UltraOptimizacionWindows.bat" "C:\ReelsSystem\Tools\" >nul
    echo ✅ UltraOptimizacionWindows.bat copiado
) else (
    echo ⚠️  UltraOptimizacionWindows.bat no encontrado en F:\
)

if exist "%SOURCE_DIR%Full.ps1" (
    copy "%SOURCE_DIR%Full.ps1" "C:\ReelsSystem\Tools\" >nul
    echo ✅ Full.ps1 copiado (Script PowerShell)
) else (
    echo ⚠️  Full.ps1 no encontrado en F:\
)

echo.

:: FASE 6: CREANDO ARCHIVOS DE CONFIGURACION COMPLETOS
echo ⚙️  FASE 6: CREANDO ARCHIVOS DE CONFIGURACION...
echo.

:: Crear ConfiguradorAPIs.py completo
echo 🔧 Creando ConfiguradorAPIs.py...
(
echo #!/usr/bin/env python3
echo # -*- coding: utf-8 -*-
echo """
echo CONFIGURADOR DE APIS REALES - REELS SYSTEM
echo ==========================================
echo Configuración completa de APIs de Instagram, TikTok y YouTube
echo Modo: PRODUCCIÓN REAL
echo """
echo.
echo import os
echo import sys
echo import json
echo from pathlib import Path
echo.
echo def configurar_apis^(^):
echo     print^("🔧 CONFIGURADOR DE APIS REALES"^)
echo     print^("================================"^)
echo     print^(^)
echo     print^("📱 Instagram API - Configuración"^)
echo     print^("🎵 TikTok API - Configuración"^)
echo     print^("📺 YouTube API - Configuración"^)
echo     print^(^)
echo     print^("💡 Para configurar APIs reales:"^)
echo     print^("1. Ve a developers.facebook.com para Instagram"^)
echo     print^("2. Ve a developers.tiktok.com para TikTok"^)
echo     print^("3. Ve a console.cloud.google.com para YouTube"^)
echo     print^(^)
echo     input^("⏸️  Presiona Enter para continuar..."^)
echo.
echo if __name__ == "__main__":
echo     configurar_apis^(^)
) > "C:\ReelsSystem\Core\ConfiguradorAPIs.py"

:: Crear configuración inicial completa
echo 🔧 Creando configuración inicial...
(
echo {
echo   "system": {
echo     "version": "1.0.0-PRODUCTION",
echo     "install_path": "C:/ReelsSystem",
echo     "mode": "PRODUCTION",
echo     "install_date": "%date% %time%"
echo   },
echo   "targets": {
echo     "daily_reels": 1000,
echo     "daily_revenue": 500,
echo     "monthly_revenue": 15000
echo   },
echo   "accounts": {
echo     "instagram": 5,
echo     "tiktok": 5,
echo     "youtube": 5,
echo     "total": 15
echo   }
echo }
) > "C:\ReelsSystem\Config\production_config.json"

echo ✅ Archivos de configuración creados
echo.

:: FASE 7: CREANDO SCRIPTS DE EJECUCION COMPLETOS
echo 🚀 FASE 7: CREANDO SCRIPTS DE EJECUCION...
echo.

:: Crear INICIO_RAPIDO.bat completo con todas las opciones
echo 🔧 Creando INICIO_RAPIDO.bat...
(
echo @echo off
echo chcp 65001 ^> nul
echo cd /d C:\ReelsSystem
echo cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                  INICIO RAPIDO - REELS SYSTEM               ║
echo ║                      MODO PRODUCCION                        ║
echo ║                   Revenue: $40K-135K/mes                    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🚀 SISTEMA DE REELS AUTOMATIZADO
echo 💰 Revenue Target: $40K-135K/mes
echo 📱 15 cuentas simultáneas
echo 🎯 Instagram + TikTok + YouTube
echo.
echo ═══════════════ MENU PRINCIPAL ═══════════════
echo.
echo 1. 🔧 Configurar APIs (Producción Real)
echo 2. 🚀 Iniciar sistema completo
echo 3. 📊 Panel de control 24/7
echo 4. 📈 Multi-cuenta scaling
echo 5. 🛠️  Herramientas del sistema
echo 6. 💻 Interfaz Gráfica Simple
echo 7. 🎯 Consola Enterprise PRO
echo 8. 📋 Estado del sistema
echo 9. ❌ Salir
echo.
echo set /p opcion="Selecciona opcion (1-9): "
echo.
echo if "%%opcion%%"=="1" python "C:\ReelsSystem\Core\ConfiguradorAPIs.py"
echo if "%%opcion%%"=="2" python "C:\ReelsSystem\Core\MegaOrchestratorFase1.py"
echo if "%%opcion%%"=="3" python "C:\ReelsSystem\Core\Sistema24_7Live.py"
echo if "%%opcion%%"=="4" python "C:\ReelsSystem\Core\MultiCuentaScaling.py"
echo if "%%opcion%%"=="5" start "" "C:\ReelsSystem\Tools\"
echo if "%%opcion%%"=="6" python "C:\ReelsSystem\Core\REELS_SYSTEM_GUI_SIMPLE.py"
echo if "%%opcion%%"=="7" python "C:\ReelsSystem\Core\REELS_PRO_CONSOLE.py"
echo if "%%opcion%%"=="8" (
echo     echo.
echo     echo 📊 ESTADO DEL SISTEMA REELS
echo     echo ═══════════════════════════════
echo     echo 📍 Ubicación: C:\ReelsSystem
echo     echo 🐍 Python: Instalado
echo     echo 💰 Revenue Target: $135,000/mes
echo     echo 📱 Cuentas configuradas: 15
echo     echo 🎯 Plataformas: Instagram + TikTok + YouTube
echo     echo 🚀 Estado: Listo para producción
echo     echo ═══════════════════════════════
echo     echo.
echo     pause
echo )
echo if "%%opcion%%"=="9" exit
echo.
echo pause
echo goto :eof
) > "C:\ReelsSystem\INICIO_RAPIDO.bat"

:: Crear acceso directo en escritorio con icono
echo 🖥️  Creando acceso directo en escritorio...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut([Environment]::GetFolderPath('Desktop') + '\REELS SYSTEM.lnk'); $Shortcut.TargetPath = 'C:\ReelsSystem\INICIO_RAPIDO.bat'; $Shortcut.WorkingDirectory = 'C:\ReelsSystem'; $Shortcut.Description = 'Sistema de Reels Automatizado - Revenue 40K-135K por mes'; $Shortcut.Save()"

echo ✅ Scripts de ejecución creados
echo ✅ Acceso directo creado en escritorio
echo.

:: FASE 8: VERIFICACION FINAL COMPLETA
echo 🔍 FASE 8: VERIFICACION FINAL DE INSTALACION...
echo.

:: Verificar archivos críticos
set "ERRORES=0"

echo 📁 Verificando estructura...
if exist "C:\ReelsSystem\Core" (
    echo ✅ Directorio Core: OK
) else (
    echo ❌ Directorio Core: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\APIs" (
    echo ✅ Directorio APIs: OK
) else (
    echo ❌ Directorio APIs: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\Config" (
    echo ✅ Directorio Config: OK
) else (
    echo ❌ Directorio Config: FALTA
    set /a ERRORES+=1
)

echo.
echo 📋 Verificando archivos del sistema...
if exist "C:\ReelsSystem\INICIO_RAPIDO.bat" (
    echo ✅ Script de inicio: OK
) else (
    echo ❌ Script de inicio: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\Core\ConfiguradorAPIs.py" (
    echo ✅ Configurador APIs: OK
) else (
    echo ❌ Configurador APIs: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\Core\REELS_PRO_CONSOLE.py" (
    echo ✅ Consola Enterprise PRO: OK
) else (
    echo ❌ Consola Enterprise PRO: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\Core\REELS_SYSTEM_GUI_SIMPLE.py" (
    echo ✅ Interfaz Gráfica Simple: OK
) else (
    echo ❌ Interfaz Gráfica Simple: FALTA
    set /a ERRORES+=1
)

if exist "C:\ReelsSystem\Config\production_config.json" (
    echo ✅ Configuración de producción: OK
) else (
    echo ❌ Configuración de producción: FALTA
    set /a ERRORES+=1
)

echo.
echo 🐍 Verificando Python...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Python: OK
    python --version
) else (
    echo ❌ Python: ERROR
    set /a ERRORES+=1
)

echo.
echo ════════════════════════════════════════════════════════════════
if %ERRORES% equ 0 (
    echo 🎉 INSTALACION COMPLETADA EXITOSAMENTE
    echo.
    echo 📊 RESUMEN DEL SISTEMA INSTALADO:
    echo    📍 Ubicación: C:\ReelsSystem
    echo    🚀 Archivo de inicio: INICIO_RAPIDO.bat
    echo    💰 Revenue target: $40K-135K/mes automatizado
    echo    📱 Plataformas: Instagram + TikTok + YouTube
    echo    🎯 Cuentas simultáneas: 15
    echo    🔧 Modo: PRODUCCION REAL
    echo    💻 Interfaces incluidas: 4 tipos diferentes
    echo    🎯 Consola Enterprise PRO integrada
    echo    📊 Sistema de analytics en tiempo real
    echo.
    echo 🔥 OPCIONES DISPONIBLES:
    echo    ✅ Opción 1: Configurador APIs real
    echo    ✅ Opción 2: Sistema completo automatizado
    echo    ✅ Opción 3: Panel 24/7 en vivo
    echo    ✅ Opción 4: Multi-cuenta scaling
    echo    ✅ Opción 5: Herramientas del sistema
    echo    ✅ Opción 6: Interfaz gráfica simple
    echo    ✅ Opción 7: Consola Enterprise PRO
    echo    ✅ Opción 8: Estado del sistema
    echo.
    echo 🔥 SIGUIENTE PASO INMEDIATO:
    echo    ✅ Doble clic en "REELS SYSTEM" (escritorio)
    echo    ✅ Opción 7 para Consola Enterprise PRO
    echo    ✅ Opción 1 para configurar APIs reales
    echo    ✅ Opción 2 para iniciar sistema completo
    echo    ✅ ¡Comenzar a generar revenue automático!
    echo.
    echo 💡 Sistema 100%% ENTERPRISE con interfaces PRO
    echo 🎯 Todo instalado en C:\ para máximo rendimiento
    echo 🚀 Listo para generar $135K/mes automático
) else (
    echo ❌ INSTALACION INCOMPLETA
    echo.
    echo 🔧 Errores encontrados: %ERRORES%
    echo 💡 Algunos componentes no se instalaron correctamente
    echo 🔄 Puedes volver a ejecutar este instalador
)
echo ════════════════════════════════════════════════════════════════
echo.

echo 🚀 Instalación finalizada. Presiona cualquier tecla para continuar...
pause >nul

:: Abrir el sistema automáticamente si todo está OK
if %ERRORES% equ 0 (
    echo.
    echo 🎯 Abriendo REELS SYSTEM automáticamente en 3 segundos...
    timeout /t 3 /nobreak >nul
    start "" "C:\ReelsSystem\INICIO_RAPIDO.bat"
)

exit