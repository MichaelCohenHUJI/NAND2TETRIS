
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
D;JEQ
@SP
A=M
M=-1
@label0
D=D;JMP
(label1)
@SP
A=M
M=1
(label0)
<<<<<<< HEAD

//eq

=======
//push constant17
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
//eq
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label3
D;JEQ
@SP
A=M
M=-1
@label2
D=D;JMP
(label3)
@SP
A=M
M=1
(label2)
<<<<<<< HEAD

//eq

=======
//push constant16
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
@label5
D;JEQ
@SP
A=M
M=-1
@label4
D=D;JMP
(label5)
@SP
A=M
M=1
(label4)
<<<<<<< HEAD

//eq

=======
//push constant892
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label7
D;JLT
@SP
A=M
M=-1
@label6
D=D;JMP
(label7)
@SP
A=M
M=1
(label6)

//push constant891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant892
@892
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
D=M-D
@label9
D;JLT
@SP
A=M
M=-1
@label8
D=D;JMP
(label9)
@SP
A=M
M=1
(label8)

//push constant891
@891
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
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
D=M-D
@label11
D;JLT
@SP
A=M
M=-1
@label10
D=D;JMP
(label11)
@SP
A=M
M=1
(label10)

//push constant32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32766
@32766
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
D=M-D
@label13
D;JGT
@SP
A=M
M=-1
@label12
D=D;JMP
(label13)
@SP
A=M
M=1
(label12)

//push constant32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32767
@32767
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
D=M-D
@label15
D;JGT
@SP
A=M
M=-1
@label14
D=D;JMP
(label15)
@SP
A=M
M=1
(label14)

//push constant32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant32766
@32766
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
D=M-D
@label17
D;JGT
@SP
A=M
M=-1
@label16
D=D;JMP
(label17)
@SP
A=M
M=1
(label16)

//push constant57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
//push constant53
@53
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
M=M+D
//push constant112
@112
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
M=M-D
@SP
A=M-1
M=-M

<<<<<<< HEAD
@SP
A=M-1
D=M
@SP
M=M-1
A=M-1
M=M&D

=======
//push constant82
>>>>>>> ec385fb77fca36234c67e63121de5c3b7a8b8dbb
@82
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
M=M|D

@SP
A=M-1
M=!M
