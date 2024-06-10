#!/bin/python3

import os,sys

search_path = ""
header_dir = []

def iterDir(path):
    for r in  os.listdir(path):
        current = os.path.join(path,r)
        if r[0] == '.':
            continue
        elif os.path.isdir(current):
            iterDir(current)
        elif os.path.isfile(current) and '.h' in current:
            dir = os.path.dirname(current) 
            if dir not in header_dir:
                header_dir.append(dir)

def writeHeader(path):
    write_file  = os.path.join(path,'.header.config')
    if os.path.exists(write_file):
        os.remove(write_file)
    with open(write_file,'w+')as f:
        for dir in header_dir:
            f.write(dir+'\n')
    print("Write to {}".format(write_file))



def main(argv):
    if len(argv) == 1:
        search_path = '.'
    else:
        search_path = argv[1]
    iterDir(search_path)
    writeHeader(search_path)


if __name__ == '__main__':
    main(sys.argv)
