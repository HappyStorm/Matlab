function output = emailExtract(URL)
% ppt p.8 & p.12 & p.26 & p.33
URL_str = urlread(URL);

HTML_pattern = '<!--((.|\n)*?)-->';
[com_s, com_e] = regexp(URL_str, HTML_pattern);
for i=1:length(com_s)
    URL_str(com_s(i):com_e(i)) = ' ';
end

% mail_pattern = '<a href="mailto:(.*?)">(.*?)</a>';
mail_pattern = '[\w\.]+\s?@\s?[\w\.-]+';

[mail_s, mail_e] = regexp(URL_str, mail_pattern);

mail = cell(1, length(mail_e));
for i=1:length(mail_s);
    mail{1,i} = URL_str(mail_s(i):mail_e(i));
end
    
output = unique(mail);
end
% <a href="mailto:scchang@cs.nthu.edu.tw">scchang@cs.nthu.edu.tw</a></td>
% URL = 'http://web.cs.nthu.edu.tw/files/15-1015-9870,c309-1.php';
% URL = 'http://www.csie.ncku.edu.tw/new/nckucsie/index.php?content=teacher';

% �X�{�b HTML �����Ѥ��� email�A�����n��X�C�]���y�ܻ��A�A�������R�� HTML �����ѡA�M��A�i�� email ����CHTML ���ѬO�H�u<!--�v�}�l�A�H�u-->�v �����C�^
% ���F���ѥ~�A�Ч�X�Ҧ��� email �b���A�L�ץ��̬O�i�s���Τ��i�s���C
% �A�^�ǩҦ� email �b���e�A�Х��ϥ� unique ���O�Ӷi��ߤ@�ƤαƧǡC