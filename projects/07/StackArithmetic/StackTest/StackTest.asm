
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
@label0
M=M-D;JNE
M=0
@label1
JMP
(label1)
M=1
(label0)
//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant16
@16
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
@label2
M=M-D;JNE
M=0
@label3
JMP
(label3)
M=1
(label2)
//push constant16
@16
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
@label4
M=M-D;JNE
M=0
@label5
JMP
(label5)
M=1
(label4)
//push constant892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant891
@891
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
//push constant32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant32766
@32766
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

//push constant32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant53
@53
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
M=M+D
//push constant112
@112
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
M=-M

//push constant82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

@SP
A=M-1
M=!M