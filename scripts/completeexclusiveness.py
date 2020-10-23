#!/usr/bin/env python3

# To run this script you should first set up the environment for numpy
# Use the following commands:
# python3 -m venv work
# source work/bin/activate

# Directions to run the program
# parameters:
# 1: Directory of the project: /subsumption-experiment/subsumption-data/<projectid>

# The json files should be in the  directory /subsumption-experiment/subsumption-data/<projectid>/reduce

import numpy as np
import json
import os
#import progressbar
import sys
import xml.etree.ElementTree as ET

def createSubDic(sub_folder):
	subdir = {}
	listsub =  os.listdir(sub_folder)
	for f in listsub:
		if ".sub.json" in f:
			subf=sub_folder + os.sep + f
			subdir[f] = subf
	return subdir

def line_to_array(line):
	line = line[:-2].split()
	a = np.array(list(map(lambda x: int(x), line)))
	return a

def create_array_zeros(size):
	#list = []
	#it = range(int(size))
	#for i in it:
	#	list.append(0)
	#a = np.array(list)
	a = np.zeros((int(size),),dtype=int)
	return a

def create_array_ones(size):
	#list = []
	#it = range(int(size))
	#for i in it:
	#	list.append(1)
	#a = np.array(list)
	a = np.ones((int(size),),dtype=int)
	return a

def set_elements_array(a,l):
	for i in l:
		a[i] = 1
	return a

def reset_elements_array(a,l):
	for i in l:
		a[i] = 0
	return a

if __name__ == '__main__':

	subsumption_dir = sys.argv[1]

	total = None
	print("Directory of subsumption data: %s" % subsumption_dir)


	subsumption_folder = os.path.join(subsumption_dir, "reduce")

	#print(subsumption_folder)
	subsumption_dic = createSubDic(subsumption_folder)
	#print (subsumption_dic)
	for s in subsumption_dic:
		#print(subsumption_dic[s])

		subsumption_file = subsumption_dic[s]
		dic_class = {}
		dic_class_arrays = {}
		methods_name = {}
		methods_noDuas = {}
		if os.path.exists(subsumption_file):
			with open(subsumption_file) as read_file:
				data = json.load(read_file)
				cl = data['Class']
				#print(cl)
				methods = data['Methods']
				counter = 0
				for m in methods:
					name = m['Name']
					noDuas = m['Duas']

					#print(name+':'+noDuas)
					#print(methods_noDuas)
					noSubsumers = m['Subsumers']
					itSubsumers = range(int(noSubsumers))

					dic_subsumption = {}
					dic_subsumption_array = {}
					for subsumer_key in itSubsumers:
							subsumers_list = m[str(subsumer_key)]
							subsumers_array = set_elements_array(create_array_zeros(noDuas),subsumers_list)

							subsuming_key = 'S'+str(subsumer_key)
							subsuming_list = m[subsuming_key]
							subsuming_array = set_elements_array(create_array_zeros(noDuas),subsuming_list)

							list_subsumption = []
							list_subsumption.append(subsumers_list)
							list_subsumption.append(subsuming_list)

							list_subsumption_array = []
							list_subsumption_array.append(subsumers_array)
							list_subsumption_array.append(subsuming_array)

							dic_subsumption[subsumer_key] = list_subsumption
							dic_subsumption_array[subsumer_key] = list_subsumption_array
					#print(name)
					#print(dic_subsumption)
					#print(dic_subsumption_array)
					methods_name [counter] = name
					methods_noDuas[counter] = int(noDuas)
					dic_class[counter] = dic_subsumption
					dic_class_arrays[counter] = dic_subsumption_array
					counter = counter+1

		else:
			print('Could not open the file')

		print('>>>>>'+cl)
		for m in methods_noDuas:
			print("%s:%s:%s" %(m, methods_name[m],methods_noDuas[m]))

			if len(dic_class_arrays[m]) == 0:
			#print("%s:%s:%s" %(m, methods_name[m],methods_noDuas[m]))
				continue
			name = methods_name[m]
			allu = create_array_zeros(methods_noDuas[m])
			allss = create_array_zeros(methods_noDuas[m])
			exuc = create_array_ones(methods_noDuas[m])
		    #print("alluc : %s" %alluc)
			for leave in dic_class_arrays[m]:
			  #print(dic_class_arrays[m][leave])
			  u = dic_class_arrays[m][leave][0]
			  s = dic_class_arrays[m][leave][1]
			  allss |= s
			  #print(s)
			  #print(allss)
			  exuc &= u

			if np.sum(exuc,dtype=int) != 0:
				if len(dic_class_arrays[m]) != 1:
					print("Unconstrained leaves are not mutually exclusive for testcase %s of %s: %s: %s" %(t, name,testmethod,exuc))
					print (dic_class_arrays[m])
					for leave in dic_class_arrays[m]:
						print(dic_class_arrays[m][leave][0])
			if np.sum(allss,dtype=int) != int(methods_noDuas[m]):
				print("Subsumption is not covering all duas for %s:" %(name))
				for leave in dic_class_arrays[m]:
					print(dic_class_arrays[m][leave][0])
					print(dic_class_arrays[m][leave][1])
				print(allss)

			   	   #print(dic_class_arrays[m][leave][1])
			   	   #print(exuc)
#	print("Total DUAs: %s, Covered DUAs: %s" % (total_duas, covered_duas))

	# n_files = len([name for name in os.listdir(matrix_folder)])

	# total_duas = 0
	# covered_duas = 0
	# i = 0;

	# bar = progressbar.ProgressBar(maxval=n_files)
	# bar.start()

	# for file in os.listdir(matrix_folder):
	# 	total = None

	# 	i += 1
	# 	j = 0
	# 	with open(os.path.join(matrix_folder, file), "r") as f:
	# 		for line in f:
	# 			j += 1
	# 			if line.startswith("=0"): continue

	# 			a = line_to_array(line)
	# 			if total is None:
	# 				total = a
	# 			else:
	# 				total |= a

	# 	if total is None: continue

	# 	total_duas += total.size
	# 	covered_duas += np.count_nonzero(total)

		# bar.update(i)

	# bar.finish()
	# print("Total files: %s" % i)
	# print("Total DUAs: %s, Covered DUAs: %s" % (total_duas, covered_duas))
