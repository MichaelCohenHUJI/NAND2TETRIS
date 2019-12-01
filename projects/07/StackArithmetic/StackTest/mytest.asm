//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//eq
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label1
<<<<<<< HEAD
D;JEQ
@SP
A=M
M=-1
@label0
D=D;JMP
(label1)
=======
JMP
(label1)
M=1
(label0)
//push constant17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant16
@16
D=A
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
@label2
M=M-D;JNE
M=0
@label3
JMP
(label3)
M=1
(label2)
//push constant16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant17
@17
D=A
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@SP
A=M
M=1
<<<<<<< HEAD
(label0)

//eq
=======
(label4)
//push constant892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
