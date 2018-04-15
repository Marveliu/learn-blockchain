#!/bin/bash

geth=${GETH:-geth}

$geth -unlock 0 --password password --datadir data --networkid 31415926 --rpc --rpccorsdomain "*" --nodiscover console 
