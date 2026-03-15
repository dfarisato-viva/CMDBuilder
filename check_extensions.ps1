# Script per verificare e risolvere problemi SQL Server VS Code
Write-Host "=== Estensioni SQL Server installate ===" -ForegroundColor Green
$sqlExtensions = code --list-extensions | Where-Object { $_ -like "*mssql*" -or $_ -like "*sql*" }
$sqlExtensions | ForEach-Object { Write-Host "  - $_" -ForegroundColor Cyan }

Write-Host "`n=== IMPORTANTE ===" -ForegroundColor Red
Write-Host "Il comando 'mssql.addObjectExplorer' è OBSOLETO!" -ForegroundColor Red
Write-Host "Usa invece: 'MS SQL: Add Connection'" -ForegroundColor Yellow

Write-Host "`n=== Comandi corretti da usare ===" -ForegroundColor Green
Write-Host "1. Premi Ctrl+Shift+P" -ForegroundColor White
Write-Host "2. Digita: MS SQL: Add Connection" -ForegroundColor Cyan
Write-Host "3. Configura la connessione SQL Server" -ForegroundColor White
Write-Host "4. L'Object Explorer apparirà automaticamente" -ForegroundColor White

Write-Host "`n=== Altri comandi utili ===" -ForegroundColor Green
Write-Host "- MS SQL: Connect" -ForegroundColor Cyan
Write-Host "- MS SQL: New Query" -ForegroundColor Cyan
Write-Host "- MS SQL: Manage Connection Profiles" -ForegroundColor Cyan

Write-Host "`n=== Riavvio VS Code per sicurezza ===" -ForegroundColor Yellow
Write-Host "Chiudendo VS Code..."
Get-Process "Code" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 3

Write-Host "Riaprendo VS Code..."
Start-Process "code" -ArgumentList "."

Write-Host "`nVS Code riavviato. Usa ora: 'MS SQL: Add Connection'" -ForegroundColor Green