#!/bin/bash

# Check shard test data
docker exec -i mongodb_shard1_1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard1_2 mongosh --port 27021 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard1_3 mongosh --port 27022 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard2_1 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard2_2 mongosh --port 27023 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check shard test data
docker exec -i mongodb_shard2_3 mongosh --port 27024 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

# Check router test data
docker exec -i mongos_router mongosh --port 27020 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF
