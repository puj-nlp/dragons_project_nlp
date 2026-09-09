# Dragons Project NLP

Infraestructura base para orquestacion, persistencia, analitica y RAG del proyecto Dragons.

## Servicios

- Red compartida: `dragons-services-docker-network`
- Airflow: orquestacion de pipelines
- MongoDB + mongo-express: almacenamiento documental y UI
- PostgreSQL + pgAdmin: datos relacionales y administracion
- Metabase: tableros y exploracion
- RAG: AnythingLLM, Ollama, Open WebUI y Milvus en modo cluster
- Caddy: proxy local para exponer las UIs bajo un unico puerto

Nota: el stack RAG deja Milvus en modo cluster local con etcd, MinIO y Pulsar. Para produccion, Milvus recomienda operar cluster con Helm/Kubernetes; este compose es una base local para desarrollo.

## Puertos

Todos los puertos publicados usan el rango `50000+` para evitar cruces con otros proyectos.

| Servicio | URL local |
| --- | --- |
| Caddy | http://localhost:50080 |
| Airflow | http://localhost:50010 o http://airflow.dragons.local:50080 |
| Flower | http://localhost:50011 o http://flower.dragons.local:50080 |
| PostgreSQL | localhost:50020 |
| pgAdmin | http://localhost:50021 o http://pgadmin.dragons.local:50080 |
| MongoDB | localhost:50030 |
| mongo-express | http://localhost:50031 o http://mongo.dragons.local:50080 |
| Metabase | http://localhost:50040 o http://metabase.dragons.local:50080 |
| AnythingLLM | http://localhost:50050 o http://rag.dragons.local:50080 |
| Ollama | http://localhost:50051 |
| Open WebUI | http://localhost:50052 o http://webui.dragons.local:50080 |
| MinIO consola | http://localhost:50053 o http://minio.dragons.local:50080 |
| MinIO API | http://localhost:50054 |
| Milvus proxy | localhost:50055 |
| Attu | http://localhost:50057 o http://attu.dragons.local:50080 |

Para usar las rutas de Caddy con dominios locales, agrega estas entradas al archivo `hosts` de tu maquina:

```text
127.0.0.1 dragons.local
127.0.0.1 airflow.dragons.local
127.0.0.1 flower.dragons.local
127.0.0.1 pgadmin.dragons.local
127.0.0.1 mongo.dragons.local
127.0.0.1 metabase.dragons.local
127.0.0.1 rag.dragons.local
127.0.0.1 webui.dragons.local
127.0.0.1 attu.dragons.local
127.0.0.1 minio.dragons.local
```

## Inicio rapido

Crear primero la red compartida:

```bash
cd docker/network
docker compose up -d
```

Levantar servicios por bloque:

```bash
cd docker/postgres && docker compose up -d
cd ../mongo && docker compose up -d
cd ../metabase && docker compose up -d
cd ../rag && docker compose up -d
cd ../airflow && docker compose up -d
cd ../caddy && docker compose up -d
```

Tambien puedes usar:

```bash
cd docker
./run_all_services.sh
```

En Windows con PowerShell:

```powershell
cd docker
.\run_all_services.ps1
```

## Carpetas de trabajo

```text
data/
  raw/          datos originales
  interim/      datos intermedios
  processed/    datos listos para consumo
  external/     fuentes externas
docker/         infraestructura local
notebooks/      exploracion
prompts/        prompts y plantillas
scripts/        utilidades operativas
services/       codigo de APIs y workers
```
