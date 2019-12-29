#!/bin/sh
cd ./projects/10/compiler
tar -cvf project10.tar ./JackAnalyzer ./Makefile ./README ./main.py ./inc
mv ./project10.tar ../../../tars/
cd ../../../
