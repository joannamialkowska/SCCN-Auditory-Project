%This function takes imported txt file and imports it into eeglab, imports
%channel information and creates set files in the given set file directory.

%NOTE: channelfile locations will need to be changes based on user.

function createset( fullFileName, baseFileName, samplingrate, idnumber, group, trialnumber, trialtype, setDir)

outputFileName = baseFileName;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','ascii','nbchan',0,'data',fullFileName,'srate',samplingrate,'subject',idnumber,'pnts',0,'condition',trialtype,'xmin',0,'group',group,'session',trialnumber);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',outputFileName,'gui','off'); 

%import channel information, different file + directories for the channel info files
channelnumber = EEG.nbchan;
if channelnumber == 81
    channelfile = '';
elseif channelnumber == 62
        channelfile = '';
elseif channelnumber == 61
        channelfile = '';
elseif channelnumber == 60
        channelfile = '';
elseif channelnumber == 59
        channelfile = '';
elseif channelnumber == 58
        channelfile = '';
elseif channelnumber == 57
        channelfile = '';
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
