#!/bin/sh
romname=timingtest

nasm -f bin -o $romname.ws $romname.asm -l $romname.lst
