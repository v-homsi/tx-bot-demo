FROM ethereum/client-go:v1.10.23

WORKDIR /app

COPY genesis.json .
COPY configure-geth.sh .
COPY entrypoint.sh .

RUN ./configure-geth.sh ./genesis.json /data

ENTRYPOINT [ "./entrypoint.sh" ]