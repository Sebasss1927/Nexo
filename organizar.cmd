@echo off
setlocal enabledelayedexpansion

echo ========================================
echo 📁 ORGANIZADOR AUTOMATICO DE IMAGENES
echo ========================================

REM Crear carpeta principal
if not exist imagenes (
    mkdir imagenes
)

REM Procesar todos los archivos de imagen
for %%F in (*.jpg *.jpeg *.png *.webp) do (
    set "nombre=%%~nF"
    set "ext=%%~xF"

    REM Extraer numeros del nombre
    for /f "tokens=1 delims=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ()-_" %%A in ("!nombre!") do (
        set "num=%%A"
    )

    REM Si no hay número, usar el nombre completo
    if "!num!"=="" set "num=!nombre!"

    REM Crear subcarpeta
    if not exist imagenes\!num! (
        mkdir imagenes\!num!
    )

    REM Mover archivo a su subcarpeta
    echo Moviendo %%F a imagenes\!num!\ ...
    move "%%F" "imagenes\!num!\"
)

echo.
echo ========================================
echo ✔ PROCESO TERMINADO
echo Ahora puedes subirlo a GitHub
echo ========================================
pause
