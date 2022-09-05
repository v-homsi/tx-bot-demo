#!/bin/sh
set -euxo pipefail

CONFIG=$1
if [ -z $CONFIG ]; then
    echo "No config file supplied"
    exit 1
fi
shift

DATA=$1
if [ -z $DATA ]; then
    echo "No data directory supplied"
    exit 1
fi
shift

geth --datadir $DATA init $CONFIG
pwdfile=./password
tmpfile=temp

cat > $pwdfile << EOF
password
EOF

# import miner key
miner_key=73d6ab30dad6ff4cfb94ac3502b1b4f6e40a8f50b99e898d8b43cac4607fb9ce
cat > $tmpfile << EOF
$miner_key
EOF
geth --datadir $DATA account import --password $pwdfile $tmpfile

# import community key
community_key=1bd3a09b41239595a06a2be8964dbbdcd21b723e94c83f35b0a9cbf856f4ce5d
cat > $tmpfile << EOF
$community_key
EOF
geth --datadir $DATA account import --password $pwdfile $tmpfile

rm $tmpfile