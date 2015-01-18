function output = myAdd(a, b)
    [aRow, aColumn] = size(a);
    [bRow, bColumn] = size(b);
    rowMax = max(aRow, bRow);
    columnMax = max(aColumn, bColumn);
    
    if(aRow == bRow && aColumn == bColumn)
        output = a+b;
    elseif(aRow == rowMax && aColumn == columnMax)
        b(rowMax, columnMax) = 0;
        output = a+b;
    elseif(bRow == rowMax && bColumn == columnMax)
        a(rowMax, columnMax) = 0;
        output = a+b;
    else
        a(rowMax, columnMax) = 0;
        b(rowMax, columnMax) = 0;
        output = a+b;
    end
end