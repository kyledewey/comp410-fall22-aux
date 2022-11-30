# What is Logic Programming?
#
# 1.) Nondeterminism / nondeterministic execution
# 2.) Unification

# def fooOrBar():
#     yield from foo()
#     yield from bar()

# zeroOrOne(0).
# zeroOrOne(1).
def zeroOrOne():
    print("CALLING ZERO OR ONE")
    yield 0
    yield 1

# twoOrThree(2).
# twoOrThree(3).
def twoOrThree():
    yield 2
    yield 3
    yield 4
    
# addTwo(Result) :-
#   zeroOrOne(X),
#   twoOrThree(Y),
#   Result is X + Y.
def addTwo():
    for x in zeroOrOne():
        for y in twoOrThree():
            yield x + y

# myNumber(0).
# myNumber(1).
# myNumber(2).
#
# myNumber(0).
# myNumber(1).
# myNumber(X) :-
#   (false) -> X = 7; X = 2.
def myNumber():
    print("Start")
    yield 0
    print("after 0")
    yield 1
    print("after 1")
    if False:
        yield 7
    else:
        yield 2
    print("after 2")
    print("another print")

# TODO: return in generator function

# makePair(pair(X, Y)) :-
#   myNumber(X),
#   myNumber(Y).
def makePair():
    for x in myNumber():
        for y in myNumber():
            yield (x, y)

# for pair in makePair():
#     print(pair)

# for x in addTwo():
#     print(x)

# print(next(addTwo()))

class Variable:
    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return "Variable({})".format(self.name)
    
class Call:
    def __init__(self, e1, e2):
        self.e1 = e1
        self.e2 = e2

    def __repr__(self):
        return "Call({}, {})".format(repr(self.e1), repr(self.e2))
    
def gen(depth):
    yield Variable("x")
    yield Variable("y")
    if depth > 0:
        new_depth = depth - 1
        for e1 in gen(new_depth):
            for e2 in gen(new_depth):
                yield Call(e1, e2)
                
