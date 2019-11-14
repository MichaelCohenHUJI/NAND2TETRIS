// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//we are going to add R0 for R1 times
  @R1
  D=M
  @i
  M=D //i=R1
  @sum
  M=0 //sum = 0
  @R2 //make sure R2=0
  M=0

  (LOOP)
  @i
  D=M
  @STOP
  D;JEQ //stop if i=0

  @R0
  D=M
  @sum
  M=D+M //add R0
  @i
  M=M-1 //i=i-1
  @LOOP
  0;JMP

  (STOP)
  @sum
  D=M
  @R2
  M=D

  (END)
  @END
  0;JMP
