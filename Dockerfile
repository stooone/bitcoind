# Requirements:
#   docker run --name=bitcoind-data -v /home/bitcoin/.bitcoin busybox chown 103:106 /home/bitcoin/.bitcoin
#
# Build:
#   docker build -t bitcoind .
#
# Run:
#   docker run -e "rpcpassword=vlamititkos" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 bitcoind

FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/bitcoinclassic/bitcoinclassic/releases/download/v0.11.2.cl1/bitcoin-0.11.2-linux64.tar.gz
RUN tar -xzf bitcoin-0.11.2-linux64.tar.gz

RUN groupadd -g 106 bitcoin && useradd -s /bin/false -u 103 -g 106 -d /home/bitcoin bitcoin
USER bitcoin

EXPOSE 8332 8333

WORKDIR /home/bitcoin
ENV HOME /home/bitcoin

CMD echo > /home/bitcoin/.bitcoin/debug.log && \
    echo "rpcallowip=$(ip r|grep '/'|cut -d' ' -f1)\nrpcuser=bitcoinrpc\nrpcpassword=${rpcpassword}\ndaemon=1\ntxindex=1\n" > /home/bitcoin/.bitcoin/bitcoin.conf && \
    /bitcoin-0.11.2/bin/bitcoind && \
    tail -f /home/bitcoin/.bitcoin/debug.log
