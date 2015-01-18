colormap([cool; hot]);
[x, y, z] = peaks;
minz = min(z(:));
maxz = max(z(:));

subplot(121);
peaks;
title('colormap = cool');
cmin = minz;
cmax = minz + (maxz - minz) * 2;
caxis([cmin cmax]);

subplot(122);
peaks;
title('colormap = hot');
cmin = maxz - (maxz - minz) * 2;
cmax = maxz;
caxis([cmin cmax]);





% subplot(121); 
% peaks;
% caxis([0.3, 0.4]);
% shading interp;
% title('color 1');
% 
% subplot(122); 
% peaks;
% caxis auto;
% shading interp;
% title('color 2');




% [X, Y, Z] = peaks;
% [x, y, z] = peaks;
% figure(1);
% colormap(cool);
% 
% mesh(X, Y, Z);
% tmpFigure1 = getframe(gcf);
% figure(2);
% colormap(hot);
% mesh(x, y, z);
% tmpFigure2 = getframe(gcf);
% close all;
% 
% figure(3);
% subplot(121);
% title('colormap = cool');
% imshow(tmpFigure1.cdata);
% 
% subplot(1, 2, 2);
% title('colormap = hot');
% imshow(tmpFigure2.cdata);