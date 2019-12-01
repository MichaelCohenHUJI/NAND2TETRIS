



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
reg_hists = {
    "local"     : '@LCL'    ,
    "argument"  : '@ARG'    ,
    "this"      : '@THIS'   ,
    "that"      : '@THAT'   ,
    'temp'      :'@5'
}

specials={'static':'@'+filename+'.', 'pointer0':'@THIS',
          'pointer1':'@THAT',    "constant" : '@'
}


def find_idx(stack,val=None):
    if stack in reg_hists:
        ret = reg_hists[stack] + '\n' +\
            'A=A+' + val
    else:
        if stack == 'pointer':
            ret = specials[stack+val]
        else:
            ret = specials[stack]+val
    return ret



def push( args ):
    stack ,val  = args[0].split()
    push_logic = "@SP\n" +\
            "A=M\n" +\
            "M=D\n" +\
            "@SP\n" +\
            "M=M+1"
    print(stack)
    idx = find_idx(stack,val)
    if stack != 'constant':
        ret = "D=M"
    else:
        ret = 'D=A'
    return "\n".join([idx, ret, push_logic] )

def pop( args ):
    stack ,val  = args[0].split()
    popper = '@SP\n' + \
        'M=M-1\n' + \
        'A=M\n' +\
        'D=M\n'
    idx = find_idx(stack,val)
    return "\n".join([ popper, idx, 'M=D'] )


def arithmetic( op ):
    ret =   "@SP\n" +\
            "A=M-1\n" +\
            "D=M\n" +\
            "@SP\n" +\
            "M=M-1\n" +\
            "A=M-1\n" +\
            "M=M{0}D".format(op)
    return ret

def add( args ):
    return arithmetic('+')

def sub ( args ) :
    return arithmetic('-')


'''
    @fooNan - for tests.
'''
def fooNan ( args ):
    return "".join( args )


operator = {
    "push" : push,
    "pop" : pop,
    "add" : add,
    "sub" : sub,
    "eq" : fooNan,
    "lt" : fooNan,
    "gt" : fooNan,
    "neg" : fooNan,
    "and" : fooNan,
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
    global filename
    filename = vmfile
    asmcode = handle_spaces_and_commments(open(vmfile,'r').readlines())
    asmcode = compile_lines(asmcode)
    #print(asmcode[0])
    return "\n".join(asmcode)
