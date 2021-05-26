from random import choice,randint
import sys

def dna_string(length):
       DNA=""
       for count in range(length):
          DNA+=choice("CGTA")
       return DNA

def gen_read_file(num_reads, output_filename):
    f = open(output_filename, "w")
    read_length = randint(30,199) # Fixed length
    for i in range(num_reads):
        f.write(dna_string(read_length) + "\n")
    f.close()


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python read_gen.py numReads OUTPUT_FILE")
    else:
        gen_read_file(int(sys.argv[1]),sys.argv[2])
