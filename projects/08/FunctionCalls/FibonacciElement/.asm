

(Main.fibonacci)

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

@SP
M=M-1
A=M
D=M
@IF_TRUE
D;JNE
@IF_FALSE
0;JMP
(IF_TRUE)
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
@LCL
D=M
@endFrame
M=D
@5
D=D-A
@retAddr
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A
@SP
M=D+1
@endFrame
A=M-1
D=M
@THAT
M=D
@2
D=A
@endFrame
A=M-D
D=M
@THIS
M=D
@3
D=A
@endFrame
A=M-D
D=M
@ARG
M=D
@4
D=A
@endFrame
A=M-D
D=M
@LCL
M=D
@retAddr
A=M
0;JMP
(IF_FALSE)
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
@Main.fibonacci$ret.1
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
@1
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.1)
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
@Main.fibonacci$ret.2
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
@1
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.2)
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M+D
@LCL
D=M
@endFrame
M=D
@5
D=D-A
@retAddr
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A
@SP
M=D+1
@endFrame
A=M-1
D=M
@THAT
M=D
@2
D=A
@endFrame
A=M-D
D=M
@THIS
M=D
@3
D=A
@endFrame
A=M-D
D=M
@ARG
M=D
@4
D=A
@endFrame
A=M-D
D=M
@LCL
M=D
@retAddr
A=M
0;JMP

(Sys.init)

//push constant4
@4
D=A
@SP
M=M+1
A=M-1
M=D
@Main.fibonacci$ret.3
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
@1
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.3)
(WHILE)
@WHILE
0;JMP