#!/usr/bin/env python
import xml.etree.ElementTree as ET
import argparse
import struct
import subprocess
import tempfile
import sys
import os
import logging

def main():
    parser = argparse.ArgumentParser(prog='font-tool', usage=\
          "%(prog)s [-v] --config=xxx.xml --output=./ \n")
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose mode')
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
            tmpdata = '/tmp/tmp.data'
            cmd = 'python3 ./bin/dotmatrix.py --font {0} --size {1} --offset {2} --code {3} --output={4}'.format(font, size, offset, str(hex(code)), tmpdata)
            proc = subprocess.Popen(cmd, shell=True)
            result = proc.communicate()
            if proc.returncode:
                raise AssertionError(cmd)

            # append font_char_hdr_t
            width = 8 * os.path.getsize(tmpdata) // size
            height = size
            data = struct.pack("<BBHI", width, height, code, location)
            charinfo.write(data)

            # append font_char_data_t
            with open(tmpdata, 'rb') as fd:
                chardata.write(fd.read())

            total += 1
            location += os.path.getsize(tmpdata)

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