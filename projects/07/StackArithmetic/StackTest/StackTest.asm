
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

//push constant17
@17
D=A
@SP
M=M+1
A=M-1
M=D
//push constant16
@16
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
@label15
D;JEQ
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

//eq

//push constant16
@16
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
@label23
D;JEQ
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
@label31
D;JLT
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

//push constant891
@891
D=A
@SP
M=M+1
A=M-1
M=D
//push constant892
@892
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
@label39
D;JLT
@SP
A=M-1
M=0
@label38
D=D;JMP
(label39)
@SP
A=M-1
M=-1
(label38)

//push constant891
@891
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
@label47
D;JLT
@SP
A=M-1
M=0
@label46
D=D;JMP
(label47)
@SP
A=M-1
M=-1
(label46)

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
@label55
D;JGT
@SP
A=M-1
M=0
@label54
D=D;JMP
(label55)
@SP
A=M-1
M=-1
(label54)

//push constant32766
@32766
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
D=M-D
@label63
D;JGT
@SP
A=M-1
M=0
@label62
D=D;JMP
(label63)
@SP
A=M-1
M=-1
(label62)

//push constant32766
@32766
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
@label71
D;JGT
@SP
A=M-1
M=0
@label70
D=D;JMP
(label71)
@SP
A=M-1
M=-1
(label70)

//push constant57
@57
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

@SP
A=M-1
M=!M
