def isPrime(value):
    divisor = value - 1

    while (divisor > 1 and
           value % divisor != 0):
        divisor -= 1

    return divisor == 1 or value == 1

    # while divisor > 1:
    #     if value % divisor == 0:
    #         return False
    #     divisor -= 1

    # return True
