#!/bin/bash

# Init DB test data
docker exec -i mongos_router mongosh --port 27020 <<EOF
use somedb;
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i});
db.helloDoc.countDocuments()
EOF
