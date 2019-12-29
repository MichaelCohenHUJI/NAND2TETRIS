
import sys
import inc.Node as Node
import inc.Streamer as Streamer
from inc.vm import dfs

def outfilename( inputfile ):
    return inputfile.replace( ".jack" , "_out.vm")


if __name__ == '__main__':
    if ( len(sys.argv) > 1 ):
        inputfile = sys.argv[1]
        node =  Node.generateRoot(Streamer.Streamer(inputfile))
        table = []
        dfs(node, table)
        xmlcode = "\n".join(table)
        outpath = outfilename(inputfile)
        with open( outpath , "w" ) as output :
            output.write( xmlcode )
            output.close()
