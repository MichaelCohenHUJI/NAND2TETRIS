#!/bin/bash

for i in ./projects/03/a/*.tst
do
  echo $i
  ./tools/HardwareSimulator.bat $i
done
