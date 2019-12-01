

//push constant0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
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
A=M
M=D
@SP
M=M+1
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label1
D;JLT
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


//push constant2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@label3
D;JLT
@SP
A=M-1
M=0
@label2
D=D;JMP
(label3)
@SP
A=M-1
M=-1
(label2)


//push constant0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
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
A=M
M=D
@SP
M=M+1
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label5
D;JGT
@SP
A=M-1
M=0
@label4
D=D;JMP
(label5)
@SP
A=M-1
M=-1
(label4)


//push constant2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@label7
D;JGT
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
