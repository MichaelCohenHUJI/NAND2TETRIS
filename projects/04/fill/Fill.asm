// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
//

  (INNERLOOP)
  @KBD
  D=M //D is the input
  @switch
  M=-1 //switch on
  @TURNSWITCH //jump if keyboard bit is >0
  D;JNE
  @switch //if keyboard bit is 0 switch off
  M=0

  (TURNSWITCH)
  @SCREEN
  D=A
  @screenbus //save the address of first screen bit
  M=D

  (ITERLOOP)
  @switch
  D=M
  @screenbus
  A=M
  M=D   //switch to requested state
  @screenbus
  M=M+1 //save the value of next screen bit
  D=M
  @24576
  D=A-D //check if all screen bits are switched
  @ITERLOOP //if not, continue to next bit
  D;JNE

  @INNERLOOP //start the process again
  0;JMP
