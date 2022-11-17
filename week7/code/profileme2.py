import numpy as np
def my_squares(iters):
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    out = ""
    for i in range(iters):
        out += ", " + string
    return out

def my_squares_np(iters):
    a = np.arange(iters)
    out = np.square(a)
    return out

def my_squares_np_l(iters):
    out = np.zeros(iters)
    for i in range(iters):
        out[i] = i ** 2
    return out

def run_my_funcs(x, y):
    print(x, y)
    my_squares(x)
    my_join(x, y)
    my_squares_np(x)
    my_squares_np_l(x)
    return 0

run_my_funcs(10000000,"My string")

