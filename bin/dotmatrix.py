#!/usr/bin/env python

from PIL import Image, ImageDraw, ImageFont
import argparse
import bitarray
import sys
import os
import logging

class dotmatrix:
    def __init__(self, verbose):
        level = logging.ERROR if verbose == False else logging.DEBUG
        format = "[%(levelname)s]: %(message)s"
        logging.basicConfig(level=level, format=format)

    def build(self, code, size, offset, font):
        logging.debug('code={0} size={1} font={2}'.format(hex(code), size, font))
        # get a font
        ttf = ImageFont.truetype(font, size)
        # get char size
        (w, h) = ttf.getsize(chr(code))
        # make a blank image for the text
        (w, h) = (w * size // h, size)
        image = Image.new("1", (w, h), (1))
        # get a drawing context
        draw = ImageDraw.Draw(image)
        # draw text
        draw.text((w // 2, h // 2 + offset), chr(code), font=ttf, fill=(0), anchor="mm")

        return (image, w, h)

    def show(self, image, width, height):
        bitmap = bitarray.bitarray()
        bitmap.frombytes(image)
        for y in range(height):
            for x in range(width):
                if bitmap[y * width + x]:
                    os.system('echo -n 0')
                else:
                    os.system('echo -n .')
            else:
                os.system('echo')

    def bitmap(self, image, width, height):
        pixel = image.load()
        bitmap = bitarray.bitarray()
        for h in range(height):
            for w in range(width):
                bitmap.append(not pixel[w, h])

        return bitmap.tobytes()

def str2hex(string):
    return int(string, 16)

def main():
    parser = argparse.ArgumentParser(prog='dotmatrix', usage=\
          "%(prog)s [-v] --font=xxx.ttf --size=32 --output=./ \n")
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose mode')
    parser.add_argument('-d', '--debug', dest='debug', action='store_true', help='debug bitmap')
    parser.add_argument('--font', dest='font', help='font file', default='font/consola.ttf')
    parser.add_argument('--size', dest='size', type=int, help='font size', choices=range(8, 73, 8), default=32)
    parser.add_argument('--offset', dest='offset', type=int, help='font offset', default=0)
    parser.add_argument('--output', dest='output', help='output path', default='tmp')
    parser.add_argument('--code', dest='code', type=str2hex, help='unicode value', default=0x0033)
    args = parser.parse_args()

    gen = dotmatrix(args.verbose)
    (image, width, height) = gen.build(args.code, args.size, args.offset, args.font)
    data = gen.bitmap(image, width, height)
    if args.debug:
        gen.show(data, width, height)

    with open(args.output, 'wb') as fd:
        fd.write(data)

if __name__ == '__main__':
    main()