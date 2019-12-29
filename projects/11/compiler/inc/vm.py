from inc.Node import *

def handle_var(node , table):
    if str(type(node)) == "<class 'inc.Node.IdentifierNode'>" :
        if str(node.identifier) not in table:
            table.append( str(node.identifier))
    for child in node.children:
        handle_var(child, table)

def dfs(node, table=[]):
    ret = ""
    for child in node.children:
        if str(type(node)) == "<class 'inc.Node.createVarNode.<locals>.VarNode'>":
             handle_var(node, table)
        dfs(child, table)
