import random
from time import sleep

lower = "abcdefghijklmnopqrstuvwxyz"
upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers = "0123456789"
symbols = "{}[]#@;*_-."

all = lower + upper + numbers + symbols
lenth = 20
password = "".join(random.sample(all, lenth))

with open("pass_out.txt", "w") as text_file:
    text_file.write(password)