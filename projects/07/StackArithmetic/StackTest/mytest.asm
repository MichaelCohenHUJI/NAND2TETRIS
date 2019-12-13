//push constant17
@17
D=A
@SP
M=M+1
A=M-1
M=D
//push constant17
@17
D=A
@SP
M=M+1
A=M-1
M=D
//eq
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label7
D;JEQ
@SP
A=M-1
M=0
@label6
D=D;JMP
(label7)
@SP
A=M-1
M=-1
(label6)

//eq
