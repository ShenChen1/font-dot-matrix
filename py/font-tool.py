#!/usr/bin/env python
import xml.etree.ElementTree as ET
import argparse
import dotmatrix
import struct
import tempfile
import sys
import os
import logging

def main():
    parser = argparse.ArgumentParser(prog='font-tool', usage=\
          "%(prog)s [-v] --config=xxx.xml --output=./ \n")
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose mode')
    parser.add_argument('-d', '--debug', dest='debug', action='store_true', help='debug bitmap')
    parser.add_argument('--config', dest='config', help='config path', default='config/default.xml')
    parser.add_argument('--output', dest='output', help='output path', default='default.font')
    args = parser.parse_args()

    # total number
    total = 0
    location = 0
    # create charinfo
    charinfo = tempfile.TemporaryFile()
    # create chardata
    chardata = tempfile.TemporaryFile()

    root = ET.parse(args.config).getroot()
    for entry in root:
        name = entry.get('name')
        start = entry.get('start')
        end = entry.get('end')
        font = 'font/' + entry.find('font').text
        size = int(entry.find('size').text)
        offset = int(entry.find('offset').text)

        print(name, start, end, font, size, offset)

        for code in range(int(start, 16), int(end, 16) + 1):

            gen = dotmatrix.dotmatrix(args.verbose)
            (image, width, height) = gen.build(code, size, offset, font)
            bitmap = gen.bitmap(image, width, height)
            if args.debug:
                gen.show(bitmap, width, height)

            # append font_char_hdr_t
            data = struct.pack("<BBII", width, height, code, location)
            charinfo.write(data)

            # append font_char_data_t
            chardata.write(bitmap)

            total += 1
            location += len(bitmap)

    # create font_file_hdr_t
    version = 1
    endian = 0
    with open(args.output, 'wb') as fd:
        data = struct.pack("<BBI", version, endian, total)
        fd.write(data)

        charinfo.seek(0, 0)
        fd.write(charinfo.read())

        chardata.seek(0, 0)
        fd.write(chardata.read())

    charinfo.close()
    chardata.close()

if __name__ == '__main__':
    main()