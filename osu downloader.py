import urllib.request
import os
import sys

# Main download link
url = 'http://bloodcat.com/osu/m/'
# Get text file name from the system argument
text_file = sys.argv[1]+'.txt'
#  Open File
file = open(text_file, 'r')
# For each ID
for x in file:
    # Finalized Download link
    down = url+x
    # File Type
    file_type = '.osz'
    # Get file name based on the beatmapID
    file_name = x.replace('\n','')+file_type
    # Printing for debugging
    print(file_name)
    print(down)
    # Download the beatmap
    urllib.request.urlretrieve(down, file_name)
    # Run downloaded file
    os.system(file_name)
