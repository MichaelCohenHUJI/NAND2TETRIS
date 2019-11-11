#!/bin/bash

for i in ./projects/05/*.tst
do
  echo $i
  ./tools/HardwareSimulator.bat $i
done
