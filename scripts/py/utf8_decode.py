#!/usr/bin/env python3

encoded_string = "灩捯䍔䙻ㄶ形楴獟楮獴㌴摟潦弸強㕤㐸㤸扽"
for i in range(len(encoded_string)):
  print(chr(ord(encoded_string[i])>>8))
  print(chr((ord(encoded_string[i]))-((ord(encoded_string[i])>>8)<<8)))
  print (i)
