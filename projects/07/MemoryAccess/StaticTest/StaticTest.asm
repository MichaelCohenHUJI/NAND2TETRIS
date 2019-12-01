
//push constant111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant333
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant888
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop static8
@SP
M=M-1
A=M
D=M
@.8
M=D
//pop static3
@SP
M=M-1
A=M
D=M
@.3
M=D
//pop static1
@SP
M=M-1
A=M
D=M
@.1
M=D
//push static3
@.3
D=M
@SP
A=M
M=D
@SP
M=M+1
//push static1
@.1
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
//push static8
@.8
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