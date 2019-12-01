
//push constant3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop pointer0
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

=======
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@THIS
M=D
//push constant3040
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1
//pop pointer1
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

=======
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@THAT
M=D
//push constant32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
@SP
M=M-1
A=M
D=M

@THIS
A=A+2
=======
//pop this2
@2
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
M=D
//push constant46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
@SP
M=M-1
A=M
D=M

@THAT
A=A+6
M=D
=======
//pop that6
@6
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
//push pointer0
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
=======
//push pointer1
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@THAT
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
<<<<<<< HEAD
@THIS
A=A+2
=======
//push this2
@2
D=A
@THIS
A=M
D=A+D
@R13
M=D
@R13
A=M
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
@THAT
A=A+6
=======
//push that6
@6
D=A
@THAT
A=M
D=A+D
@R13
M=D
@R13
A=M
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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