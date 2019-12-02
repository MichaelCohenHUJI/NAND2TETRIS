#!/bin/sh
cd ./projects/07/
tar -cvf project07.tar ./VMtranslator ./Makefile  ./main.py ./vmparser.py ./README
mv ./project07.tar ../../tars/
cd ../../
