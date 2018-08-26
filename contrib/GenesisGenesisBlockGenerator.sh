#!/bin/bash

# Generate with https://github.com/hashtobewild/GenesisZ

echo `date -u`
echo "Starting mainnet"
./genesis.py -s '/home/loki/Source/tromp/equihash/equi' -c mainnet -t 1534467330 -Z "SafeCashe317c686ae26fbaee438e3ae5a78f58409e22da083841c907be34c36977219ca" -p "0405cd1787ffcf6d5b59b0f70fff5cb0946b06eea488b812cb5062b8940cb729cfbaad51729064b14465e8c4ccddae18131f4440acefdefc82a708d22208182f4f" -S "tromp" -n 1361 -T 6 -v -b 0x1f07ffff -r 10000

echo `date -u`
echo "Starting testnet"
./genesis.py -s '/home/loki/Source/tromp/equihash/equi' -c testnet -t 1534467330 -Z "SafeCashe317c686ae26fbaee438e3ae5a78f58409e22da083841c907be34c36977219ca" -p "0405cd1787ffcf6d5b59b0f70fff5cb0946b06eea488b812cb5062b8940cb729cfbaad51729064b14465e8c4ccddae18131f4440acefdefc82a708d22208182f4f" -S "tromp" -n d -T 6 -v -b 0x2007ffff -E 0x1f07ffff -r 10000 

echo `date -u`
echo "Starting regtest"
./genesis.py -s '/home/loki/Source/tromp/equihash/eq485' -c regtest -t 1534467330 -Z "SafeCashe317c686ae26fbaee438e3ae5a78f58409e22da083841c907be34c36977219ca" -p "0405cd1787ffcf6d5b59b0f70fff5cb0946b06eea488b812cb5062b8940cb729cfbaad51729064b14465e8c4ccddae18131f4440acefdefc82a708d22208182f4f" -S "tromp" -n 3a -T 6 -v -b 0x200f0f0f -E 0x1f07ffff -r 10000 

echo "Done: "
echo `date -u`
