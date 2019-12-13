@256
D=A
@SP
M=D
@Sys.init$ret.1
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@5
D=A
@0
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(Sys.init$ret.1)


//push argument1
@1
D=A
@ARG
D=D+M
A=D
D=M
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

//push constant0
@0
D=A
@SP
M=M+1
A=M-1
M=D
//pop that0
@0
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
//push constant1
@1
D=A
@SP
M=M+1
A=M-1
M=D
//pop that1
@1
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

//push argument0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
M=M+1
A=M-1
M=D
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
M=M-D
//pop argument0
@0
D=A
@ARG
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

(MAIN_LOOP_START)

//push argument0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
M=M+1
A=M-1
M=D
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE
@END_PROGRAM
0;JMP

(COMPUTE_ELEMENT)

//push that0
@0
D=A
@THAT
D=D+M
A=D
D=M
@SP
M=M+1
A=M-1
M=D
//push that1
@1
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
//pop that2
@2
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

//push pointer1
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
//push constant1
@1
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
//pop pointer1
@SP
M=M-1
A=M
D=M
@THAT
M=D

//push argument0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
M=M+1
A=M-1
M=D
//push constant1
@1
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
//pop argument0
@0
D=A
@ARG
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

@MAIN_LOOP_START
0;JMP

(END_PROGRAM)