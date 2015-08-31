% The following evaluator is built and executed from Johan's source code:
% https://github.com/jpauwels/MusOOEvaluator

fr = fopen('evallist.txt','r');
fw = fopen('eval.txt','w');
tline = fgetl(fr);
if ispc
    formatSpec = '%s\r\n';
else
    formatSpec = '%s\n';
end
while ischar(tline)
    sufposes = strfind(tline,'.');
    ntline = tline(1:sufposes(end)-1);
    fprintf(fw, formatSpec, ntline);
    tline = fgetl(fr);
end
fclose(fr);
fclose(fw);

suffix = 'jaychou-chordino';
evallist = 'eval.txt';

gtroot = './gt/';
cdroot = './cd/';
gtfolder = strcat(gtroot);
cdfolder = strcat(cdroot);

testfolder = cdfolder;

outroot = './outcd/';

% **************** segmentation ****************
evaltype = 'Inner';
disp([evaltype '......']);
evaloutseg = [outroot 'results' 'Segmentation' '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutseg ' --csv'...
    ' --segmentation ' evaltype];
system(evalcmd);
dbtype(evaloutseg,'3:7');

% ************************ Chords *************************** %
evaltype = 'Bass';
disp([evaltype '......']);
evaloutbass = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutbass ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutbass,'3:7');

evaltype = 'MirexRoot';
disp([evaltype '......']);
evaloutroot = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutroot ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutroot,'3:7');

evaltype = 'MirexMajMin';
disp([evaltype '......']);
evaloutmajmin = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutmajmin ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutmajmin,'3:7');

evaltype = 'MirexMajMinBass';
disp([evaltype '......']);
evaloutmajminbass = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutmajminbass ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutmajminbass,'3:7');

evaltype = 'MirexSevenths';
disp([evaltype '......']);
evaloutsevenths = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutsevenths ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutsevenths,'3:7');

evaltype = 'MirexSeventhsBass';
disp([evaltype '......']);
evaloutseventhsbass = [outroot 'results' evaltype '/' suffix '.txt'];
evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
    testfolder ' --refext .lab --testext .txt --output ' evaloutseventhsbass ' --csv'...
    ' --chords ' evaltype];
system(evalcmd);
dbtype(evaloutseventhsbass,'3:7');

% evaltype = 'ChromaRecall';
% disp([evaltype '......']);
% evalout = [outroot 'results' evaltype '/' suffix '.txt'];
% evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
%     testfolder ' --refext .lab --testext .txt --output ' evalout ' --csv'...
%     ' --chords ' evaltype];
% system(evalcmd);
% 
% evaltype = 'ChromaPrecision';
% disp([evaltype '......']);
% evalout = [outroot 'results' evaltype '/' suffix '.txt'];
% evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
%     testfolder ' --refext .lab --testext .txt --output ' evalout ' --csv'...
%     ' --chords ' evaltype];
% system(evalcmd);
% 
% evaltype = 'ChromaFmeasure';
% disp([evaltype '......']);
% evalout = [outroot 'results' evaltype '/' suffix '.txt'];
% evalcmd = ['eval --list ' evallist ' --refdir ' gtfolder ' --testdir '...
%     testfolder ' --refext .lab --testext .txt --output ' evalout ' --csv'...
%     ' --chords ' evaltype];
% system(evalcmd);

