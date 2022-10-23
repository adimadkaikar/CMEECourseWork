# Open a file handle for ../sandbox/test.txt
f = open('../sandbox/test.txt', 'r')
for line in f:
    print(line)

f.close()

f = open('../sandbox/test.txt', 'r')

for line in f:
    if len(line.strip()) > 0:
        print(line)

f.close()

with open('../sandbox/test.txt', 'r') as f:
    for line in f:
        print(line)

with open('../sandbox/test.txt', 'r') as f:
    for line in f:
        if len(line.strip()) > 0:
            print(line)
