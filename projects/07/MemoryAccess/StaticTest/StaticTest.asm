
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
<<<<<<< HEAD

=======
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@.8
M=D
//pop static3
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

=======
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@.3
M=D
//pop static1
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

@.1
M=D
=======
@.1
M=D
//push static3
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@.3
D=M
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
=======
//push static1
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
<<<<<<< HEAD
=======
//push static8
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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