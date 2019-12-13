
global debug
debug  = True
filename = ''
labelcount = 0

pop_logic = '@SP\n' + \
        'M=M-1\n' + \
        'A=M\n' +\
        'D=M'

push_logic = "@SP\n" + \
                 "M=M+1\n" + \
                 "A=M-1\n" + \
                 "M=D"

glob_logic = '''
@SP
M=M-1
A=M
D=M
A=A-1
D=D&M
@R13
M=D
@SP
M=M-1
A=M+1
A=M
D=!M
A=A-1
M=!M
D=D&M
@R14
M=D
@R15
M=D
@R13
D=M
@R15
M=D|M'''

bool_logic = '''
(TRUE)
@SP
A=M
M=-1
@CONTINUE
0;JMP

(FALSE)
@SP
A=M
M=0
@CONTINUE
0;JMP
(CONTINUE)
'''

eq_logic = '''
@R15
D=M
@FALSE
D;JGE
@SP
A=M
D=M
A=A+1
D=M-D
@TRUE
D;JEQ
@FALSE
0;JMP
'''

lt_logic = '''
@R15
D=M
@NAIVE
D;JLT
@SP
A=M+1
D=M
@FALSE
D;JLT
@TRUE
0;JMP
(NAIVE)
@SP
A=M
D=M
A=A+1
D=D-M
@TRUE
D;JLT
@FALSE
0;JMP
'''

gt_logic ='''
@R15
D=M
@NAIVE
D;JLT
@SP
A=M+1
D=M
@TRUE
D;JLT
@FALSE
0;JMP
(NAIVE)
@SP
A=M
D=M
A=A+1
D=D-M
@TRUE
D;JGT
@FALSE
0;JMP
'''

comp_logic = '''
@SP
M=M-1
A=M
D=M
A=A-1
D=D&M
@R13
M=D
@SP
M=M-1
A=M+1
A=M
D=!M
A=A-1
M=!M
D=D&M
@R14
M=D
'''

times_called ={}

reg_hists = {
    "local"     : '@LCL'    ,
    "argument"  : '@ARG'    ,
    "this"      : '@THIS'   ,
    "that"      : '@THAT'   ,
    'temp'      :5
}

specials={'static':'@'+filename+'.', 'pointer0':'@THIS',
          'pointer1':'@THAT',    "constant" : '@'
}

def find_idx(stack,val=None):
    if stack in reg_hists:
        if stack == 'temp':
            ret = '@'+str(reg_hists[stack]+int(val))
        else:
            ret = '@'+val + '\n' +\
                  'D=A\n'          +\
                  reg_hists[stack]+'\n' +\
                  'D=D+M' #+\
                  # '@R13\n'+\
                  # 'M=D'
    else:
        if stack == 'pointer':
            ret = specials[stack+val]
        else:
            ret = specials[stack]+val
    return ret


def create_new_label():
    global labelcount
    ret = "label{0}".format(labelcount)
    labelcount += 1
    return ret


def push( args ):
    stack ,val  = args[0].split()
    printed = '//push '+stack+val
    push_logic = "@SP\n" +\
            "M=M+1\n" +\
            "A=M-1\n" +\
            "M=D"
    idx = find_idx(stack,val)
    if stack in reg_hists and stack != 'temp':
        ret ='A=D\n' +\
             "D=M"
    elif stack == 'constant':
        ret = 'D=A'
    else:
        ret = 'D=M'
    return "\n".join([printed, idx, ret, push_logic] )


def pop( args ):
    stack ,val  = args[0].split()
    printed = '//pop '+stack+val
    popper = '@SP\n' + \
        'M=M-1\n' + \
        'A=M\n' +\
        'D=M'
    idx = find_idx(stack,val)
    if stack in reg_hists and stack != 'temp':
        idx = idx+'\n' + '@R13\n'+\
                  'M=D'
        ret = '@R13\n' + \
              'A=M\n' + \
              "M=D"
        return "\n".join([printed, idx, popper, ret])
    else:
        ret = 'M=D'
    return "\n".join([printed, popper, idx, ret] )

def label(args):
    return "("+args[0]+")"

def goto(args):
    return "@"+args[0]+'\n'\
            "0;JMP"

def if_goto(args):
    popandcheck = '@SP\n' + \
             'M=M-1\n' + \
             'A=M\n' + \
             'D=M\n' +\
            '@'+args[0]+'\n'+\
            'D;JNE'
    return popandcheck

def call(args):
    args_lst = args[0].split()
    if len(args_lst)>1:
        func, nargs = args[0].split()
    else:
        func, nargs = args[0].split()[0], '0'
    if func not in times_called:
        times_called[func]=1
    retadd = func+'$ret'+'.'+str(times_called[func])
    call_synt = '@'+retadd+'\n' +\
                'D=A\n' +\
                push_logic+'\n' +\
                '@LCL\n' +\
                'D=M\n' +\
                push_logic+'\n' +\
                '@ARG\n' + \
                'D=M\n' + \
                push_logic+'\n' +\
                '@THIS\n' + \
                'D=M\n' + \
                push_logic + '\n' +\
                '@THAT\n'+ \
                'D=M\n' + \
                push_logic + '\n' +\
                '@5\n'+\
                'D=A\n'+\
                '@'+nargs+'\n' +\
                'D=D+A\n' +\
                '@SP\n' +\
                'D=M-D\n'+\
                '@ARG\n'+\
                'M=D\n' +\
                '@SP\n' +\
                'D=M\n' +\
                '@LCL\n' +\
                'M=D\n' +\
                goto([func])+'\n' +\
                '('+retadd+')'
    times_called[func] += 1
    return call_synt
        # push_logic = "@SP\n" + \
    #              "M=M+1\n" + \
    #              "A=M-1\n" + \
    #              "M=D"

def _function(args):
    func, nvars = args[0].split()
    func_label = '('+func+')\n'
    push_zero = '@0\n' + 'D=A\n' + push_logic +'\n'
    tot_zeroes = push_zero*int(nvars)
    return func_label+tot_zeroes

def _return(args):
    ret_commands = '@LCL\n' +\
            'D=M\n' +\
            '@endFrame\n'+\
                'M=D\n' +\
            '@5\n' +\
            'D=D-A\n' +\
            'A=D\n' +\
            'D=M\n' +\
            '@retAddr\n' +\
            'M=D\n' +\
             '@SP\n' + \
             'A=M-1\n' + \
             'D=M\n' +\
             '@ARG\n' +\
             'A=M\n' +\
             'M=D\n' +\
             'D=A\n' +\
             '@SP\n' +\
             'M=D+1\n'
    restore_THAT = '@endFrame\n' + 'A=M-1\n' + 'D=M\n'+\
        '@THAT\n' + 'M=D\n'
    restore_THIS = '@2\n' + 'D=A\n'+\
        '@endFrame\n' + 'A=M-D\n' + 'D=M\n' + \
                   '@THIS\n' + 'M=D\n'
    restore_ARG = '@3\n' + 'D=A\n' + \
                   '@endFrame\n' + 'A=M-D\n' + 'D=M\n' + \
                   '@ARG\n' + 'M=D\n'
    restore_LCL = '@4\n' + 'D=A\n' + \
                   '@endFrame\n' + 'A=M-D\n' + 'D=M\n' + \
                   '@LCL\n' + 'M=D\n'
    goto_ret = "@retAddr\n"+'A=M\n'+"0;JMP"
    return ret_commands+restore_THAT+restore_THIS+restore_ARG+restore_LCL+goto_ret

def onestep ( content ):
    return  "@SP\n" +\
            "A=M-1\n" + content
def twostep ( content ):
    return  "@SP\n" +\
            "A=M-1\n" +\
            "D=M\n" +\
            "@SP\n" +\
            "M=M-1\n" +\
            "A=M-1\n" +\
            content

def arithmetic( op ):
    return twostep("M=M{0}D".format(op))

def add( args ):
    return arithmetic('+')

def sub ( args ) :
    return arithmetic('-')

'''
    @fooNan - for tests.
'''
def fooNan ( args ):
    return "".join( args )


def insert(val):
    return  "@SP\n" +\
            "A=M-1\n" +\
            "M={0}\n".format(val)

def preprocessing():

    label_D_pos_M_neg_1 = create_new_label()
    label_D_pos_M_neg_2 = create_new_label()
    label_D_neg_M_pos_1 = create_new_label()
    label_D_neg_M_pos_2 = create_new_label()
    label_end_1         = create_new_label()
    label_end_2         = create_new_label()

    def store_reg(reg13, reg14):
        return  "@13\n"                      +\
                "M={0}\n".format(reg13)       +\
                "@14\n"                      +\
                "M={0}\n".format(reg14)

    # ret=    "@13\n"                    +\
    #         "M=D\n"                     +\
    #         twostep('')                 +\
    #         "D=M\n"                     +\
    #         "@14\n"                    +\
    #         "M=D\n"                     +\
    #         twostep('')                 +\
    #         "@{0}\n"                    +\
    #         "D;JGT\n"                   +\
    #         twostep('')                 +\
    #         "D=M\n"                     +\
    #         "@{2}\n"                    +\
    #         "D;JGT\n"                   +\
    #         "({0})\n"                   +\
    #         "D=M\n"                     +\
    #         "@{1}\n"                    +\
    #         "D;JLT\n"                   +\
    #         "@{4}\n"                    +\
    #         "0;JMP\n"                   +\
    #         "({1})\n"                   +\
    #         store_reg("1", "-1")        +\
    #         "@{5}\n"                    +\
    #         "0;JMP\n"                   +\
    #         "({2})\n"                   +\
    #         "@{3}\n"                    +\
    #         "D;JLT\n"                   +\
    #         "@{4}\n"                    +\
    #         "0;JMP\n"                   +\
    #         "({3})\n"                   +\
    #         store_reg("-1", "1")        +\
    #         "@{5}\n"                    +\
    #         "0;JMP\n"                   +\
    #         "({4})\n"                   +\
    #         twostep('')                 +\
    #         "({5})\n"                   +\
    #         "@13\n"                    +\
    #         "D=M\n"                     +\
    #         "@14\n"                    +\
    return "D=M-D"

    return ret.format(label_D_pos_M_neg_1,
                label_D_pos_M_neg_2,
                label_D_neg_M_pos_1,
                label_D_neg_M_pos_2,
                label_end_1, label_end_2)
"""




"""
'''
....
    @SP
    D=
    @R13
    M=D
    @R14
    M=D
    @SP
    M=M
    @diff_sgn
    D=M&D;JEQ
    (diff_sgn)
    @R13
    M;JGT
    D=
'''

def _if_else( precode, inst, flag, code1, code2 ):
    labelend = create_new_label()
    labelif = create_new_label()
    ret =   precode + "\n" +\
            "@{0}\n" +\
            "{0};{1}\n".format(inst ,flag) +\
            code1 +\
            "@{1}\n" +\
            "D=D;JMP\n" +\
            "({0})\n" +\
            code2 +\
            "({1})"
    return ret.format(labelif, labelend)


def incStack():
    return ""

def eq ( args ):
    debug_msg = "//eq\n" if debug else ""
    naive = '@'
    return glob_logic+'\n'+eq_logic+'\n'+bool_logic
def lt ( args ):
    return glob_logic + '\n' + lt_logic + '\n' + bool_logic


def gt ( args ):
    return glob_logic + '\n' + gt_logic + '\n' + bool_logic


def neg ( args ):
    return onestep("M=-M") +"\n" +\
      incStack()
def _and ( args ):
    return twostep("M=M&D") +"\n" +\
      incStack()
def _or ( args ):
    return twostep("M=M|D") +"\n" +\
      incStack()
def _not ( args ):
    return onestep("M=!M") +"\n" +\
      incStack()

operator = {
    "push" :    push,
    "pop" :     pop,
    "add" :     add,
    "sub" :     sub,
    "eq" :      eq,
    "lt" :      lt,
    "gt" :      gt,
    "neg" :     neg,
    "and" :     _and,
    "or" :      _or,
    "not" :     _not,
    "label":    label,
    "goto":     goto,
    "if-goto":  if_goto,
    "function": _function,
    "call": call,
    "return": _return
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
