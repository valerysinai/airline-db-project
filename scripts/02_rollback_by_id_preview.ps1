# 02_rollback_by_id_preview.ps1
# Previsualiza qué SQL se ejecutaría al hacer rollback de un changeset
# Uso: .\02_rollback_by_id_preview.ps1 -count 1

param(
    [Parameter(Mandatory=$true)]
    [int]$count
)

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  rollback-sql --count=$count

Write-Host "Preview de rollback de los últimos $count changeset(s) mostrado."
