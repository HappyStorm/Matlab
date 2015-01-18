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

% 出現在 HTML 的註解內的 email，不須要抓出。（換句話說，你必須先刪除 HTML 的註解，然後再進行 email 抽取。HTML 註解是以「<!--」開始，以「-->」 結尾。）
% 除了註解外，請抓出所有的 email 帳號，無論它們是可連結或不可連結。
% 再回傳所有 email 帳號前，請先使用 unique 指令來進行唯一化及排序。