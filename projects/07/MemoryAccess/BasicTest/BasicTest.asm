
//push constant10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop local0
@0
D=A
@LCL
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant21
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop argument2
@2
D=A
@ARG
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//pop argument1
@1
D=A
@ARG
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop this6
@6
D=A
@THIS
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop that5
@5
D=A
@THAT
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//pop that2
@2
D=A
@THAT
A=M
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop temp6
@6
D=A
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push local0
@0
D=A
@LCL
A=M
D=A+D
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//push that5
@5
D=A
@THAT
A=M
D=A+D
@R13
M=D
@R13
A=M
D=M
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
//push argument1
@1
D=A
@ARG
A=M
D=A+D
@R13
M=D
@R13
A=M
D=M
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
//push this6
@6
D=A
@THIS
A=M
D=A+D
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//push this6
@6
D=A
@THIS
A=M
D=A+D
@R13
M=D
@R13
A=M
D=M
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
//push temp6
@6
D=A
@5
D=D+A
@R13
M=D
@R13
A=M
D=M
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