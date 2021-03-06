# bitcoind

This is a Bitcoin Classic full node.

# Running

## Requirements
Before running you must make a separate container for the blockchain with:

```
docker run --name=bitcoind-data -v /home/bitcoin/.bitcoin busybox chown 103:106 /home/bitcoin/.bitcoin
```

## Run from Docker Hub
You can find this on Docker Hub at: https://hub.docker.com/r/dianmao/bitcoind/

```
docker run -e "rpcpassword=secretpassword" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 dianmao/bitcoind
```

## Run by hand
You can find the Dockerfile and other files at GitHub: https://github.com/stooone/bitcoind

```
docker run -e "rpcpassword=secretpassword" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 bitcoind
```

# Starting/stopping

The container can be stopped/started with ```docker stop bitcoind```, ```docker start bitcoind``` or with the supplied ```bitcoin.service``` if using systemd.

# Contact & Misc
**e-mail:** stone at midway dot hu
**Tip:** 1DVB1XfrwySQMQNThoPAJj4rZwMHXYTGp2
