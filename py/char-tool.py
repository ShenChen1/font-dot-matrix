#!/usr/bin/env python

import argparse
import bitarray
import dotmatrix
import sys
import os
import logging

def str2hex(string):
    return int(string, 16)

def main():
    parser = argparse.ArgumentParser(prog='char-tool', usage=\
          "%(prog)s [-v] --font=xxx.ttf --size=32 --output=./ \n")
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose mode')
    parser.add_argument('-d', '--debug', dest='debug', action='store_true', help='debug bitmap')
    parser.add_argument('--font', dest='font', help='font file', default='font/consola.ttf')
    parser.add_argument('--size', dest='size', type=int, help='font size', choices=range(8, 73, 8), default=32)
    parser.add_argument('--offset', dest='offset', type=int, help='font offset', default=0)
    parser.add_argument('--output', dest='output', help='output path', default='tmp')
    parser.add_argument('--code', dest='code', type=str2hex, help='unicode value', default=0x0033)
    args = parser.parse_args()

    gen = dotmatrix.dotmatrix(args.verbose)
    (image, width, height) = gen.build(args.code, args.size, args.offset, args.font)
    data = gen.bitmap(image, width, height)
    if args.debug:
        gen.show(data, width, height)

    with open(args.output, 'wb') as fd:
        fd.write(data)

if __name__ == '__main__':
    main()