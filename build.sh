#!/bin/sh
romname=timingtest

rm $romname.ws

nasm -f bin -o $romname.ws $romname.asm -l $romname.lst
