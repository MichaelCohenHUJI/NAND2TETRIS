// implementing bubblesort in machine language
  @R14 //reading where to sort
  D=M
  @curbubble
  M=D       //save the address
  @R15
  D=D+M
  @finalindex
  M=D

  (OUTERLOOP)
  @curbubble
  A=M     //move to current element
  D=M     //value of current element
  @curbubble
  A=M+1   //move to next element
  D=D-M   //check if next element is > cur
  @FLIP //if so, flip them
  D;JLT
  (BACKTOSORT)
  @curbubble //move to next element
  M=M+1
  D=M
  @finalindex //check if last element reached
  D=M-D
  @NEWITER //if so, end iteration and start another
  D;JEQ
  @OUTERLOOP //if not, go to next element
  0;JMP

  (FLIP)
  @curbubble
  A=M+1
  D=M
  @keeper   //save value of next element
  M=D
  @curbubble    //put current value to next element
  A=M
  D=M
  @curbubble
  A=M+1
  M=D
  @keeper //get the value of next element
  D=M
  @curbubble //put next value to CUR
  A=M
  M=D
  @BACKTOSORT //continue sorting
  0;JMP

  (NEWITER)
  @finalindex //lower the number of elements to sort by 1
  M=M-1
  D=M
  @R14
  D=D-M
  @END //end the program after n iterations
  D;JEQ
  @R14 //else start new iteration
  D=M
  @curbubble
  M=D
  @OUTERLOOP
  0;JMP

  (END)
  @END
  0;JMP
