#!/usr/bin/python
# -*- coding: utf-8 -*-

import numpy as np
from PIL import Image
import sys
  
def read_file(input_filename):
    f = open(input_filename,"r")
    arr = np.array([], np.uint8)
    num_rows = int(f.readline())
    num_columns = int(f.readline())
    arr.resize((num_rows,num_columns))
    for i in range(0,num_rows):
        row = f.readline()
        pixels = row.split()
        for k in range(0,num_columns):
            arr[i][k] = pixels[k]
    return arr
    
def show_image(filename):
    arr = read_file(filename)
    out_filename = filename[0:-4] + "_out.jpg"
    im = Image.fromarray(arr)
    print("The image is saved as " + out_filename)
    im.save(out_filename)      
    
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python show_image.py YOUR_INPUT_FILE.txt")
    else:
        print("Input is " + sys.argv[1])
        show_image(sys.argv[1])
    