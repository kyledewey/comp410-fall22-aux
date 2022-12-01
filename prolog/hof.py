def something(param):
    if param > 10:
        return "foo"
    else:
        return 7

# addWithVarArgs: List<Int> => Int

# A => B => C

# add: Int => Int => Int
# add x y = x + y
#
# (Int, Int) => Int
def add(x, y):
    return x + y

# add(1, 2): Int
# add(1): Int => Int

def addAmount(amount):
    # return lambda x: x + 3
    return lambda x: x + amount
