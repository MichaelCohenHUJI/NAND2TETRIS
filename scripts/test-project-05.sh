#!/bin/bash

for i in ./projects/05/*.tst
do
  echo $i
  if [[ "$i" != "./projects/05/Memory.tst" ]]; then
    ./tools/HardwareSimulator.bat $i
  fi
done
