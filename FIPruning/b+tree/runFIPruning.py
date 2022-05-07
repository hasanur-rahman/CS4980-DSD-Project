import os, sys, subprocess

inputArgs = str(sys.argv[1])
bmName = str(sys.argv[2])

###############
LLVM_SO_FILE = os.path.join(os.path.expanduser("~"), "llvm-3.4/Release/lib/LLVMOptFIPruning.so")

os.system("mkdir Result")
os.system("rm Result/*")

#exec_list = ["opt", "-S", "-load", LLVM_SO_FILE, "-prune_fi", "Input/" + bmName + "-llfi_index.ll", "-o", "final_program.ll", "2>\"Result/pruning_pass.log\""]
#print(exec_list)

#def createNewSubprocess(execlist, isShell=False):
#	return subprocess.Popen(execlist, shell=isShell, stdout=subprocess.PIPE)

#fi_pruning_proc = createNewSubprocess(exec_list)
OPT_BIN = os.path.join(os.path.expanduser("~"), "llvm-3.4/Release/bin/opt")
os.system(OPT_BIN + " -S -load " + LLVM_SO_FILE + " -prune_fi_space Input/" + bmName + "-llfi_index.ll -o final_program.ll 2> \"Result/pruning_pass.log\"")

#log_file = open("Result/pruning_pass.log", "a")

#while True:
#	line = fi_pruning_proc.stdout.readline()
#	if not line:
#		break
	
#	log_file.write("%s\n"%(line.decode().strip()))


#log_file.close()

os.system("./datagen " + inputArgs)
os.system("lli final_program.ll file mil.txt command command.txt")
os.system("rm -f final_program.ll mil.txt command.txt output.txt")
