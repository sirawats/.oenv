#!/bin/bash

# convert docker-compose.jpeg -fuzz 20%% -transparent White out.png
convert $1 -fuzz 20%% -transparent White $2
