#!/data/miniconda3/envs/env1/bin/python

from filelock import FileLock
import hickle
import sys
import time

# set constants
file_path = "/data/picasso/envlist.hkl"
lock_path = "/data/picasso/envlist.hkl.lock"
time_out_secs = 60

# program modes
READ_MODE = 0
WRITE_MODE = 1
RESET_MODE = 2

# get number of arguments
nargs = len(sys.argv)
if nargs > 3:
    print('Usage: envlist; envlist env; envlist envprefix nenvs')
    exit
elif nargs > 2:
    pmode = RESET_MODE
    envprefix = sys.argv[1]
    nenvs = sys.argv[2]
elif nargs > 1:
    pmode = WRITE_MODE
    env = sys.argv[1]
else:
    pmode = READ_MODE

lock = FileLock(lock_path, timeout=time_out_secs)

with lock:
    if pmode == RESET_MODE:
<<<<<<< HEAD:myenvlist.py
        # create a list (named clist) of nevns environments with the 
        # prefix envprefix
        # add code here
        clist = [envprefix + str(x) for x in range(int(nenvs))]
=======
        clist1 = [*range(0,int(nenvs),1)]
        clist = [envprefix + str(s) for s in clist1]
>>>>>>> upstream/main:envlist.py
    else:
        # load hickle file
        while i in range(int(time_out_secs/5)):
            try:
                clist = hickle.load(file_path)
                break
            except IOError or FileNotFoundError or OSError:
                time.sleep(5)
                continue

        if pmode == WRITE_MODE:
            # append item to end of list
<<<<<<< HEAD:myenvlist.py
            # add code here
            clist.append(env)
        else:
            # get and remove env from clist
            # add code here
=======
            clist.append(env)
        else:    
            # pop first item off list
            env = clist.pop(0)
>>>>>>> upstream/main:envlist.py
            # return env name
            env = clist.pop(0)
            print(env)

    # save hickle file
    hickle.dump(clist, file_path, mode="w")
