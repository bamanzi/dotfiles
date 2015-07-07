#!/usr/bin/env python
"""
File: ion.py
Author: Rinat F Sabitov
Email: rinat.sabitov@gmail.com
Description: simple library that provides access to DESCRIPT.ION files
"""

import os.path
import StringIO

DESCRIPTION_FILE = 'descript.ion'


def is_description_file(filename):
    return (os.path.isfile(filename)
        and os.path.basename(filename).lower() == DESCRIPTION_FILE)


def _get_description_filename(target_file):
    descript_path = os.path.dirname(os.path.abspath(target_file))
    try:
        result, = [dfile for dfile in os.listdir(descript_path)
            if is_description_file(dfile)]
    except ValueError:
        result = os.path.join(descript_path, DESCRIPTION_FILE)
    return result


def load_description_file(filename):
    import shlex
    result = {}
    if os.path.isfile(filename):
        with open(filename, 'r') as descript_file:
            for line in descript_file:
                #lexer = shlex.shlex(line)
                #key = lexer.get_token().strip('"')
                parts = shlex.split(line)
                if len(parts)>1:
                    key = parts[0]
                    value = ' '.join(parts[1:])
                    result[key] = value
    return result


def save_description_file(filename, desc):
    with open(filename, 'w') as descript_file:
        for k, v in desc.items():
            if ' ' in k:
                k = '"' + k + '"'
            line = "%s %s\r\n" % (k, v)
            descript_file.write(line)


def dumps(target_file, description):
    description_filename = _get_description_filename(target_file)
    desc = load_description_file(description_filename)
    desc[os.path.basename(target_file)] = description
    save_description_file(description_filename, desc)


def loads(target_file):
    description_filename = _get_description_filename(target_file)
    desc = load_description_file(description_filename)
    return desc.get(os.path.basename(target_file))


class Description(object):

    def __init__(self, target_file, *args, **kwargs):
        self.target_file = target_file
        self._file = StringIO.StringIO()
        self._file.write(loads(target_file))

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    def close(self, *args, **kwargs):
        return self._file.close()

    def read(self, *args, **kwargs):
        self._file.seek(0)
        return self._file.read(*args, **kwargs)

    def write(self, *args, **kwargs):
        result = self._file.write(*args, **kwargs)
        self._file.seek(0)
        dumps(self.target_file, self._file.read())
        return result


def dopen(target_file, *args, **kwargs):
    return Description(target_file, *args, **kwargs)


if __name__ == '__main__':
    import sys
    if len(sys.argv)>2:
        # write description
        target_file = sys.argv[1]
        description = ' '.join(sys.argv[2:])
        dumps(target_file, description)
    elif len(sys.argv)>1:
        target_file = sys.argv[1]
        if os.path.isdir(target_file):
            from glob import glob
            files = glob(os.path.join(target_file, "*"))
            desc_file = _get_description_filename(os.path.join(target_file, DESCRIPTION_FILE))
            desc = load_description_file(desc_file)
            for f in files:
                b = os.path.basename(f)
                print "%s\t%s" % (b, desc.get(b, ''))
        elif os.path.isfile(target_file):
            print "%s\t%s" % (os.path.basename(target_file), loads(target_file))
        else:
            raise "No such file: %s" % target_file
    else:
        print "Usage: ion filename                # show description for file"
        print "       ion dir                     # show description for all files in dir"
        print "       ion filename description... # write description for file"
