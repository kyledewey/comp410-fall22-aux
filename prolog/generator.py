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

def myNumber():
    yield 0
    yield 1
    yield 2

def makePair():
    for x in myNumber():
        for y in myNumber():
            yield (x, y)

for pair in makePair():
    print(pair)

# for x in addTwo():
#     print(x)

# print(next(addTwo()))
