% Automatic Chord Estimation
% A ''bass centric + gestalt'' approach

% ********************************************************** %
% ********************* Batch Input ************************ %
% ********************************************************** %
warning off;
installbnt;
path(path,genpath(fullfile('./funcs')));
warning on;
close all;
clear;
clc;

% ********************************************************** %
% ********************* Control Panel ********************** %
% ********************************************************** %
% ****** input control ****** %
codec = 'mp3';
% ****** front-end control ****** %
feparam = struct(...
    'wl',4096,...
    'hopsize',2048,...
    'enlogFreq', 1,...
    'overtoneS', 0.6,...
    'enPcsSuppress', 0,...
    'enSUB', 1,...
    'enSTD', 1,...
    'enPeakNoiseRed', 0,...
    'tuningBefore', 1,...
    'globalTuning', 1,...
    'enProfiling', 0,...
    'enCosSim', 0,...
    'enNNLS', 1,...
    'enNNLSPlus', 0,...
    'enCenterbin', 1,...
    'stereotomono', 0);
% ****** Mid-end control ****** %
meparam = struct(...
    'enGesComp', 0,...
    'enGesRed', 0,...
    'wgmax', 0,...
    'useBassOnsetSegment', 0,...
    'useBassOnsetMedianSegment', 0,...
    'useWgSegment', 0,...
    'useBeatSyncSegment', 1,...
    'enProfiling', 1,...
    'useMeidanFilter', 1,...
    'useOriginalSalience', 1,...
    'useGestaltSalience', 0,...
    'btchromagram', 1);
% ****** Back-end control ****** %
% chord grainsize
grainsize = 1;
enCast2MajMin = 1; % in case we'd like to substitute others to maj or min
% dbn parameters
dbnparam = struct(...
    'muCBass',1,...
    'muNCBass',1,...
    'muTreble',1,...
    'muNoChord',1,...
    'sigma2Treble',0.2,...
    'sigma2CBass',0.1,...
    'sigma2NCBass',0.2,...
    'sigma2NoChord',0.2,...
    'selfTrans', 2);
% ****** feedback control ****** %
fbn = 0;
% ****** output control ****** %
isexamine = 1; % 0: full evaluation, 1: examine segments
df = isexamine;
enPlotFE = 1;
enPlotME = 1;
enPlotBE = 1;
enPlotFB = 1;
enPlotTS = 1;
enEval = 1;

% chordmode parameters
chordmodeparam = struct(...,
    'tetradcontrol', 1 / 3,...
    'pentacontrol', 1 / 4,...
    'hexacontrol',1 / 5,...
    'inversioncontrol', 1 / 3,...
    'enDyad', 0,...
    'enMajMin' , 1,...
    'enSusAdd' , 1,...
    'enSixth' , 1,...
    'enSeventh' , 1,...
    'enExtended' , 1,...
    'enAugDim' , 1,...
    'enMajMinBass' , 1,...
    'enSeventhBass' , 1,...
    'enOtherSlash' , 0);
chordmode = buildChordMode(chordmodeparam);

% ********************************************************** %
% ****************** Batch Process ************************* %
% ********************************************************** %
feval = fopen('evallist.txt','r');
tline = fgetl(feval);
while ischar(tline)

% ********************************************************** %
% ********************* Input ****************************** %
% ********************************************************** %

% input stage
display('input...');

[audiofolder, audiopath, cpfolder, cppath, gtfolder, gtpath] = inputDecode(tline, codec);

% ********************************************************** %
% ********************* Front End ************************** %
% ********************************************************** %
% ****** solves the least square problem ******%
display('frontend...');

[fs, nslices, endtime, S, btrack] = frontEndDecode(audiopath, feparam, df, enPlotFE);

% ********************************************************** %
% ********************* Mid End **************************** %
% ********************************************************** %
% ****** solves the segmentation problem ******%
display('midend...');

[bdrys, basegram, uppergram] = midEndDecode(S, btrack, meparam, df, enPlotME);

% ********************************************************** %
% ********************* Back End *************************** %
% ********************************************************** %
% ****** solves the optimal path problem ******%

display('backend...');

[rootgram, bassgram, treblegram, bdrys] = backEndDecode(chordmode, dbnparam,...
    basegram, uppergram, bdrys, grainsize, enCast2MajMin, nslices, df, enPlotBE);

% % ********************************************************** %
% % ********************* Feedback *************************** %
% % ********************************************************** %
% ****** reiterate the process until converge ******%

% for i = 1:1:fbn
% display(['feedback...' num2str(i)]);
% [basegram, uppergram] = updateBaseUpperGram(bassgram, bdrys, S, So, 1, 0.25);
% 
% [rootgram, bassgram, treblegram, bdrys] = backEndDecode(chordmode, dbnparam,...
%     basegram, uppergram, bdrys, grainsize, enCast2MajMin, nslices, df, enPlotFB);
% end

% ********************************************************** %
% ***************** Tonic Computation ********************** %
% ********************************************************** %
% ****** key progression by-product ******%
% [scaleSeq, tonicSeq] = tonicDecode(bassgram, treblegram, bdrys, chordmode,...
%     df, enPlotTS);

% ********************************************************** %
% ********************* Output ***************************** %
% ********************************************************** %

if isexamine
    display(strcat('end of analyzing...',audiopath));
    break;
else
    display('output...');
    writeChordProgression(cpfolder, cppath, nslices, feparam.hopsize, fs,...
        rootgram, treblegram, bdrys, endtime, chordmode);
    display(strcat('end of analyzing...',audiopath));
    tline = fgetl(feval);
end

end % pair with the very first while loop

fclose(feval);

% ********************************************************** %
% ********************* Evaluation ************************* %
% ********************************************************** %
if enEval && ~isexamine
    display('evaluation...');
    evaluate;
end

% ********************************************************** %
% ********************* Playback *************************** %
% ********************************************************** %
% if isexamine
%     display('playback...');
%     p = audioplayer(x,fs);
%     play(p);
% end