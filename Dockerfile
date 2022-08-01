ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

#Copy jwt secret
COPY jwtsecret.hex /jwtsecret

ENTRYPOINT [ "sh", "-c", "exec ./Nethermind.Runner \ 
    --config goerli \
    --JsonRpc.Enabled=true \
    --JsonRpc.JwtSecretFile=/jwtsecret \
    --Init.BaseDbPath=/data \
    --Init.LogDirectory=/data/logs \
    $EXTRA_OPTS" ]
