//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//eq
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label1
D;JEQ
@SP
A=M-1
M=0
@label0
D=D;JMP
(label1)
@SP
A=M-1
M=-1
(label0)

//eq
