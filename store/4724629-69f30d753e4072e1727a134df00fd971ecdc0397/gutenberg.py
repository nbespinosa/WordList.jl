# After generating HTML for .txt versions (see with http://www.gutenberg.org/wiki/Gutenberg%3aInformation_About_Robot_Access_to_our_Pages#How_to_Get_Certain_Ebook_files)

import urllib2
import re
import os
import sys


def download(filename, f):

    links = re.findall(r'"http.+.zip"', f.read())
    print(filename)

    for link in links:
        try:
            request = urllib2.urlopen(link[1:-1])
            file_name = re.findall(r'[^/]+.zip', link)[0]
            output = open(file_name, 'w+')
            output.write(request.read())
            output.close()
            print('Successfully created %s.' % file_name)
        except urllib2.HTTPError, e:
            if e.code == 404:
                print('We failed with error code - %s.' % e.code)
                continue

    print('Successfully finished %s' % filename)
    os.remove(filename)


if __name__ == '__main__':
    for filename in sys.argv[1:]:
        with open(filename) as f:
            download(filename, f)