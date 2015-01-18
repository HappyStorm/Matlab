function regGeneralStar(n, k)

% exp(i*2*pi*k/n) --> e^(i*theata) = cos(theata) + i*sin(theata)
% Now theata = (2*pi*k) / n 
    
    if n<3
        error('n can not less than 3');
        
    else
        hold off;
        % Draw the circle
        theta = linspace(0, 2*pi);
        x = cos(theta);
        y = sin(theta);
        plot(x, y, 'r');
        hold on;
        
        % Draw the point & line
        for i = 0 : n,
            theta = 2 * pi * i / n;
            x = cos(theta);
            y = sin(theta);
            plot(x, y, 'bo');
            hold on;
            
            stheta = 2 * pi * k * i / n;
            etheta = 2 * pi * k * (i+1) / n;
            X = [cos(stheta), cos(etheta)];
            Y = [sin(stheta), sin(etheta)];
            plot(X, Y, 'b');
            hold on;
            
            for index = 0 : n,
                tt = 2 * pi * index / n;
                qq = 2 * pi * (index+k) / n;
                Xt = [cos(tt), cos(qq)];
                Yt = [sin(tt), sin(qq)];
                plot(Xt, Yt, 'b');
                hold on;
            end
        end;
        
        % Draw the line
%         for i = 0 : n,
%             stheta = 2 * pi * k * i / n;
%             etheta = 2 * pi * k * (i+1) / n;
%             X = [cos(stheta), cos(etheta)];
%             Y = [sin(stheta), sin(etheta)];
%             plot(X, Y, 'b');
%             hold on;
%             for index = 0 : n
%                 st = 2 * pi * (index) / n;
%                 et = 2 * pi * k * (index+1) / n;
%                 Xt = [cos(st), cos(et)];
%                 Yt = [sin(st), sin(et)];
%                 plot(Xt, Yt, 'b');
%                 hold on;
%             end
%         end
    end
end

