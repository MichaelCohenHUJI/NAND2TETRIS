import sys
from vmparser import parse, call, compile_line
# import code
import os

#bootstrap_code =  'call Sys.init 0' # '@256\n'+'D=A\n' +'@SP\n'+'M=D\n'+call(['Sys.init'])+'\n'

def asmcode():
    return "asm code"

'''
    @outfilename
    returns the name of the output file.
'''
def outfilename( inputfile ):
    return inputfile.replace( ".vm" , ".asm")
'''
    @assamble_one_file
    translate a single asm file to hack file.
'''
def translate_one_file( inputfile, ex7 = True ):
    hackcode = parse(inputfile) # parse(open( inputfile, 'r' ).readlines())
    if not ex7 :
        hackcode = bootstrap_code + hackcode

    outpath = outfilename(inputfile, "file")
    with open( outpath , "w" ) as output :
        output.write( hackcode )
        output.close()

def translate_dir( dirpath, outpath ):

    blacklist = [
        #"./projects/08/FunctionCalls/NestedCall/NestedCall.asm",
        "./projects/08/FunctionCalls/SimpleFunction/SimpleFunction.asm",
        "./projects/08/ProgramFlow/BasicLoop/BasicLoop.asm",
        "./projects/08/ProgramFlow/FibonacciSeries/FibonacciSeries.asm"
     ]

    bootstrap_code =  False if outpath in blacklist else True
    hackcode = ""
    with open( outpath , "w" ) as output :
        for _file in os.listdir(dirpath):
            if _file.endswith(".vm"):
                hackcode += parse( dirpath + "/" +  _file , _file)

        if bootstrap_code :
            hackcode = \
                '\n@256'    +\
                '\nD=A'     +\
                '\n@SP'     +\
                '\nM=D'     +\
                "\n"        +\
                compile_line('call Sys.init 0') +\
                "\n"        + hackcode

        output.write( hackcode )
        output.close()



if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputpath = sys.argv[1]
        if os.path.isdir(inputpath):
            dirname = inputpath.rsplit(sep='/', maxsplit=1)[-1]
            outpath = inputpath + "/" + dirname + ".asm"
            translate_dir(inputpath , outpath)
        elif os.path.isfile( inputpath ):
            translate_one_file( inputpath )
