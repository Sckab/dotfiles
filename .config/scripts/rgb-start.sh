#!/bin/bash

sleep 10

echo "Avvio OpenRGB e applico profilo 'verde1'" >> /tmp/rgb-log.txt

openrgb --profile "verde1" --server --startminimized
