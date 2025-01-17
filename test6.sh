#!/bin/bash

EX=6
TAR_FILE=project$EX.tar

mkdir testTar
cp $TAR_FILE testTar/
cd testTar/

tar -xf $TAR_FILE

echo "Checking your submission for presence of invalid (non-ASCII) characters..."
if grep -Pns "[^\x00-\x7F]" *; then
  echo "ERROR! Your submission contains invalid characters in the above lines."
  echo "The presubmission test will automatically remove them,"
  echo "note that it might change your code and cause it to fail."
  echo "So, remove them before making your final submission, "
  echo "you can use dos2unix to do so; see instructions in the course guidelines."
else
  echo "No invalid characters found."
fi
echo ""


if [ ! -r Makefile ]; then
  echo Makefile was not found
  exit 1
fi

make >& /dev/null
if [ $? -ne 0 ]; then
  echo "Make failed"
  exit 1
fi

if [ ! -r Assembler ]; then
  echo Assembler was not found
fi

if [ -r README ]; then
  dos2unix README &> /dev/null
  logins=`head -1 README`
  echo Your logins are: $logins, is that ok?
else
  echo No README was found
fi

cd ../
rm -Rf testTar
