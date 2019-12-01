
for i in ./projects/07/*/*/*.vm
do
  echo $i
  python tools/VMtranslator/VMtranslator.py $i
done
