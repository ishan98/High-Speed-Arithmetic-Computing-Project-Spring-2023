import numpy as np 

n = 25
k = 12
r = 32
trunc_bits = 2*n - r

#f = open("./project_1/project_1.sim/sim_1/behav/xsim/op_x.txt", "r")
#g = open("output.txt", "w")

ideal = []
trunc = []

with open('./project_1/project_1.sim/sim_1/behav/xsim/op_x.txt') as f:
    for line in f:
        data = line.split()
        ideal.append(int(data[2]))
        trunc.append(int(data[3]))

file_name = "resultVCT_" + str(n) + "_" + str(k) + "_" + str(r) + ".txt"

# open both files
with open('./project_1/project_1.sim/sim_1/behav/xsim/op_x.txt','r') as firstfile, open(file_name,'a') as secondfile:
    # read content from first file
    for line in firstfile:
        # append content to second file
        secondfile.write(line)

ideal_array = np.array(ideal)
trunc_array = np.array(trunc)
error_array = np.abs(np.subtract(np.round(ideal_array/2.0**trunc_bits),  trunc_array))

error_mean = np.mean(error_array)
error_std = np.std(error_array)
error_max  = np.max(error_array)

print(error_mean)	
print(error_std)
print(error_max)	
