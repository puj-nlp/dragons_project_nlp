$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$services = @("network", "postgres", "mongo", "metabase", "rag", "airflow", "caddy")

foreach ($service in $services) {
    Write-Host "Starting $service"
    Push-Location (Join-Path $root $service)
    docker compose up -d
    Pop-Location
}
