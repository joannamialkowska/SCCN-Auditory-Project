# Auditory-Project
SCCN, paired click auditory paradigm research


13/11/2023

Python:
1) Readrawdata.py takes the raw Neuroscan files and removes headers, and divides each file into multiple txt files where each one is a specific trial and condition (click) for each participant. The file needs to be run for the control folder and participant folder separately, then the output directory will hold both groups. The new txt files hold information on the participant number, group, trial number and condition in the file name. 

Matlab:
2) The run.m file is just a general parent file that takes input directory (the location of the newly created txt files), the desired output directory of set files, and the sampling rate of the data. It initializes the function importfile.m

3) Importfile.m reads files from the provided input directory and reads participant number, group, trial number and condition from the file name. It initializes the function createset.m. 

4) Createset.m imports the txt file into eeglab, inputting the parameters of the file, imports the channels locations based on channel number, and saves the dataset as a set file. Important note - this is the only place where in-function code needs to be changed. The file locations for channel information need to be changed on a user-basis. 
