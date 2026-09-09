db = db.getSiblingDB("dragons");
db.createCollection("documents");
db.createCollection("chunks");
db.createCollection("pipeline_runs");
