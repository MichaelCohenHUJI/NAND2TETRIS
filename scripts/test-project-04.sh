#!/bin/bash

for i in ./projects/04/*.tst
do
  echo $i
  ./tools/CPUEmulator.bat $i
done
