
//push constant10
@10
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

@LCL
A=A+0
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
<<<<<<< HEAD
@SP
M=M-1
A=M
D=M

@ARG
A=A+2
=======
//pop argument2
@2
D=A
@ARG
A=M
D=A+D
@R13
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
M=D
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

@ARG
A=A+1
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
M=D
//push constant36
@36
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
A=A+6
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
<<<<<<< HEAD
@SP
M=M-1
A=M
D=M

@THAT
A=A+5
=======
//pop that5
@5
D=A
@THAT
A=M
D=A+D
@R13
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
M=D
@SP
M=M-1
A=M
D=M
<<<<<<< HEAD

@THAT
A=A+2
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
<<<<<<< HEAD

@5
A=A+6
M=D
@LCL
A=A+0
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
D=M
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
@THAT
A=A+5
=======
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
<<<<<<< HEAD
@ARG
A=A+1
=======
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
@THIS
A=A+6
=======
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
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
D=M
@SP
A=M
M=D
@SP
M=M+1
<<<<<<< HEAD
@THIS
A=A+6
=======
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M-D
<<<<<<< HEAD
@5
A=A+6
=======
//push temp6
@6
D=A
@5
D=D+A
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