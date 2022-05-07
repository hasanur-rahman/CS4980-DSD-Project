import os, sys

bmName = sys.argv[1]
progInput = sys.argv[2]
os.system("./graphgen "+progInput)
os.system("instrument --readable " + bmName + ".ll -lm")
os.system("profile llfi/" + bmName + "-profiling.exe graph" + progInput+".txt")
fiString = "injectfault llfi/" + bmName + "-faultinjection.exe graph" + progInput+".txt"
print("Run FI with this command: " + fiString)
print(fiString)
os.system(fiString)
os.system("rm -rf graph"+progInput+".txt")
