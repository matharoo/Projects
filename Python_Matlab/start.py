#!/usr/bin/python
'''Author: Rupinder Singh Matharoo
#Date: Nov 15,2013
'''
import numpy as np
import matplotlib.pyplot as plt
from sqlite3.dbapi2 import Binary


# Open a file
fo = open("test_file.txt", "r")
print "Name of the file: ", fo.name
content = fo.read()
print content
binaryform = ''.join(format(ord(x), 'b') for x in content)
print "Binary Waveform:"
print binaryform
print "length of binary form:", len(binaryform)
nrzform = binaryform.replace('1','|').replace('0','_')
print "NRZ Waveform:"
print nrzform
print "length of NRZ form:", len(nrzform)
transitions_nrz= nrzform.count('|_') + nrzform.count('_|')
print "Number of Transitions in NRZ: ", transitions_nrz
manchesterform = binaryform.replace('0','_1-').replace('1','-|_')
print "Manchester Waveform:"
print manchesterform
print "length of Manchester form:", len(manchesterform)
transitions_mnc= manchesterform.count('_|') + manchesterform.count('|_')
print "Number of Transitions in Manchester: ", transitions_mnc
# Close opend file
fo.close()

            
#converting binaryform array and copying to other array 
binaryform = map(int, binaryform)
bits =[]
i=0
while (i < 30):
    temp= binaryform[i]
    bits.append(temp)
    i = i + 1
    
print "Plotting NRZ and Manchester Waveform.."
#Drawing graph using Pyplot    
#drawing lines...
def my_lines(ax, pos, *args, **kwargs):
    if ax == 'x':
        for p in pos:
            plt.axvline(p, *args, **kwargs)
    else:
        for p in pos:
            plt.axhline(p, *args, **kwargs)

data = np.repeat(bits, 2)
clock = 1 - np.arange(len(data)) % 2
manchester = 1 - np.logical_xor(clock, data)
t = 0.5 * np.arange(len(data))

plt.hold(True)
my_lines('x', range(30), color='.5', linewidth=2)
my_lines('y', [0.5, 2, 4], color='.5', linewidth=2)
plt.step(t, data + 2, 'r', linewidth = 2, where='post')
plt.step(t, manchester, 'r', linewidth = 2, where='post')
plt.ylim([-1,4])

for tbit, bit in enumerate(bits):
    plt.text(tbit + 0.5, 1.5, str(bit))
    
plt.title("NRZ and Manchester Waveform")
plt.gca().axis('off')
plt.show()