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
        (w, h) = (w, size)
        image = Image.new("1", (w, h), (1))
        # get a drawing context
        draw = ImageDraw.Draw(image)
        # draw text
        draw.text((w // 2, h - offset), chr(code), font=ttf, fill=(0), anchor="md")

        return (image, w, h)

    def show(self, image, width, height):
        bitmap = bitarray.bitarray()
        bitmap.frombytes(image)
        for y in range(height):
            for x in range(width):
                if bitmap[y * width + x]:
                    print('0', end='')
                else:
                    print('.', end='')
            else:
                print()

    def bitmap(self, image, width, height):
        pixel = image.load()
        bitmap = bitarray.bitarray()
        for h in range(height):
            for w in range(width):
                bitmap.append(not pixel[w, h])

        return bitmap.tobytes()