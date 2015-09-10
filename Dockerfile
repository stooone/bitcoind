# Requirements:
#   docker run --name=bitcoind-data -v /home/bitcoin/.bitcoin busybox chown 103:106 /home/bitcoin/.bitcoin
#
# Build:
#   docker build -t bitcoind .
#
# Run:
#   docker run -e "rpcpassword=vlamititkos" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 bitcoind

FROM ubuntu:14.04

COPY pub.key /
RUN apt-key add /pub.key
RUN echo 'deb [ arch=amd64 ] http://bitcoinxt.software.s3-website-us-west-2.amazonaws.com/apt wheezy main' > /etc/apt/sources.list.d/bitcoinxt.list
RUN apt-get update && apt-get -y install bitcoinxt

USER bitcoin

EXPOSE 8332 8333

WORKDIR /home/bitcoin

ENV HOME /home/bitcoin

CMD echo > /home/bitcoin/.bitcoin/debug.log && \
    echo "rpcallowip=$(ip r|grep '/'|cut -d' ' -f1)\nrpcuser=bitcoinrpc\nrpcpassword=${rpcpassword}\ndaemon=1\ntxindex=1\n" > /home/bitcoin/.bitcoin/bitcoin.conf && \
    /usr/bin/bitcoinxtd && \
    tail -f /home/bitcoin/.bitcoin/debug.log
