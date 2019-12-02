'''
add -
@
'''
def find_idx(stack,val=None):
    if stack in reg_hists:
        if stack != 'temp':
            ret = '@'+val + '\n' +\
                'D=A\n'          +\
                reg_hists[stack]+'\n' +\
                'A=M\n'          +\
                'D=A+D\n' +\
                '@R13\n'+\
                'M=D'
        else:
            ret = '@' + val + '\n' + \
                  'D=A\n' + \
                  reg_hists[stack] + '\n' + \
                  'D=D+A\n' +\
                  '@R13\n' +\
                  'M=D'
    else:
        if stack == 'pointer':
            ret = specials[stack+val]
        else:
            ret = specials[stack]+val
    return ret


def push( args ):
    stack ,val  = args[0].split()
    printed = '//push '+stack+val
    push_logic = "@SP\n" +\
            "A=M\n" +\
            "M=D\n" +\
            "@SP\n" +\
            "M=M+1"
    idx = find_idx(stack,val)
    if stack in reg_hists:
        ret = '@R13\n'+\
            'A=M\n' +\
            "D=M"
    elif stack == 'constant':
        ret = 'D=A'
    else:
        ret = 'D=M'
    return "\n".join([printed, idx, ret, push_logic] )