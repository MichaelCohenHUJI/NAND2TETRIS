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

'''
@R13
M=0
@R14
M=0
@SP
M=M-1
A=M
D=M
@YLT
D;JLT
@YGT
D;JGT
(CONTINUE)
@SP
M=M-1
A=M
D=M
@XLT
D;JLT
@XGT
D;JGT
(CONTINUE2)


(YLT)
@R13
M=-1
@CONTINUE
0;JMP

(YGT)
@R13
M=1
@CONTINUE
0;JMP

(XLT)
@R14
M=-1
@CONTINUE2
0;JMP

(XGT)
@R14
M=1
@CONTINUE2
0;JMP


'''
# for lt, if R14-R13<0 return true
# else, do naive lt
# for gt, if R14-R13>0 return false
# else, do naive gt
# for eq, if R14-R13=0 do naive eq (by substraction)
# else return false