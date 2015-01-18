t = 0 : 0.1 : 4*pi;
y = sin(t) + rand(1, length(t));
plot(t, y, '.-');
hold on;

for i=1 : 125
    if (i==1)
        if y(i) > y(i+1)
            plot(t(i), y(i), 'r:o');
            text(t(i), y(i), sprintf('   (%.2f, %.2f)', t(i), y(i)), 'HorizontalAlignment', 'left');
        end;
    elseif (i>1 && i<125)
        if (y(i) >= y(i-1) && y(i) >= y(i+1))
           plot(t(i), y(i), 'r:o');
           text(t(i), y(i), sprintf('   (%.2f, %.2f)', t(i), y(i)), 'HorizontalAlignment', 'left');
        end;
    else
        if y(i)>y(i-1)
            plot(t(i), y(i), 'r:o');
            text(t(i), y(i), sprintf('  (%.2f, %.2f)', t(i), y(i)), 'HorizontalAlignment', 'left');
        end;
    end;
end;