

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
