# bitcoind

This is a Bitcoin XT full node.

Before running you must make a separate container for the blockchain with:

```
docker run --name=bitcoind-data -v /home/bitcoin/.bitcoin busybox chown 103:106 /home/bitcoin/.bitcoin
```

then you can run it with:

```
docker run -e "rpcpassword=secretpassword" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 dianmao/bitcoind
```

and then it can started with the supplied ```bitcoinxt.service```.

# Changelog

When upgrading from Bitcoin XT:0.11.0A to Bitcoin XT:0.11.0B upgrade you must change the wights in the bitcoind-data container with:

  $ chown -R 103:106 `docker inspect bitcoind-data|grep -A2 Volumes | grep /home/bitcoin/.bitcoin|grep _data|cut -d'"' -f4`
