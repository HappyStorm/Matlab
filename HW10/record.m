fs = 96000;		% 取樣頻率
nBits = 24;
nChannel = 2;
duration = 300;		% 錄音時間
recObj = audiorecorder(fs, nBits, nChannel);
%fprintf('按任意鍵後開始 %g 秒錄音：', duration); pause
fprintf('錄音中...');
recordblocking(recObj, duration);
fprintf('錄音結束\n');
%fprintf('按任意鍵後開始播放：'); pause
play(recObj);

fprintf('按任意鍵後開始儲存：'); pause


audioFile='leave.wav';	% 欲儲存的 wav 檔案
fprintf('Saving to %s...\n', audioFile);

y = getaudiodata(recObj, 'double'); % get data as a double array
audiowrite(audioFile, y, fs);