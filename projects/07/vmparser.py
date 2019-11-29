




'''
    stack
        - push
        - pop

'''

'''
    arithmetic
        - add
        - sub

'''

'''
    logic
        - eq
        - lt
        - gt
        - neg
        - and
        - or
'''


def push( args ):
    ret =   "@{0}\n" +\
            "D=A\n" +\
            "@SP\n" +\
            "A=D\n" +\
            "M=D\n" +\
            "@SP\n" +\
            "M=M+1".format(args[1])
    return ret 

def pop ( args ):
    pass

def add ( args ):
    pass



'''
    @fooNan - for tests.
'''
def fooNan ( args ):
    return "".join( args )



operator = {
    "push" : fooNan ,
    "pop" : fooNan ,
    "add" : fooNan ,
    "sub" : fooNan ,
    "eq" : fooNan ,
    "lt" : fooNan ,
    "gt" : fooNan ,
    "neg" : fooNan ,
    "and" : fooNan ,
    "or" : fooNan,
    "not" :fooNan
}



"""
    @compile_line -
    returns compile single line from vm to asm
"""
def compile_line( line ):
    # the first arg in list is the operator, while tokens[1:] will contain
    # the args
    tokens = line.split(maxsplit=1 )
    return operator[ tokens[0] ] ( tokens[1:] ) \
     if len(tokens) > 0 else ""

"""
    @compile_lines -
    applay compile_line for each line
"""
def compile_lines( lines ):
    ret = []
    for line in lines :
        ret.append( compile_line(line) )
    return ret

"""
    @handle_spaces_and_commments -
    returns the vm code excluding the comments and the spaces
"""
def handle_spaces_and_commments(lines):
    # check if the line is a comment
    def iscomment(line):
        return len(line) > 1 and line[0] == "/" and line[1] == "/"
    # excludes the comment part of the line
    def stripcomment(line):
        return line[0:line.index("//")] if "//" in line else line
    # define the list which will evently contain the
    # lines after preprocessing.
    retlines = []
    # iterate over the lines.
    for line in lines:
        if not iscomment(line):
            # get rid off spaces.
            templine = line #.replace(" ", "").strip()
            if len(templine) > 0 :
                # stripping the line from comments.
                retlines.append( stripcomment(templine).strip() )
    return retlines

"""
    @parse -
    returns the asm code excluding the comments and the spaces
"""
def parse(vmfile):
    asmcode = handle_spaces_and_commments(open(vmfile,'r').readlines())
    asmcode = compile_lines(asmcode)
    return "\n".join(asmcode)
