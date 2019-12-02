
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