ARG UPSTREAM_VERSION
FROM nethermindeth/nethermind:1.25.4-8138ceb

COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

