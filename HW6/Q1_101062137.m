function output = Q1_101062137(a, b)
    A = fieldnames(a);
    B = fieldnames(b);
    C = setdiff(B,A);
    D = setdiff(A,B);
    for i=1:max(size(a))
        for j=1:max(size(C))
        a(i).(C{j})=[];
        end
    end
    
    for i=1:max(size(b))
        for j=1:max(size(D))
        b(i).(D{j})=[];
        end
    end
    
    output = [a, b];
end

