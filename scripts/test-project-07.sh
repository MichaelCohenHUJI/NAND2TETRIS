
python ./projects/07/main.py ./projects/07/DirTest/03.asm

for i in ./projects/07/*/*/*.vm
do
  echo $i
  python ./projects/07/main.py $i
done


for i in ./projects/07/*/*/*.tst
do
  echo $i
  ./tools/VMEmulator.bat $i
done
