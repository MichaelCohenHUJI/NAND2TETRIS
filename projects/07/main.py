
import sys
# from hackparser import parse
# import code
import os

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
    hackcode = "vm code" # parse(open( inputfile, 'r' ).readlines())
    outpath = outfilename(inputfile)
    with open( outpath , "w" ) as output :
        output.write( hackcode )
        output.close()

def translate_dir( dirpath ):
    for _file in os.listdir(dirpath):
        if _file.endswith(".vm"):
            translate_one_file( dirpath + "/" + _file )


if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputpath = sys.argv[1]
        if os.path.isdir(inputpath):
            translate_dir(inputpath)
        elif inputpath.endswith("asm") :
            inputpath = inputpath.rsplit(sep='/', maxsplit=1)
            translate_dir(inputpath)
        elif os.path.isfile( inputpath ):
            translate_one_file( inputpath )
