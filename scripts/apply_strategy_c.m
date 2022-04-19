function [MS, B, G] = apply_strategy_c(SD)
% APPLY_STRATEGY_C takes a shuffled deck SD
% and applies the following betting strategy:
% - if both colors are equally likely on the next turn,
% all the money is placed based on a coin toss
% - if both colors are not equally likely, all the money is placed
% on the color which is less likely to be drawn
% - if there is only one color remaining, all the money is placed
% on the remaining color
% The function returns:
% - a 2 by 26 matrix MS which, as its i-th column, contains the 
% amount black and red cards respectively before the i-th draw 
% - a row vector B which contains the bets we make at every
% step of the game
% - a row vector G which contains the balance of
% money at every step of the game

    % B ... bets
    B = strings(1, 52);
    
    % before the i-th turn, we want to know how many black/red cards
    % we have already seen; 2 <= i <=52
    
    J = triu(ones(52));
    SDB = SD == "B";
    SDR = SD == "R";
    
    % MS ... matrix of sums
    MS = [SDB; SDR] * J;
    
    % the first bet is decided by a coin toss
    Coin = ["R", "B"];
    B(1) = Coin(randi(2)); 
    
    i = 2;
    
    % while both colors are still possible
    while (i <= 52) && (MS(1, i-1) ~= 26) && (MS(2, i-1) ~= 26)
         
        % if BLACK is LESS likely
        if MS(1, i-1) > MS(2, i-1)
            B(i) = "B";
       
        % if RED is LESS likely
        elseif MS(1, i-1) < MS(2, i-1)
            B(i) = "R";
       
        % if red and black are EQUALLY likely
        else
            B(i) = Coin(randi(2));
        end
        
        i = i + 1;
            
    end
    
    
    % if BLACK is exhausted
    if MS(1, i-1) == 26
        B(i:end) = "R";
        
    % if RED is exhausted
    elseif MS(2, i-1) == 26
        B(i:end) = "B";
    
    end
    
    
    Success = B == SD;
    k = find(Success == 0, 1); % first missed bet
    if isempty(k)
        G = 2 .^ (1:52);
    elseif k == 1
        G = zeros(1, 52);
    else
        G = [2 .^ (1:k-1) zeros(1, 52-k+1)];
    end
        
    
end