# 04_reapply_next.ps1
# Aplica el siguiente changeset pendiente (update-count 1)
# Uso: .\04_reapply_next.ps1

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  update-count 1

Write-Host "Siguiente changeset pendiente aplicado."
