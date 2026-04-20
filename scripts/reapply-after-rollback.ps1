# reapply-after-rollback.ps1
# Hace rollback de los últimos N changesets y luego vuelve a aplicar todos
# Útil para re-ejecutar un changeset corregido
# Uso: .\reapply-after-rollback.ps1 -count 2

param(
    [Parameter(Mandatory=$true)]
    [int]$count
)

Write-Host "Haciendo rollback de los últimos $count changeset(s)..."
docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  rollback --count=$count

Write-Host "Re-aplicando todos los changesets pendientes..."
docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  update

Write-Host "Proceso completado."
