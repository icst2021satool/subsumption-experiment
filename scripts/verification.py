#!/usr/bin/env python3

# To run this script you should first set up the environment for numpy
# Use the following commands:
# python3 -m venv work
# source work/bin/activate


# Directions to run the program
# parameters:

# 1: Jaguar data sirectory of the project: ../jaguar-data/<projectname>/<version>
# 2: Subsumption data directory of the project: ../subsumption-experiment/subsumption-data/<projectid>
# 3: Class name: name of the class whose data will be checked.

# Observations:
# Note that <projectid> != <projectname>. Use <projectid> and <projectname> as defined in the defects4j repository
# The json files should be in the  directory ../subsumption-data/<projectid>/reduce
# The matrix files should be in the directory ../jaguar-data/<projectname>/<version>/jaguar/.jaguar/matrix/
# This script also checks the Subsumption, Completeness, and Mutual Exclusiveness properties of the classe.

import numpy as np
import json
import os
#import progressbar
import sys
import xml.etree.ElementTree as ET

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
	#project_name = sys.argv[1]
	#version_name = sys.argv[2]

	jaguar_dir = sys.argv[1]
	subsumption_dir = sys.argv[2]
	print("Directory of jaguar data: %s" % jaguar_dir)
	print("Directory of subsumption data: %s" % subsumption_dir)

	clazz = sys.argv[3]
	total = None
	print("Analyzing class %s " % clazz)

	matrix_folder = os.path.join(jaguar_dir, "jaguar", ".jaguar", "matrix")

	print (matrix_folder)
	matrix_file = clazz + ".matrix"
	print(matrix_file)
	testcases = {}
	testcounter = 0
	with open(os.path.join(matrix_folder, matrix_file), "r") as f:
		for line in f:
			if line.startswith("=0"): continue
			else:
				a = line_to_array(line)

			if np.sum(a,dtype=int) == 0:
				continue
			testcases[testcounter] = a
			testcounter = testcounter + 1

	subsumption_folder = os.path.join(subsumption_dir, "reduce")
	subsumption_file = subsumption_folder + '/' + clazz + ".sub.json"

	print(subsumption_file)
	dic_class = {}
	dic_class_arrays = {}
	methods_name = {}
	methods_noDuas = {}
	if os.path.exists(subsumption_file):
		with open(subsumption_file) as read_file:
			data = json.load(read_file)
			cl = data['Class']
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

	dic_miss_unconstraint = {}
	dic_miss_all_unconstraint = {}
	dic_miss_path = {}
	dic_methods_exec = {}

	print(">>>>> %s <<<<<" % clazz )

	for m in methods_noDuas:
		print("%s:%s:%s" %(m, methods_name[m],methods_noDuas[m]))

	for t in testcases:
	  	#print(testcases[t])
		testcase = testcases[t].copy()
		start = 0

		for m in methods_noDuas:
			name = methods_name[m]
			offset = start + int(methods_noDuas[m])
	    	#print("%s:%s:%s:%s" % (methods_name[m], start,methods_noDuas[m],offset))
			testmethod = testcase[start:offset]
			start = offset
			if len(dic_class_arrays[m]) == 0:
				#print("%s:%s:%s" %(m, methods_name[m],methods_noDuas[m]))
				continue

			if np.sum(testmethod,dtype=int) == 0: continue
			else:
				if not name in dic_methods_exec:
					dic_methods_exec[name] = True
			alluc = create_array_zeros(methods_noDuas[m])
			allu = create_array_zeros(methods_noDuas[m])
			allss = create_array_zeros(methods_noDuas[m])
			exuc = create_array_ones(methods_noDuas[m])
	    	#print("alluc : %s" %alluc)
			for leave in dic_class_arrays[m]:
	      		#print(dic_class_arrays[m][leave])
				u = dic_class_arrays[m][leave][0]
				s = dic_class_arrays[m][leave][1]
				uc = testmethod & u
	      		#print("uc %s" %uc)
				alluc |= uc
				allss |= s
				exuc &= u
				allu |= u
				if 1 in uc:
					sc = testmethod & s
					sc = np.bitwise_xor(s,sc)
					if np.sum(sc,dtype=int) != 0:
						print("Wrong subsumption: %s" % name)
						print("t:%s" % testmethod)
						print("u:%s" % u)
						print("s:%s" % s)

	    	#print("alluc : %s" %alluc)
			if np.sum(alluc,dtype=int) == 0:

				print("No unconstrained duas covered in testcase %s of %s: %s: %s" %(t, name,testmethod,allu))
				if name in dic_miss_unconstraint:
					if not np.array_equal(testmethod,dic_miss_path[name]):
						dic_miss_unconstraint[name] = int(dic_miss_unconstraint[name]) + 1
						dic_miss_path[name] = testmethod
					dic_miss_all_unconstraint[name] = int(dic_miss_all_unconstraint[name]) + 1
				else:
					dic_miss_unconstraint[name] = 1
					dic_miss_path[name] = testmethod
					dic_miss_all_unconstraint[name] = 1

				for leave in dic_class_arrays[m]:
					print(dic_class_arrays[m][leave][0])
					print(dic_class_arrays[m][leave][1])

			if np.sum(allss,dtype=int) != int(methods_noDuas[m]):
				print("Subsumption is not covering all duas for testcase %s of %s: %s" %(t, name,testmethod))
				for leave in dic_class_arrays[m]:
					print(dic_class_arrays[m][leave][0])
					print(dic_class_arrays[m][leave][1])
					print(allss)

				if np.sum(exuc,dtype=int) != 0:
					if len(dic_class_arrays[m]) == 1: continue
					print("Unconstrained leaves are not mutually exclusive for testcase %s of %s: %s: %s" %(t, name,testmethod,exuc))
					#print (dic_class_arrays[m])
					for leave in dic_class_arrays[m]:
						print(dic_class_arrays[m][leave][0])

			   	   #print(dic_class_arrays[m][leave][1])
			   	   #print(exuc)
	print("Total :%s: tests for class:%s:" % (testcounter, clazz))
	print("Methods executed: %s" % (len(dic_methods_exec)))
	for m in dic_miss_unconstraint:
		print('Unconstrained method :'+m+':'+str(dic_miss_unconstraint[m])+':'+str(dic_miss_all_unconstraint[m]))
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
