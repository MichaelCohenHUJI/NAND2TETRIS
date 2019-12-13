

//push constant0
@0
D=A
@SP
M=M+1
A=M-1
M=D
//push constant32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
//push constant2
@2
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label7
D;JLT
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


//push constant2
@2
D=A
@SP
M=M+1
A=M-1
M=D
//push constant0
@0
D=A
@SP
M=M+1
A=M-1
M=D
//push constant32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label15
D;JLT
@SP
A=M-1
M=0
@label14
D=D;JMP
(label15)
@SP
A=M-1
M=-1
(label14)


//push constant0
@0
D=A
@SP
M=M+1
A=M-1
M=D
//push constant32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
//push constant2
@2
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label23
D;JGT
@SP
A=M-1
M=0
@label22
D=D;JMP
(label23)
@SP
A=M-1
M=-1
(label22)


//push constant2
@2
D=A
@SP
M=M+1
A=M-1
M=D
//push constant0
@0
D=A
@SP
M=M+1
A=M-1
M=D
//push constant32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label31
D;JGT
@SP
A=M-1
M=0
@label30
D=D;JMP
(label31)
@SP
A=M-1
M=-1
(label30)
