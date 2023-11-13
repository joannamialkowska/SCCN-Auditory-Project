%This function imports txt files (already separated by python) into eeglab.
%File and participant information is read off from the file name.
%The function then initialized the createset.m function.

function importfile(inputDir,samplingrate,setDir)
%countt = 0;

myFiles = dir(fullfile(inputDir,'*.txt')); %gets all txt files in struct
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(inputDir, baseFileName);
  %fprintf(1, 'Now reading %s\n', fullFileName);
  num = importdata(fullFileName);   %or readtable
  % all of your actions for filtering and plotting go here
  matrix = split(baseFileName, "_");
  idnumber = matrix(1,1);
  group = matrix(2,1);
  trialnumber = matrix(3,1);
  trialtype = matrix(4,1);
  createset(fullFileName, baseFileName, samplingrate, idnumber, group, trialnumber, trialtype, setDir)

  %testing for only a few files
  %countt = countt + 1;
  %if countt == 2
  %    break
  %end

end
end


