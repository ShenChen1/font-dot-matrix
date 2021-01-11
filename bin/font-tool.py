#!/usr/bin/env python

import argparse
import sys
import os
import logging

def main():
    parser = argparse.ArgumentParser(prog='font-tool', usage=\
          "%(prog)s [-v] --font=xxx.ttf --size=32 --output=./ \n")
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose mode')
    args = parser.parse_args()






if __name__ == '__main__':
    main()