// implementing division in machine language
@adder
M=1
@R15 //make sure R15 is 0
M=0
@R13
D=M
@divided //save the value of the divided number
M=D
@R14
D=M
@divider //save value of divider
M=D


(DIVISION)
@divider
D=M
@divided //jump if mech<mone
D=D-M
@SHIFTDIVIDER
D;JLT
@divided
D=M
@divider
M=M>>
D=D-M
@remainder
M=D
@adder
M=M>>
D=M
@R15
M=D


(DECREASEADDER)
@remainder
D=M
@divider
M=M>>
D=M-D
@adder
M=M>>
@BIGREMAINDER
D-1;JLT
(CONTINUE)
@adder
D=M
@DECREASEADDER
D;JGT
@END
0;JMP


(BIGREMAINDER)
@adder
D=M
@R15
M=D+M
@divider
D=M
@remainder
M=M-D
@CONTINUE
0;JMP


(SHIFTDIVIDER)
@divider
M=M<<
D=M
@KEEPSIGND
D;JLT
(BACKTOSHIFT)
@adder
M=M<<
D=M
@KEEPSIGNA
D;JLT
(BACKTODIVISION)
@DIVISION
0;JMP

(KEEPSIGND)
@divider
M=-M
@BACKTOSHIFT
0;JMP

(KEEPSIGNA)
@adder
M=-M
@BACKTODIVISION
0;JMP


(END)
@END
0;JMP
