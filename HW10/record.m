fs = 96000;		% �����W�v
nBits = 24;
nChannel = 2;
duration = 300;		% �����ɶ�
recObj = audiorecorder(fs, nBits, nChannel);
%fprintf('�����N���}�l %g ������G', duration); pause
fprintf('������...');
recordblocking(recObj, duration);
fprintf('��������\n');
%fprintf('�����N���}�l����G'); pause
play(recObj);

fprintf('�����N���}�l�x�s�G'); pause


audioFile='leave.wav';	% ���x�s�� wav �ɮ�
fprintf('Saving to %s...\n', audioFile);

y = getaudiodata(recObj, 'double'); % get data as a double array
audiowrite(audioFile, y, fs);