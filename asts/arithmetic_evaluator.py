# exp ::= INT | exp + exp | exp * exp | -exp

# exp ::= MyNumber(INT) | Plus(exp, exp) | Multiply(exp, exp) | Negate(exp)

class MyNumber:
    def __init__(self, value):
        self.value = value

    def evaluate(self):
        return self.value
    

class Plus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def evaluate(self):
        return (self.left.evaluate() +
                self.right.evaluate())
    

class Multiply:
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def evaluate(self):
        return (self.left.evaluate() *
                self.right.evaluate())
        

class Negate:
    def __init__(self, exp):
        self.exp = exp

    def evaluate(self):
        return -self.exp.evaluate()
        

def toplevel_evaluate(exp):
    if isinstance(exp, MyNumber):
        return exp.value
    elif isinstance(exp, Plus):
        return (toplevel_evaluate(exp.left) +
                toplevel_evaluate(exp.right))
    elif isinstance(exp, Multiply):
        return (toplevel_evaluate(exp.left) *
                toplevel_evaluate(exp.right))
    elif isinstance(exp, Negate):
        return -toplevel_evaluate(exp.exp)
    else:
        return None
    
