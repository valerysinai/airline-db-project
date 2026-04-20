# 01_rollback_by_id.ps1
# Revierte un changeset específico por su ID
# Uso: .\01_rollback_by_id.ps1 -id "ddl-01-create-extensions"

param(
    [Parameter(Mandatory=$true)]
    [string]$id
)

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  rollback-to-date --date="1970-01-01"

Write-Host "Rollback del changeset '$id' ejecutado."
