#!/bin/bash




#  ./tools/JackCompiler.bat $i
for i in ./projects/11/*
do

./tools/JackCompiler.bat $i

#  ./tools/JackCompiler.bat $i
  if [ "$i" != "./projects/11/compiler" ]; then
    for j in $i/*.jack
    do
      python ./projects/11/compiler/main.py $j
    done
  #   #statements
  #   echo -e "\ncompiling project $i :"
  #   for j in $i/*.jack
  #   do
  #
  #     echo -e "\t${j%.*}_out.xml"
  #     python ./projects/10/compiler/main.py $j
  #     ./tools/TextComparer.bat "${j%.*}_out.xml"  "${j%.*}.xml"
  #   done
  fi
done
