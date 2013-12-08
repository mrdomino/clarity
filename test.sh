#!/bin/sh
ADDR=1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i
SONG=$HOME/reaper.flac
python embed.py "$SONG" $ADDR > out.wav
EX=$(python extract.py out.wav)
if [ x$ADDR != x$EX ]
then
	echo "extract: expected $ADDR, got $EX" 1>&2
	exit 1
fi
python clear.py out.wav > clear.wav
exec cmp clear.wav "$SONG"
