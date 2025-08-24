import subprocess
import webbrowser
import sys

def setup_github():
    print("🚀 CONFIGURADOR AUTOMÁTICO DE GITHUB")
    print("=" * 50)
    print()
    
    # Obtener datos
    username = input("👤 Tu username de GitHub: ").strip()
    email = input("📧 Tu email de GitHub: ").strip()
    
    # Abrir página de token
    print("\n🔑 Creando token de acceso...")
    print("1. Se abrirá la página de GitHub")
    print("2. Clic en \"Generate new token (classic)\"")
    print("3. Selecciona: repo, workflow, write:packages")
    print("4. Copia el token generado")
    
    webbrowser.open("https://github.com/settings/tokens")
    input("\n⏸️ Presiona Enter cuando tengas el token...")
    
    token = input("🔐 Pega tu token aquí: ").strip()
    
    # Configurar Git
    print("\n⚙️ Configurando Git...")
    try:
        subprocess.run(["git", "config", "--global", "user.name", username], check=True)
        subprocess.run(["git", "config", "--global", "user.email", email], check=True)
        print("✅ Git configurado")
    except:
        print("⚠️ Error en Git (continuando...)")
    
    # Crear repositorio manualmente
    print("\n📦 Ahora crea el repositorio:")
    print("1. Ve a https://github.com/new")
    print("2. Nombre del repositorio: reelssystem")
    print("3. Descripción: Sistema automatizado de reels - Revenue $135K/mes")
    print("4. Público ✓")
    print("5. Add README file ✓")
    print("6. Clic en Create repository")
    
    webbrowser.open("https://github.com/new")
    input("\n⏸️ Presiona Enter cuando hayas creado el repositorio...")
    
    # Subir archivos
    print("\n⬆️ Subiendo archivos...")
    try:
        subprocess.run(["git", "init"], check=True)
        subprocess.run(["git", "remote", "add", "origin", f"https://{token}@github.com/{username}/reelssystem.git"], check=True)
        subprocess.run(["git", "add", "."], check=True)
        subprocess.run(["git", "commit", "-m", "🚀 REELS SYSTEM - Enterprise Platform"], check=True)
        subprocess.run(["git", "branch", "-M", "main"], check=True)
        subprocess.run(["git", "pull", "origin", "main", "--allow-unrelated-histories"], check=True)
        subprocess.run(["git", "push", "-u", "origin", "main"], check=True)
        
        print("✅ Archivos subidos exitosamente!")
        
    except Exception as e:
        print(f"⚠️ Error: {e}")
        print("Intenta subir manualmente o repite el proceso")
    
    # Configurar GitHub Pages
    print("\n🌐 Configurando GitHub Pages...")
    print("1. Ve a tu repositorio")
    print("2. Settings > Pages")
    print("3. Source: Deploy from a branch")
    print("4. Branch: main / (root)")
    print("5. Save")
    
    webbrowser.open(f"https://github.com/{username}/reelssystem/settings/pages")
    input("\n⏸️ Presiona Enter cuando hayas configurado Pages...")
    
    # Resultado final
    print("\n🎉 ¡CONFIGURACIÓN COMPLETADA!")
    print("=" * 50)
    print(f"📦 Repositorio: https://github.com/{username}/reelssystem")
    print(f"🌐 Sitio web: https://{username}.github.io/reelssystem/")
    print()
    print("🎯 URLS PARA TIKTOK API:")
    print(f"📄 Terms: https://{username}.github.io/reelssystem/terms.html")
    print(f"🔒 Privacy: https://{username}.github.io/reelssystem/privacy.html")
    print(f"🌐 Website: https://{username}.github.io/reelssystem/")
    print()
    print("⏱️ El sitio estará disponible en 5-10 minutos")
    print("🎯 Usa estas URLs en el formulario de TikTok API")
    
    # Abrir repositorio
    webbrowser.open(f"https://github.com/{username}/reelssystem")

if __name__ == "__main__":
    setup_github()
