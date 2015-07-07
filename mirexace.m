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
% clc;

% ********************************************************** %
% ********************* Control Panel ********************** %
% ********************************************************** %
% ****** output control ****** %
isexamine = 1; % 0: full evaluation, 1: examine segments

df = isexamine;
enPlotFE = 1;
enPlotME = 1;
enPlotBE = 1;
enPlotFB = 1;
enPlotTS = 1;
enEval = 1;
% ****** input control ****** %
codec = 'mp3';
% ****** front-end control ****** %
feparam = struct(...
    'stereotomono', 1,...
    'fs',11025,... (default: 11025)
    'wl',4096,... (default: 4096)
    'hopsize',512,... (default: 512)
    ...
    'enlogFreq', 1,...
    'enCQT', 0,...
    ...
    'overtoneS', 0.7,... % (default: 0.7)
    'enPcsSuppress', 0,...
    'enSUB', 1,...
    'enSTD', 1,...
    'stdwr', 18,... % (default: 18)
    'specRollOn',0.01,... % 0 - 0.1 (default: 0.00)
    'specWhitening', 1,... % 0 - 1 (default: 1.00)
    'enPeakNoiseRed', 1,...
    ...
    'tuningBefore', 1,...
    'globalTuning', 0,...
    'localTuning', 0,...
    'phaseTuning', 1,...
    'gtTuning', 0,...
    'vampTuning', 0,...
    ...
    'enCosSim', 0,...
    'enSigifBins', 0,...
    'enNNLS', 1,...
    'enCenterbin', 0,...
    ...
    'enGesComp', 0,...
    'enGesRed', 0,...
    'wgmax', 0,...
    'normalization', inf,...
    ...
    'noSegmentation',1,...
    'useBassOnsetSegment', 0,...
    'useBassOnsetMedianSegment', 0,...
    'useWgSegment', 0,...
    'useBeatSyncSegment', 0,...
    ...
    'enProfiling', 1,...
    ...
    'useMedianFilter', 1,...
    'useMeanFilter', 0,...
    ...
    'useOriginalSalience', 1,...
    'useGestaltSalience', 0,...
    ...
    'btchromagram', 1);
% ****** Back-end control ****** %
beparam = struct(...
    'useDBN1', 1,...
    'useDBN2', 0,...
    'enCast2MajMin', 0,...
    ...
    'enChordGestalt', 1,...
    'enCombSameChords', 1,...
    'enBassCorrect', 1,...
    'enEliminShortChords', 1,...
    'grainsize', 1);
    
dbnparam = struct(...
    'muCBass',1,...
    'muNCBass',1,...
    'muTreble',1,...
    'muNoChord',1,...
    ...
    'sigma2Treble',0.2,...
    'sigma2CBass',0.1,...
    'sigma2NCBass',0.5,...
    'sigma2NoChord',0.2,...
    ...
    'selfTrans', 1e12);
dbn2param = struct(...
    'mu', 1,...
    'sigma', 0.1,...
    ...
    'wTreble', 1,...
    'wCBass', 1,...
    'wNCBass', 0.5,...
    ...
    'selfTrans', 1e12);

% chordmode parameters
chordmodeparam = struct(...
    'triadcontrol', 1 / 3,...
    'tetradcontrol', 1 / 4,...
    'pentacontrol', 1 / 5,...
    'hexacontrol',1 / 6,...
    ...
    'enUni', 0,...
    'enDyad', 0,...
    'enMajMin', 1,...
    'enSusAdd', 0,...
    'enSixthMaj', 1,...
    'enSixthMin', 0,...
    'enSeventh', 1,...
    'enExtended', 0,...
    'enAugDim', 1,...
    'enAugDim7', 0,...
    'enMajBass', 1,...
    'enMinBass', 0,...
    'enMajSeventhBass', 0,...
    'enMinSeventhBass', 0,...
    'en7SeventhBass', 0,...
    'enOtherSlash', 0);

chordmode = buildChordMode(chordmodeparam);

% ********************************************************** %
% ********************* Process **************************** %
% ********************************************************** %
feval = fopen('evallist.txt','r');
tline = fgetl(feval);

while ischar(tline)

display('input...');

[audiofolder, audiopath, cpfolder, cppath,...
    gtfolder, gtpath, gttunpath, vamptunpath] = inputDecode(tline, codec);

display('frontend...');

[bdrys, basegram, uppergram, nslices, endtime] = frontEndDecode(audiopath, gttunpath, vamptunpath,...
    feparam, df, enPlotFE);

display('backend...');

[rootgram, bassgram, treblegram, bdrys] = backEndDecode(chordmode, beparam, dbnparam, dbn2param,...
    basegram, uppergram, bdrys, nslices, df, enPlotBE);

if isexamine
    display(strcat('end of analyzing...',audiopath));
    break;
else
    display('output...');
    writeChordProgression(cpfolder, cppath, nslices, feparam.hopsize, feparam.fs,...
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
    evaluateCP;
end

% ********************************************************** %
% ********************* Playback *************************** %
% ********************************************************** %
% if isexamine
%     display('playback...');
%     p = audioplayer(x,fs);
%     play(p);
% end