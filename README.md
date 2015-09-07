# bitcoind

This is a Bitcoin XT full node.

Before running you must make a separate container for the blockchain with:

```
docker run --name=bitcoind-data -v /home/bitcoin/.bitcoin busybox chown 1000:1000 /home/bitcoin/.bitcoin
```

then you can run it with:

```
docker run -e "rpcpassword=secretpassword" --name=bitcoind --volumes-from bitcoind-data -d -p 8332:8332 -p 8333:8333 bitcoind
```

and then it can started with the supplied ```bitcoinxt.service```.
