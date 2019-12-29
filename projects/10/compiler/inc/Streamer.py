
def handle_spaces_and_commments(text):


    p = -1
    while text.find( "/*" ) > p :
        i = text.find( "/*" )
        if i == 0 or ( i > 0 and text[:i].count("\"") % 2 == 0 ):
            j = text.find( "*/" )
            text = text[:i] + text[j+2:]
        else:
            p = i

    def iscomment(line):
        return len(line) > 1 and line[0] == "/" and line[1] == "/"

    def stripcomment(line):
        i = line.find("//")
        if ( line[:i].count("\"") % 2 == 0 ):
            return line[0:line.index("//")] if "//" in line else line
        else :
            return line

    def ismultiline(line):
        return len(line>1)

    multiline = False

    rettext = ""
    for line in text.split("\n"):
        if not iscomment(line):
            templine = line.strip()
            if len(templine) > 0 :
                rettext += stripcomment(templine).strip() + "\n"
    return rettext


class Streamer():
    """docstring for Streamer."""

    def __init__(self, inputfile):
        super(Streamer, self).__init__()
        self.text =  handle_spaces_and_commments(open(inputfile, 'r').read())
        for op in [ ";","(" , ")","{", "}", "[" ,"]","\"", ",",".","+","*","/","=",">","<", "-", "~" ]:
            self.text = self.text.replace(op , " {0} ".format(op))

        self.text = self.text.split()
        #print(self.text)
        self.cursor = 0

    def read(self):
        ret = self.text[self.cursor]
        self.cursor += 1
        return ret

    def top(self):
        return self.text[self.cursor]
