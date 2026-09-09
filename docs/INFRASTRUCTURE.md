# Infraestructura Dragons

## Convenciones

- Prefijo de contenedores: `dragons-services-*` para servicios base y `dragons-rag-*` para RAG.
- Red Docker: `dragons-services-docker-network`.
- Puertos publicados: rango `50000+`.
- Variables sensibles: usar `.env` local a partir de cada `.env.example`; los `.env` no se versionan.

## Orden de arranque

1. `docker/network`: crea la red compartida.
2. `docker/postgres` y `docker/mongo`: bases transversales del proyecto.
3. `docker/metabase`: analitica sobre PostgreSQL.
4. `docker/rag`: LLM, UIs RAG y Milvus cluster local.
5. `docker/airflow`: orquestacion.
6. `docker/caddy`: gateway local.

## Servicios internos relevantes

- MongoDB interno: `dragons-mongo:27017`.
- PostgreSQL interno: `dragons-postgres:5432`.
- Milvus interno: `dragons-rag-milvus-proxy:19530`.
- Ollama interno: `dragons-rag-ollama:11434`.

## Caddy local

El proxy usa hostnames locales para evitar romper las UIs con subrutas. Configura `hosts` como se indica en el `README.md` y entra con `http://<servicio>.dragons.local:50080`.
