# 03_rollback_by_id_cascade.ps1
# Revierte los últimos N changesets aplicados
# Uso: .\03_rollback_by_id_cascade.ps1 -count 3

param(
    [Parameter(Mandatory=$true)]
    [int]$count
)

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  rollback --count=$count

Write-Host "Rollback de los últimos $count changeset(s) ejecutado."
