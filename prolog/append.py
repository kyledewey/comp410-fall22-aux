def sumAll(my_list):
    if isinstance(my_list, Nil):
        return 0
    elif isinstance(my_list, Cons):
        om1 = sumAll(my_list.tail)
        return my_list.head + om1
    
def take(my_list, num_elements):
    if isinstance(my_list, Nil) or num_elements <= 0:
        return Nil()
    elif isinstance(my_list, Cons) and num_elements > 0:
        rest = take(my_list.tail, num_elements - 1)
        return Cons(my_list.head, rest)
    
def append(list1, list2):
    if isinstance(list1, Nil):
        return list2
    elif isinstance(list1, Cons):
        rest = append(list1.tail, list2)
        return Cons(list1.head, rest)
