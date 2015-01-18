function [] = writeGIF()          
  
    for i = 1 : 1000
        regGeneralStar(79, i);
        drawnow

        frame = getframe(1);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        outfile = 'regGeneralStar.gif';
    
        % On the first loop, create the file. In subsequent loops, append.
        if i==1
            imwrite(imind, cm, outfile, 'gif', 'DelayTime', 0.03, 'loopcount', inf);
        else
            imwrite(imind, cm, outfile, 'gif', 'DelayTime', 0.03, 'writemode', 'append');
        end
    end
end
