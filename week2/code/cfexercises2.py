def hello_1(x):
    for j in range(x):
        if j % 3 == 0:
            print('Hello!')
    print(' ')
hello_1(12)

def hello_2(x):
    for j in range(x):
        if j % 5 == 3:
            print('Hello')
        elif j % 4 == 3:
            print('Hello')
    print(' ')
hello_2(12)

def hello_3(x, y):
    for i in range(x, y):
        print('Hello')
hello_3(3, 17)

def hello_4(x):
    while x != 15:
        print('Hello')
        x = x + 3
    print(' ')
hello_4(0)

def hello_5(x):
    while x < 100:
        if x == 31:
            for k in range(7):
                print('Hello')
        elif x == 18:
            print('Hello')
        x = x + 1
    print(' ')
hello_5(12)

def hello_6(x, y):
    while x:
        print("Hello" + str(y))
        y += 1
        if y == 6:
            break
    print(' ')
hello_6(True, 0)    
