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

//push constant892
@892
D=A
@SP
M=M+1
A=M-1
M=D
//push constant891
@891
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

//push constant32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D
//push constant32766
@32766
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

//push constant56
@56
D=A
@SP
M=M+1
A=M-1
M=D
//push constant31
@31
D=A
@SP
M=M+1
A=M-1
M=D
//push constant53
@53
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
M=M+D
//push constant112
@112
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
M=-M

@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M&D

//push constant82
@82
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
M=M|D

//push constant100
@100
D=A
@SP
M=M+1
A=M-1
M=D
//pop static8
@SP
M=M-1
A=M
D=M
@.8
M=D
//push static8
@.8
D=M
@SP
M=M+1
A=M-1
M=D
//push constant3030
@3030
D=A
@SP
M=M+1
A=M-1
M=D
//pop pointer0
@SP
M=M-1
A=M
D=M
@THIS
M=D
//push constant3040
@3040
D=A
@SP
M=M+1
A=M-1
M=D
//pop pointer1
@SP
M=M-1
A=M
D=M
@THAT
M=D
//push constant32
@32
D=A
@SP
M=M+1
A=M-1
M=D
//pop this2
@2
D=A
@THIS
D=D+M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant46
@46
D=A
@SP
M=M+1
A=M-1
M=D
//pop that6
@6
D=A
@THAT
D=D+M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push pointer0
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
//push pointer1
@THAT
D=M
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
M=M+D
//push this2
@2
D=A
@THIS
D=D+M
A=D
D=M
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
//push that6
@6
D=A
@THAT
D=D+M
A=D
D=M
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
M=M+D
//push constant3038
@3038
D=A
@SP
M=M+1
A=M-1
M=D
//pop pointer0
@SP
M=M-1
A=M
D=M
@THIS
M=D
//push constant15
@15
D=A
@SP
M=M+1
A=M-1
M=D
//pop this2
@2
D=A
@THIS
D=D+M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D