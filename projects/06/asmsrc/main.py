
import sys
from hackparser import parse
import code
import os

'''
    @outfilename
    returns the name of the output file.
'''
def outfilename( inputfile ):
    return inputfile.replace( ".asm" , ".hack")
'''
    @assamble_one_file
    translate a single asm file to hack file.
'''
def assamble_one_file( inputfile ):
    hackcode = parse(open( inputfile, 'r' ).readlines())
    outpath = outfilename(inputfile)
    with open( outpath , "w" ) as output :
        output.write( hackcode )
        output.close()

if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputpath = sys.argv[1]
        if os.path.isdir(inputpath):
            for _file in os.listdir(inputpath):
                if _file.endswith(".asm"):
                    assamble_one_file( inputpath + "/" + _file )
        elif os.path.isfile(inputpath):
            assamble_one_file( inputpath )
