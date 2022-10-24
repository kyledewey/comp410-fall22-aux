# fib(0) = 1
# fib(1) = 1
# fib(n) = fib(n - 1) + fib(n - 2), for n > 1
def fib(n):
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)
    
def sumAll(my_list):
    accum = 0
    for elem in my_list:
        accum = accum + elem
    return accum

def sumAllNotTailRecursive(my_list):
    if len(my_list) == 0:
        return 0
    else:
        return my_list[0] + sumAllNotTailRecursive(my_list[1:])
    
def sumAllTailRecursiveHelper(my_list, accum):
    if len(my_list) == 0:
        return accum
    else:
        return sumAllTailRecursiveHelper(my_list[1:], accum + my_list[0])
    
def sumAllTailRecursive(my_list):
    return sumAllTailRecursiveHelper(my_list, 0)

def reverseHelper(input_list, accum):
    if len(input_list) == 0:
        return accum
    else:
        reverseHelper(input_list[1:], input_list[0] ++ accum)
