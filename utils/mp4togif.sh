#!/bin/bash

# ffmpeg \
#   -i opengl-rotating-triangle.mp4 \ # input video
#   -r 15 \ # sampling FPS
#   -vf scale=512:-1 \ # resolution scaling
#   , "setpts=PTS/0.5"
#   -ss 00:00:03 -to 00:00:06 \ # start time to end time
#   opengl-rotating-triangle.gif # output 

ffmpeg -i $1 -r 15 -vf scale=960:-1,"setpts=PTS/3" $2 
