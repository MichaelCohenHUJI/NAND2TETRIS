#!/bin/sh
cd ./projects/11/compiler
tar -cvf project11.tar ./JackCompiler ./Makefile ./README ./main.py ./inc
mv ./project11.tar ../../../tars/
cd ../../../
