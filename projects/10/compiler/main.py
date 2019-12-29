
import sys
import inc.Node as Node
import inc.Streamer as Streamer
import os

def outfilename( inputfile ):
    return inputfile.replace( ".jack" , ".xml")

def compile_one_file(inputfile):
    xmlcode =  Node.generateRoot(Streamer.Streamer(inputfile)).generate() #parser.parse(open( inputfile, 'r' ).readlines())
    outpath = outfilename(inputfile)
    with open( outpath , "w" ) as output :
        output.write( xmlcode )
        output.close()

if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputpath = sys.argv[1]
        _files = [ ]
        if os.path.isdir(inputpath):
            _files = [ inputpath + "/" + _file for _file in\
             os.listdir(inputpath) if _file.endswith(".jack")]
        else:
            _files = [ inputpath ]
        for _file in _files:
            compile_one_file(_file)
