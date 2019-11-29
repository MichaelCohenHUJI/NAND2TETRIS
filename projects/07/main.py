
import sys
from vmparser import parse
# import code
import os



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
def translate_one_file( inputfile ):
    hackcode = parse(inputfile) # parse(open( inputfile, 'r' ).readlines())
    outpath = outfilename(inputfile)
    with open( outpath , "w" ) as output :
        output.write( hackcode )
        output.close()

def translate_dir( dirpath, outpath ):
    hackcode = ""
    with open( outpath , "w" ) as output :
        for _file in os.listdir(dirpath):
            if _file.endswith(".vm"):
                hackcode += parse( dirpath + "/" +  _file)
        output.write( hackcode )
        output.close()



if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputpath = sys.argv[1]
        if inputpath.endswith("asm") :
            dirpath = inputpath.rsplit(sep='/', maxsplit=1)[0]
            outpath = inputpath
            translate_dir(dirpath , outpath)
        elif os.path.isfile( inputpath ):
            translate_one_file( inputpath )
