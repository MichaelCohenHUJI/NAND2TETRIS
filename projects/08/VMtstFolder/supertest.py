
from os import system
from filecmp import cmp

regs = [[0] + [ i for i in range(j , j+8) ] for j in range(256 , 290, 8)]

def create_cmp(reg):

    def space(j):
        if j < 10:
            return "| RAM[{0}] "
        if j < 100:
            return "|RAM[{0}] "
        else :
            return "|RAM[{0}]"

    _str = "".join([ space(i).format(i)  for i in reg ]) +"|"
    _str += "\n" + "|    492 " * len(reg) + "|"
    return _str

def create_tst(reg):
    _str = "load FibonacciElement.asm,\n" +\
    "output-file FibonacciElement.out,\n" +\
    "compare-to FibonacciElement.cmp,"  +\
    "\noutput-list " +\
    '  '.join([ 'RAM[{0}]%D1.6.1'.format(i) for i in  reg ]) +\
    ";\nrepeat 6000 {"  +\
      "\nticktock;" +\
    "\n}" +\
    "\noutput;"
    return _str


def comparefiles(_file1, _file2):
    for (line1, line2) in zip(\
     *[open( _file, 'r').readlines() for _file in [_file1, _file2]]):
        if "RAM" not in line1 and line1 != line2:
            print("diff-> {0} ,{1}".format(_file1 ,_file2) )
            return True
    return False

proj_path = "./projects/08/VMtstFolder/"
trans_path ="./projects/07/main.py"
out_file = proj_path + "FibonacciElement/FibonacciElement.out"
tst_file = proj_path + "FibonacciElement/FibonacciElement.tst"
cmp_file = proj_path + "FibonacciElement/FibonacciElement.cmp"

if __name__ == "__main__" :
    last = None
    res = [ ] #[ "./logs/log0",  "./logs/log1",  "./logs/log2",  "./logs/log3"]
    for j , reg in enumerate(regs):

        lines = open(proj_path + "Main.vm", 'r').readlines()
        open( tst_file , 'w' ).write(create_tst(reg))
        open( cmp_file, 'w' ).write( create_cmp(reg) )
        vm_file = proj_path + "FibonacciElement/main.vm"
        open(vm_file , 'w').write("")
        open("./logs/log{0}".format( j ) , 'w').write("")
        for i ,line in enumerate(lines):
            open(vm_file, 'a').write(line)
            system("python {0} {1}".format(trans_path , vm_file))
            system(".\\tools\\CPUEmulator.bat {0}".format(tst_file))
            open("./logs/log{0}".format(j) , 'a' ).write( "\n" + line +  "\n" )
            system("cat {0} >> ./logs/log{1}".format( out_file , j ))

        if last != None :
            if comparefiles( "./logs/log{0}".format( j ), last ):
                res.append( "./logs/log{0}".format( j ) )
                res.append( last )
        last = "./logs/log{0}".format( j )

    print(res)
    for i in range(1 , 250):
        if "./logs/log{0}".format(i) not in res:
            system("rm ./logs/log{0}".format(i))
