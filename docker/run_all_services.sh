#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for service in network postgres mongo metabase rag airflow caddy; do
  echo "Starting ${service}"
  (cd "${ROOT_DIR}/${service}" && docker compose up -d)
done
