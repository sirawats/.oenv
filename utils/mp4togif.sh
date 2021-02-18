#!/bin/bash

ffmpeg -ss $1 -t $2 -i $3.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $4.gif
