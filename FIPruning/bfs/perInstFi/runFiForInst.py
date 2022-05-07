import os, sys
import subprocess
import time

###############################
bmName = sys.argv[1]
theInput = sys.argv[2]
noOfThreads = int(sys.argv[3])
###############################

# Read input list
instList = open('inst_list.txt', 'r').readlines()

jobQ = []
for eachInst in instList:
	if eachInst != "\n":
		
		# Launch FI for the inst
		eachInst = eachInst.replace("\n", "")
		instFolderName = bmName + "-" + eachInst
		os.system("cp -r base " + instFolderName)
		os.chdir(instFolderName)
		# Replace XXXX in input.yaml with inst index
		inf = open("input.yaml", 'r') 
		newInp = inf.read().replace("XXXX", eachInst)
		outf = open("input.yaml", 'w')
		outf.write(newInp)
		inf.close()
		outf.close()
		p = subprocess.Popen(["python", "runFi.py", bmName, theInput])
		jobQ.append(p)			
		os.chdir("../")


		# Check if there is empty slot
		print("******************* JOB Q SIZE: " + str(len(jobQ)) + "**********************\n")
		while len(jobQ) >= noOfThreads:
			time.sleep(1)
			for eachP in jobQ:
				if eachP.poll() is not None: # the job finishes
					jobQ.remove(eachP)
