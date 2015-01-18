function output = Q2_101062319(cashFlowVec, x0, timeUnit4cashFlow, timeUnit4compounding);

TCF = timeUnit4cashFlow;
switch (timeUnit4compounding)
    case 'month'
        TUC = 1;
    case 'year'
        TUC = 12;
end
output = fzero(@npvCompute, x0);

    function npv = npvCompute(x)
        n = length(cashFlowVec);
        if(TUC==12)
            if(TCF==1)
                npv = sum(cashFlowVec./((1+x).^(12.*(0:n-1))));   % Yearly compounding
            elseif(TCF==3)
                npv = sum(cashFlowVec./((1+x).^(4.*(0:n-1))));
            elseif(TCF==6)
                npv = sum(cashFlowVec./((1+x).^(2.*(0:n-1))));
            else 
                npv = sum(cashFlowVec./((1+x).^(0:n-1)));
            end
        else
            if(TCF==1)
                npv = sum(cashFlowVec./((1+x/12).^(144.*(0:n-1))));   % Yearly compounding
            elseif(TCF==3)
                npv = sum(cashFlowVec./((1+x/12).^(48.*(0:n-1))));
            elseif(TCF==6)
                npv = sum(cashFlowVec./((1+x/12).^(24.*(0:n-1))));
            else 
                npv = sum(cashFlowVec./((1+x/12).^(12.*(0:n-1))));
            end
        end
    end

    if(TCF~=12 && TUC==12)
        output = nan;
    end
end

% irr:                  Internal rate of return
% cashFlowVec:          Cash flow vector
% x0:                   Initial guess of IRR, default to 0
% timeUnit4cashFlow:    Unit in month for cash flow, with the following possible values:
% 1:    month
% 3:    quarter
% 6:    half year
% 12:   year (default)

% timeUnit4compounding: Time unit compounding, with the following possible values:
% 'month' (default) for monthly compounding
% 'year' for yearly compounding (which is a valid option only when timeUnit4cashFlow is 12)
%   Note that if timeUnit4cashFlow is not 12 and timeUnit4compounding is 'year', the function should return nan.



% c = -0.9133 -0.1524 -0.8258 -0.5383 0.9961 0.0782 0.4427 0.1067 0.9619 0.0046 0.7749 0.8173
% Q2(c,0,12,'year')
% ans = 0.0938
% Q2(c,0,3,'month')
% ans = 0.0224
% Q2(c,0,6,'month')
% ans = 0.0449
% Q2(c,0,12,'month')
% ans = 0.0900