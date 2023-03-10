#!/usr/bin/python3

import os

from constants.constant import (
    WALK_DIR,
    FILES_AND_DIRS, 
    MODE_BINARY_READ, 
    MODE_BINARY_WRITE
)
from paths.path import (
    get_abspath, 
    join_path
)


if __name__ == '__main__':

    print('walk_dir (absolute) = ', get_abspath(WALK_DIR))

    for root, subdirs, files in os.walk(WALK_DIR):
        print('--\nroot = ' + root)

        list_file_path = join_path(root, FILES_AND_DIRS)
        print('\nGenerated listfile located in path = \n' + list_file_path)
        
        with open(list_file_path, MODE_BINARY_WRITE) as list_file:
            for subdir in subdirs:  
                print('\t- subdirectory -- ' + subdir)

            for filename in files:
                file_path = join_path(root, filename)

                print('\t- file %s (full path: %s)' % (filename, file_path))

                with open(file_path, MODE_BINARY_READ) as f:
                    f_content = f.read()
                    list_file.write(('The file %s contains:\n' % filename).encode('utf-8'))
                    list_file.write(f_content)
                    list_file.write(b'\n')

    # store global variable in this file