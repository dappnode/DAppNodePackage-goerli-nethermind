#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER" in
"prysm-prater.dnp.dappnode.eth")
  echo "Using prysm-prater.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse-prater.dnp.dappnode.eth")
  echo "Using lighthouse-prater.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"teku-prater.dnp.dappnode.eth")
  echo "Using teku-prater.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus-prater.dnp.dappnode.eth")
  echo "Using nimbus-prater.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
"lodestar-prater.dnp.dappnode.eth")
  echo "Using lodestar-prater.dnp.eth"
  JWT_PATH="/security/lodestar/jwtsecret.hex"
  ;;
*)
  echo "Using default"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

# Print the jwt to the dappmanager
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

exec /nethermind/nethermind --config goerli \
  --JsonRpc.Enabled=true \
  --JsonRpc.JwtSecretFile=${JWT_PATH} \
  --Init.WebSocketsEnabled true \
  --JsonRpc.WebSocketsPort 8546 \
  --HealthChecks.Enabled true \
  --Init.BaseDbPath=/data \
  --Init.LogDirectory=/data/logs \
  $EXTRA_OPTS
