import string

#13/10/2023
#This code is to process Neuroscan txt files and separate the data in these files into separate files for each trial and condition (click).
#Inputs are the input directory for files from Neuroscan, desired output directory, and the group (patient/control) that is being processed.

inputdir = '/Users/joannamialkowska/Documents/MATLAB/SCCN/auditory_project/rawdata/patient/'
outputdir = '/Users/joannamialkowska/Documents/MATLAB/SCCN/auditory_project/txtfiles/patient/'
group = 'patient' #or 'control'


#Reads through txt file line by line in order to remove text rows, find trial number and type, and divide txt file 
#into seperate files for each click and trial
def converttxt(inputdir,outputdir,group,idnumber):

    file = open(inputdir + str(idnumber) + '.txt', 'r')

    #trial type = click
    trialtype = 0
    trialnumber = 0

    #state = 1 found trial type, skipping rest of header
    state = int(0)

    lines = file.readlines()
    for row in lines:
        match state:
            case 0:
                cols = row.split('\t')
                #print ('=' + str(cols[0]) + '=')
                if cols[0] != '[Trial Type]': 
                    continue
                #print ('=' + str(cols[1]) + '=')
                if  '1' in cols[1]:
                    trialtype = 1
                    trialnumber += 1
                else:
                    trialtype = 2
                #print('===' + str(trialnumber))
                #print(trialtype)
                state = 1
            case 1:
                cols = row.split('\t')
                if '[' in cols[0]:
                    continue
                #print(str(trialtype) +'xx'+ str(trialnumber))
                state = 2
                sample = 1
                outputfile = open(outputdir + str(idnumber) + '_' + group + '_' + str(trialnumber) + '_' + str(trialtype) + '.txt', 'w')
                outputfile.write(row)
            case 2:
                sample += 1
                outputfile.write(row)
                if sample == 500:
                    outputfile.close()
                    state = 0
                    continue
                

import os

#Runs function to separate out the txt file for every file in folder
def run(inputdir,outputdir,group):
    for filename in os.listdir(inputdir):
        if filename.endswith('.txt'):
            idnumber = filename.replace('.txt','')
            converttxt(inputdir,outputdir,group,idnumber)


#Inputs are the input directory for files from Neuroscan, desired output directory, and the group (patient/control) that is being processed
run(inputdir,outputdir,group)