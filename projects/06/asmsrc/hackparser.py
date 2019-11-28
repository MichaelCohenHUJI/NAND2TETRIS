import code
from string import ascii_letters



"""
    @dex_parse -
    returns binary represention of number.
"""
def dex_parse(line):
    ret = format(int(line[1:]) , 'b')
    return "0" * (16 - len(ret)) + ret

"""
    @symbol -
    dictionary which mapping symbols to their codes.
"""
symbol = {
    '@R0'  :    '0000000000000000',
    '@R1'  :    '0000000000000001',
    '@R2'  :    '0000000000000010',
    '@R3'  :    '0000000000000011',
    '@R4'  :    '0000000000000100',
    '@R5'  :    '0000000000000101',
    '@R6'  :    '0000000000000110',
    '@R7'  :    '0000000000000111',
    '@R8'  :    '0000000000001000',
    '@R9'  :    '0000000000001001',
    '@R10' :    '0000000000001010',
    '@R11' :    '0000000000001011',
    '@R12' :    '0000000000001100',
    '@R13' :    '0000000000001101',
    '@R14' :    '0000000000001110',
    '@R15' :    '0000000000001111',
    '@SCREEN' :  dex_parse('@16384'),
    '@KBD'    :  dex_parse('@24576'),
    '@SP'     :  dex_parse('@0'),
    '@LCL'    :  dex_parse('@1'),
    '@ARG'    :  dex_parse('@2'),
    '@THIS'   :  dex_parse('@3'),
    '@THAT'   :  dex_parse('@4')
}

"""
    @handle_spaces_and_commments -
    returns the asm code excluding the comments and the spaces
"""
def handle_spaces_and_commments(lines):
    # check if the line is a comment
    def iscomment(line):
        return len(line) > 1 and line[0] == "/" and line[1] == "/"
    # excludes the comment part of the line
    def stripcomment(line):
        return line[0:line.index("//")] if "//" in line else line
    # define the list which will evently contain the
    # lines after preprocessing.
    retlines = []
    # iterate over the lines.
    for line in lines:
        if not iscomment(line):
            # get rid off spaces.
            templine = line.replace(" ", "").strip()
            if len(templine) > 0 :
                # stripping the line from comments.
                retlines.append( stripcomment(templine).strip() )
    return retlines
"""
    @assignment_var -
    replacing the symbols by the suitable number, ( register or line )
"""
def assignment_var(lines):
    # define the list which will evently contain the
    # lines after preprocessing.
    retlines = []
    for line in lines:
        if line[0] == "@":
            if line in symbol:
                # if the line represents keyword or register,
                # than extracting from the symbol dic.
                retlines.append(symbol[line])
            else:
                # else, appending the symbol in binary represention
                retlines.append( dex_parse(line) )
        else:
            # in case the code is an instruction, appending him as it is.
            # the $ litiral indicates that the number is an instrection.
            retlines.append("$" + line)
    return retlines
"""
    @add_symbols -
    appending the symbols which defined by the user into the symbols table.
"""
def add_symbols(lines):
    retlines = []
    # hist, which indecates the diffrence of the line position in the file
    # relative the real position. each time parser define new symbol
    # the line will be deleted, and than, the positions of the followes
    # lines will be decreased.
    hist = 0
    for number , line in enumerate(lines):
        if line[0] == "(" and line[-1] == ")":
            # appending the line into the symbols.
            symbol[ "@" + line[1:-1] ] = dex_parse( "@{0}".format( number + hist) )
            # updating the hist.
            hist -= 1
        else :
            retlines.append(line)
    return retlines
"""
    @add_variables -
    appending variables which defined by the user into the symbols table.
    converts the names to numbers.
"""
def add_variables(lines):
    # the first 16 numbers are occupied by defintion.
    hist = 16
    for line in lines:
        # if the first litral indecates that the line is varible. than:
        if line[0] == "@" and line not in symbol and line[1] in ascii_letters :
            # entring the varible to the symbol table and increasing the hist.
            symbol[line] = dex_parse( "@{0}".format( hist) )
            hist += 1
    return lines
"""
    @format_lines -
    last preprocessing. appending ';' litirals which will be used as delimaters.
    also adding a 'null' jump in lines which not contain any jump instruction.
"""
def format_lines(lines):
    retlines = []
    for line in lines:
        templine = "" + line
        if line[0] == "$":
            templine = line[1:]
            if not "=" in line:
                templine = "null;" + templine
            else:
                templine = templine.replace('=' ,';')
            if not ";" in line:
                templine = templine +";null"
            templine = "$" + templine
        retlines.append(templine)
    return retlines
"""
    @parse -
    executing all the above methods. compleate the preprocessing
    and prepering code for the final satge which mainly replaces
    the symbols by numbers.
"""
def parse(lines):

    lines = handle_spaces_and_commments(lines)
    lines = add_symbols(lines)
    lines = add_variables(lines)
    lines = assignment_var(lines)
    lines = format_lines(lines)
    return code.generate(lines)
