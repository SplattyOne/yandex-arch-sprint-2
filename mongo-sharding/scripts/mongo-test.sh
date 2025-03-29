#!/bin/bash

# Check shard test data
docker exec -i mongodb_shard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check router test data
docker exec -i mongos_router mongosh --port 27020 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF
