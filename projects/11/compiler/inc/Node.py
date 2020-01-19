from pprint import pprint
from copy import deepcopy

'''
    Todo, poping fields from the table while, return
    back in the recursion.
'''

symbolsvm = {
    "+" : "add",
    "-" : "sub",
    "*" : "call mull",
    "/" : "call div"
}


def warpper_copy(table):
    # return deepcopy(table)
    return table
def is_symbol_node(_node):
    return str(type(_node)) ==\
    "<class 'inc.Node.createSymbol.<locals>.SymbolNode'>"
def is_IdentifierNode(_node):
    return str(type(_node)) ==\
    "<class 'inc.Node.IdentifierNode'>"

def update_table(table, _name, _type, kind):
    kind = kind if kind != "var" else "local"
    index = table[ 'index__' ][  kind ] + 1
    table[ kind ][ _name ] = (_type, kind, index)
    table[ 'index__' ][  kind ] = index

def last_node_is( _func, _perent):
    return len(_perent.children) > 0 and\
     _func(_perent.children[-1])

class Node():
    def __init__(self, streamer, table, hist=0):
        self.streamer = streamer
        self.children = []
        self.hist = hist
        self.table = table

    def generate(self):
        ret = ""
        for child in self.children:
            # ~patch~
            if child != None:
                ret += child.generate()
        return ret

    def updatehist(self, _add):
        self.hist += _add
        for child in self.children:
            # ~patch~
            if child != None:
                child.updatehist(_add)

    def histline(self, line, addition=0):
        return (self.hist + addition) * "\t" + line + "\n"
class IdentifierNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(IdentifierNode, self).__init__(streamer, table, hist)
        self.identifier = streamer.read()

    def generate(self):
        return self.histline("{0}".format(self.identifier))
class abcArgcClosure(Node):
    def __init__(self, streamer, table, lcloser='(', rcloser=")", hist=0):
        super(abcArgcClosure, self).__init__(streamer, table, hist = hist)
        self.lcloser = lcloser
        self.rcloser = rcloser

    def collect(self):

        _token = None
        while self.streamer.top() != self.rcloser :
            node = nextToken(self.streamer, self.table, hist=self.hist+1)
            if node != None :
                self.children.append( node )
class ArgcClosure(abcArgcClosure):
    def __init__(self, streamer, table, lcloser='(', rcloser=")", hist=0):
        super(ArgcClosure, self).__init__(streamer, table, lcloser='(', rcloser=")", hist = hist)
        self.lcloser = lcloser
        self.rcloser = rcloser

    def collect(self):
        self.children.append( nextToken(self.streamer, self.table, hist=self.hist+1) )
        super().collect()
        self.children.append( nextToken(self.streamer, self.table, hist=self.hist+1) )
class ArgcClosureStatements(abcArgcClosure):
    def __init__(self, streamer, table, lcloser='{', rcloser="}", hist=0):
        super(ArgcClosureStatements, self).__init__(streamer, table, lcloser='{', rcloser="}", hist=hist)
        #self.updatehist(1)

    def generate(self):
        return self.histline("<statements>") +\
         super().generate() + self.histline("</statements>")
class ClassNode(ArgcClosure):
    def __init__(self, streamer, table, hist=0):
        super(ClassNode, self).__init__(streamer, table, lcloser='{', rcloser="}", hist=hist)
        self.children.append( IdentifierNode(streamer, table, hist=self.hist + 1))

        super().collect()


    def generate(self):
        return super().generate()  #self.histline("<keyword> class </keyword>", addition=1) + super().generate()
def createVarNode(vartype, _keyword):
    class VarNode(Node):
        def __init__(self, streamer, table, hist=0):
            super(VarNode, self).__init__(streamer, table, hist=hist)
            self.children.append( createKeyword(_keyword)( streamer, table, hist=hist+1) )
            _type = streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) ) # int
            _name = streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1 ))

            update_table(table, _name, _type, _keyword)
            while streamer.top() == ",":
                self.children.append( nextToken(streamer, table, hist=hist+1) )
                _name = streamer.top()
                update_table(table, _name, _type, _keyword)
                self.children.append( IdentifierNode(streamer, table, hist=hist+1 ))

            self.children.append( nextToken(streamer, table, hist=hist+1) )


        def generate(self):
            return self.histline("<{0}>".format(vartype)) +\
                        super().generate() + self.histline("</{0}>".format(vartype))

    return VarNode
class Term(Node):
    def __init__(self, streamer, table, node, minus=False, hist=0):
        super(Term, self).__init__(streamer, table, hist=hist)
        node.updatehist(1)

        self.children.append(node)
        if streamer.top() == "(" and is_IdentifierNode(node):
            self.children.append(ExpressionList( streamer, table, hist=hist+1))
        # or streamer.top() == "(":
        if streamer.top() == "." :
            while streamer.top() == ".":
                self.children.append(nextToken(streamer, table, hist=hist+1))
                self.children.append(IdentifierNode(streamer, table, hist=hist+1))
            self.children.append(ExpressionList( streamer, table, hist=hist+1))
        elif streamer.top() == "[":
            self.children.append(Expression(streamer, table, lcloser="[", rcloser="]", hist=hist+1))
        if minus :
            self.children.append(\
             Term(streamer, table, IdentifierNode(streamer, table, hist=hist+1), hist=hist+1))
    def generate(self):
        return super().generate() #self.histline("push") +
class abcExpression(ArgcClosure):
    def __init__(self, streamer, table, lcloser='(', rcloser=")",  hist=0):
        super(abcExpression, self).__init__(streamer, table, lcloser=lcloser, rcloser=rcloser, hist=hist)
        self.collect()

    def collect(self):

        def get_node(perent):

            _char = self.streamer.top()
            node = None
            if _char == "(" :
                node = Expression(perent.streamer, perent.table, lcloser='(', rcloser=')', hist=perent.hist+1)
            elif check_int(_char) :
                node = IntConstantNode(perent.streamer, perent.table, hist=perent.hist+1)
            else:
                node = Token_or_Identifier(perent.streamer, perent.table, hist=perent.hist+1)

            if node != None and ( _char not in operator or _char == "\"") :
                return Term(perent.streamer, perent.table,node, hist=perent.hist+1)
            elif _char in "-~" and (len(perent.children) == 0)  or\
             last_node_is(is_symbol_node, perent):
                ret = Term(perent.streamer, perent.table,node, hist=perent.hist+1)
                ret.children.append( get_node(ret) )
                return ret
            else :
                return node

        _token = None
        while self.notclosed():
            self.children.append( get_node(self) )
    def generate(self):
        return super().generate()
    def notclosed(self):
        return self.streamer.top() != self.rcloser
# decorator
class Expression(ArgcClosure):
    def __init__(self, streamer, table, lcloser='(', rcloser=")",  hist=0):
        super(Expression, self).__init__(streamer, table, lcloser=lcloser, rcloser=rcloser, hist=hist)
        #self.expression = abcExpression(streamer, table, lcloser='(', rcloser=")",   hist=hist)
        self.preExp = nextToken(self.streamer, self.table, hist=self.hist+1)
        self.expression = abcExpression(streamer, table, lcloser=lcloser, rcloser=rcloser,   hist=hist)
        self.endExp = nextToken(self.streamer, self.table, hist=self.hist+1)
        #self.collect()

        # self.preExp = self.children.pop(0) # =
        # self.endExp = self.children.pop(-1)

        # for debuging propuse :
        if self.preExp is None:
            self.preExp = Node(streamer)

        self.preExp.hist -= 1

        if self.endExp is None:
            self.endExp = Node(streamer)

        self.endExp.hist -= 1

    def collect(self):
        self.expression.collect()


    def generate(self):
        return self.preExp.generate() +\
                    self.expression.generate() + self.endExp.generate()

    def updatehist(self, _add):
        super().updatehist(_add)
        self.expression.updatehist(_add)
        self.preExp.updatehist(_add)
        self.endExp.updatehist(_add)
class ExpressionItem(abcExpression):
    def __init__(self, streamer, table, lcloser='(', rcloser=")",  hist=0):
        super(ExpressionItem, self).__init__(streamer, table, lcloser=lcloser, rcloser=rcloser, hist=hist)

    def notclosed(self):
        return self.streamer.top() != self.rcloser and self.streamer.top() != ','
class ExpressionList(Node):
    def __init__(self, streamer, table, hist=0):
        super(ExpressionList, self).__init__(streamer, table, hist=hist)

        self.preExp = nextToken(streamer, table,hist=hist)
        if streamer.top() != ")" :
            self.children.append( ExpressionItem(streamer, table, lcloser='(', rcloser=")",  hist=hist+1) )
        while streamer.top() == "," :
            self.children.append( nextToken(streamer, table,hist=hist+1))
            self.children.append( ExpressionItem(streamer, table, lcloser='(', rcloser=")",  hist=hist+1) )
        self.endExp = nextToken(streamer, table,hist=hist)

        if self.preExp is None:
            self.preExp = Node(streamer)

        # self.preExp.hist -= 1
        #
        if self.endExp is None:
            self.endExp = Node(streamer)

        # self.endExp.hist -= 1

    def generate(self):
        return self.preExp.generate() +\
                    super().generate() + \
                    self.endExp.generate()

    def updatehist(self, _add):
        super().updatehist(_add)
        self.preExp.updatehist(_add)
        self.endExp.updatehist(_add)
class LetNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(LetNode, self).__init__(streamer, table, hist=hist)
        self.children.append( createKeyword("let")( streamer, table, hist=hist+1) )
        self.children.append( IdentifierNode(streamer, table, hist=hist+1 ))
        if streamer.top() == "[":
            self.children.append(  Expression(streamer, table, lcloser = "[", rcloser = "]", hist=hist+1 ) )
        self.children.append(  Expression(streamer, table, lcloser = "=", rcloser = ";", hist=hist+1 ) )

    def generate(self):
        return super().generate()
class doNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(doNode, self).__init__(streamer, table, hist=hist)
        self.children.append( createKeyword("do")( streamer, table, hist=hist+1))

        self.children.append( IdentifierNode(streamer, table, hist=hist+1) )
        while streamer.top() == ".":
            self.children.append( nextToken(streamer, table, hist=hist+1) )
            self.children.append(   IdentifierNode(streamer, table, hist=hist+1) )
        #self.children.append( nextToken(streamer, table, hist=hist+1) )
        self.children.append( ExpressionList(streamer, table, hist=hist+1) )
        self.children.append( nextToken(streamer, table, hist=hist+1) )
    def generate(self):
        return self.histline("call") + \
            super().generate()
class ReturnNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(ReturnNode, self).__init__(streamer, table, hist)
        self.children.append( createKeyword("return")( streamer, table, hist=hist+1)  )
        if streamer.top() != ";":
            self.children.append( abcExpression(streamer, table, rcloser=";", hist=hist+1) )
        self.children.append( nextToken(streamer , table, hist=hist+1) )

    def generate(self):
        return self.histline("return") + \
            super().generate()

class StringConstantNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(StringConstantNode, self).__init__(streamer, table, hist)
        self.value = ""
        #streamer.read()
        while streamer.top() != "\"":
            self.value += streamer.read() +" "
        streamer.read()

    def generate(self):
        return self.histline("<stringConstant> {0} </stringConstant>".format(self.value))
class IntConstantNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(IntConstantNode, self).__init__(streamer, table, hist)
        self.value =  int(streamer.read())

    def generate(self):
        return self.histline("{0}".format(self.value))
class parameterListNode(Node):
    def __init__(self, streamer, table, hist=0):
        super(parameterListNode, self).__init__( streamer, table, hist=hist )

        self.preExp = nextToken( streamer, table, hist=hist )
        while streamer.top() != ")" :
            _type =  streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1))
            _name =  streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1))
            kind = "argument"
            if streamer.top() == ",":
                self.children.append(Token_or_Identifier(streamer, table, hist=hist+1))

            update_table(table, _name, _type, kind)

        self.endExp = nextToken( streamer, table, hist=hist )

    def generate(self):
        return self.preExp.generate() +\
            super().generate() + \
            self.endExp.generate()
class BodySubRotNode(ArgcClosureStatements):
    def __init__(self, streamer, table, hist=0):
        super(BodySubRotNode, self).__init__( streamer, table, lcloser='{', rcloser="}", hist=hist)
        super().collect()
class Warper(Node):
    def __init__(self, streamer, table, nodes, _tag, hist=0):
        super(Warper, self).__init__(streamer, table, hist)
        self.children = nodes
        self.updatehist(1)
        self._tag = _tag

    def generate(self):
        return self.histline("<{0}>".format(self._tag)) + \
             super().generate() +  self.histline("</{0}>".format(self._tag))
def createSubRot(_keyword):
    class SubRotNode(Node):
        def __init__(self, streamer, table, hist=0):
            super(SubRotNode, self).__init__( streamer, table, hist=hist)
            self.children.append(createKeyword(_keyword)(streamer, table, hist=hist+1))
            self.type = streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) )
            self.name = streamer.top()
            self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) )
            self.children.append( parameterListNode(streamer, table, hist=hist+1) )

            func_val = 1
            table["functions"][ self.name ] = func_val

            nodes = [ ]
            nodes.append( Token_or_Identifier(streamer, table, hist=hist+1) )
            while streamer.top() == "var":
                nodes.append( Token_or_Identifier(streamer, table, hist=hist+1) )
            nodes.append( BodySubRotNode(streamer, table, hist=hist+1) )
            nodes.append( Token_or_Identifier(streamer, table, hist=hist+1) )
            self.children.append( Warper( streamer, table, nodes, "subroutineBody", hist=hist+1) )


        def generate(self):
            return self.histline("function {0}".format(self.name)) +\
                super().generate()

    return SubRotNode
def createCondition(_keyword, _statement):
    class conditionNode(Node):
        def __init__(self, streamer, table, hist=0):
            super(conditionNode, self).__init__(streamer, table, hist=hist)
            self.children.append(Expression(streamer, table, hist=hist+1))

            def create_block():
                self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) )
                node = ArgcClosureStatements(streamer, table, lcloser='{', rcloser="}",hist=hist+1)
                node.collect()
                self.children.append(node)
                self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) )

            create_block()
            if streamer.top() == "else" and _keyword == "if" :
                self.children.append( Token_or_Identifier(streamer, table, hist=hist+1) )
                create_block()

        def generate(self):
            return self.histline("<{0}>".format(_statement)) + \
                        self.histline("<keyword> {0} </keyword>".format(_keyword), addition=1) + super().generate() + \
                        self.histline("</{0}>".format(_statement))

    return conditionNode
def createSymbol(_symbol):
    class SymbolNode(Node):

        def __init__(self, streamer, table, hist=0):
            super(SymbolNode, self).__init__(streamer, table, hist)

        def generate(self):
            if _symbol in symbolsvm:
                return self.histline("{0}".format(symbolsvm[_symbol]))
            else:
                return ""

    return SymbolNode
def createKeyword(keyword):
    class KeywordNode(Node):
        def __init__(self, streamer, table, hist=0):
            super(KeywordNode, self).__init__(streamer, table, hist)

        def generate(self):
            return  "" #self.histline("<keyword> {0} </keyword>".format(keyword))

    return KeywordNode
def Token_or_Identifier(streamer, table, hist=0):
    if streamer.top() in tokens:
        return nextToken(streamer, table, hist=hist)
    else:
        return IdentifierNode(streamer, table, hist=hist)

def nextToken(streamer, table, hist=0):
    _token = streamer.read()
    if _token in tokens:
        return tokens[_token]( streamer, table, hist=hist )
def generateRoot(streamer):
    _var_kinds = [ "static", "field", "argument", "local"]

    table = {  **{"index__" : {  kind : 0 for kind in _var_kinds  }},
     **{ kind : {} for kind in _var_kinds  } , **{ "functions" : {} } }

    ret = nextToken(streamer, table)
    return ret
# stack-over-flow !!!
def check_int(s):
    if s[0] in ('-', '+'):
        return s[1:].isdigit()
    return s.isdigit()



operator = {
    "+" : createSymbol("+"),
    "-" : createSymbol("-"),
    "*" : createSymbol("*"),
    "/" : createSymbol("/"),
    "|" : createSymbol("|"),
    "=" : createSymbol("="),
    "<" : createSymbol("&lt;"),
    ">" : createSymbol("&gt;"),
    "&" : createSymbol("&amp;"),
    "~" : createSymbol("~")
}


symbols = {
    "{" : createSymbol("{"),
    "}" : createSymbol("}"),
    "(" : createSymbol("("),
    ")" : createSymbol(")"),
    "[" : createSymbol("["),
    "]" : createSymbol("]"),
    "," : createSymbol(","),
    **operator,
    ";" : createSymbol(";"),
    "." : createSymbol(".")

}


tokens = {
    "class" : ClassNode,
    "function" : createSubRot("function"),
    "method" : createSubRot("method"),
    "constructor" : createSubRot("constructor"),
    "if" : createCondition("if" , "ifStatement"),
    "let" : LetNode,
    "while" : createCondition("while" , "whileStatement"),
    "do" : doNode ,
    **symbols,
    "\"" : StringConstantNode,
    "var" : createVarNode("varDec" , "var"),
    "field" :createVarNode("classVarDec" , "field"),
    "static" :createVarNode("classVarDec" , "static"),
    "int" : createKeyword("int"),
    "char" : createKeyword("char"),
    "boolean" : createKeyword("boolean"),
    "true" : createKeyword("true"),
    "false" : createKeyword("false"),
    # "Array" : createKeyword("Array"),
    "void" : createKeyword("void"),
    "return" : ReturnNode,
    "this" : createKeyword("this"),
    "null" : createKeyword("null"),
    "else" : createKeyword("else")
}
