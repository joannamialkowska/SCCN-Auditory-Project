%This function takes imported txt file and imports it into eeglab, imports
%channel information and creates set files in the given set file directory.

%NOTE: channelfile locations will need to be changes based on user.

function createset( fullFileName, baseFileName, samplingrate, idnumber, group, trialnumber, trialtype, setDir)

outputFileName = baseFileName;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','ascii','nbchan',0,'data',fullFileName,'srate',samplingrate,'subject',idnumber,'pnts',0,'condition',trialtype,'xmin',0,'group',group,'session',trialnumber);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',outputFileName,'gui','off'); 

%import channel information
channelnumber = EEG.nbchan;
if channelnumber == 81
    channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Standard-10-20-Cap81.ced';
elseif channelnumber == 62
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap62ch_custom_2016_01_28_Control17.ced';
elseif channelnumber == 61
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap61ch_custom_2016_02_02_Control36.ced';
elseif channelnumber == 60
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap60ch_custom_2016_02_02_Control15.ced';
elseif channelnumber == 59
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap59ch_custom_2016_01_26_Patient1.ced.ced';
elseif channelnumber == 58
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap58ch_custom_2016_02_04_Control24.ced';
elseif channelnumber == 57
        channelfile = '/Users/joannamialkowska/Documents/MATLAB/SCCN/deepa_project/dipfit/channelnumber/Cap57ch_custom_2016_02_04_Control37.ced';
else 
    printf('Unrecognized Channel Number')
end

EEG=pop_chanedit(EEG, {'lookup',channelfile},'load',{channelfile,'filetype','autodetect'});
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);

% save as set file
setFileName = append(outputFileName,'.set');

EEG = pop_saveset( EEG, 'filename',setFileName,'filepath',setDir);
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);

end