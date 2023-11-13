%This file is the parent file from where the general functions can be
%initialized.
%The inputs are the input directory for txt files (already separated by
%python code), the desired directory where set files will be created, and
%the sampling rate.

%NOTE: in createset.m channel information files/file locations need to be
%changed depending on user. Besides this, nothing else needs to be changed.

inputDir = '/Users/joannamialkowska/Documents/MATLAB/SCCN/auditory_project/txtfiles';
setDir = '/Users/joannamialkowska/Documents/MATLAB/SCCN/auditory_project/setfiles/';
samplingrate = 1000;

importfile(inputDir,samplingrate,setDir)