import os
import sys


if __name__ == '__main__':
    a = os.system("pw")
    print(a)
    if(a != 0):
        sys.exit(1)

    b = os.system("pwd")
    print(b)