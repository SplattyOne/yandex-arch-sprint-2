#!/bin/bash

# Init config server
docker exec -i mongo_configsrv mongosh --port 27017 --quiet <<EOF
rs.initiate({_id: "config_server", configsvr: true, members: [
{_id: 0, host: "mongo_configsrv:27017"}
]});
EOF
sleep 1

# Init shard 1
docker exec -i mongodb_shard1 mongosh --port 27018 --quiet <<EOF
rs.initiate({_id: "rs1", members: [
{_id: 0, host: "mongodb_shard1:27018"}
]});
EOF
sleep 1

# Init shard 2
docker exec -i mongodb_shard2 mongosh --port 27019 --quiet <<EOF
rs.initiate({_id: "rs2", members: [
{_id: 0, host: "mongodb_shard2:27019"}
]});
EOF
sleep 1

# Init router
docker exec -i mongos_router mongosh --port 27020 --quiet <<EOF
sh.addShard( "rs1/mongodb_shard1:27018");
sh.addShard( "rs2/mongodb_shard2:27019");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", {"name" : "hashed"});
EOF
