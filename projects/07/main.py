import sys
from vmparser import parse, call
# import code
import os

bootstrap_code ='@256\n'+'D=A\n' +'@SP\n'+'M=D\n'+call(['Sys.init'])+'\n'

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

    outpath = outfilename(inputfile)
    with open( outpath , "w" ) as output :
        output.write( hackcode )
        output.close()

def translate_dir( dirpath, outpath ):
    hackcode = bootstrap_code
    with open( outpath , "w" ) as output :
        for _file in os.listdir(dirpath):
            if _file.endswith(".vm"):
                hackcode += parse( dirpath + "/" +  _file)
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
