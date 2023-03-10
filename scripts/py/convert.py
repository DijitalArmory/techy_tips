
#!/usr/bin/python3

# convert binary to decimal


import sys

x = sys.argv[1]

b = bin(int(x, 2))

h = hex(int(b, 2))

d = int(h, 16)

a = chr(d)
print('', a, '')
