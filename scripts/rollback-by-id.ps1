# rollback-by-id.ps1
# Versión simplificada: revierte hasta un tag o changeset específico
# Uso: .\rollback-by-id.ps1 -tag "v1.0"

param(
    [Parameter(Mandatory=$true)]
    [string]$tag
)

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  rollback --tag=$tag

Write-Host "Rollback hasta el tag '$tag' ejecutado."
