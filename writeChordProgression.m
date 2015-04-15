% write out the chord progression as txt file according to the MIREX
% standard: http://www.music-ir.org/mirex/wiki/2015:Audio_Chord_Estimation
function writeChordProgression(audiopath, nslices, hopsize, fs, outchordogram, outbassgram, outboundaries, endtime)

chordlrc = [audiopath(1:end-4) '.cp.txt'];
fw = fopen(chordlrc,'w');
formatSpec2 = '%s\n';
tw = ((hopsize/fs)*(0:nslices));

% add non-chord before start if needed
if outboundaries(1) ~= 1
    sec0 = tw(outboundaries(1));
    timestr0 = num2str(sec0);
    s = ['0', ' ', timestr0, ' ', 'N'];
    fprintf(fw, formatSpec2, s);
end

lenoutchordogram = length(outchordogram);
for i = 1:1:lenoutchordogram
    sec1 = tw(outboundaries(i));
    timestr1 = num2str(sec1);
    sec2 = tw(outboundaries(i+1));
    timestr2 = num2str(sec2);
    chordstr = outchordogram{i};
    s = [timestr1, ' ', timestr2, ' ', chordstr];
    fprintf(fw, formatSpec2, s);
end

% add non-chord after finish if needed
if sec2 ~= endtime
    sec3 = endtime;
    timestr3 = num2str(sec3);
    s = [timestr2, ' ', timestr3, ' ', 'N'];
    fprintf(fw, formatSpec2, s);
end

fclose(fw);