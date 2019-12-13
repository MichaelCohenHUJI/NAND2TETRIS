
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
M=D|M

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
M=D|M

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
M=D|M

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

