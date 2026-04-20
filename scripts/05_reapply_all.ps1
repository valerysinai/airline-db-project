# 05_reapply_all.ps1
# Aplica todos los changesets pendientes (update completo)
# Uso: .\05_reapply_all.ps1

docker exec -w /liquibase/changelog airline_liquibase liquibase `
  --url=jdbc:postgresql://postgres:5432/airline_db `
  --username=airline_user `
  --password=airline_pass `
  --changeLogFile=changelog-master.yaml `
  update

Write-Host "Todos los changesets pendientes aplicados correctamente."
