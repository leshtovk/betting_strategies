function [MS, G] = apply_strategy_b(SD)
% APPLY_STRATEGY_B takes a shuffled deck SD
% and applies the following betting strategy:
% - if both colors are possible on the next draw, 0$ are placed
% - when there is only one color remaining, all the money is placed
% on the remaining color
% The function returns:
% - a 2 by 26 matrix MS which, as its i-th column, contains the 
% amount black and red cards respectively before the i-th draw 
% - a row vector G which contains the balance of
% money at every step of the game

    % A sequence of cards of only a single color can start from
    % the 27th draw onwards
    
    % The relevant half of the deck:
    H = SD(27:end);
    HB = H == "B";
    HR = H == "R";
    
    % we want to know how many black/red cards there are
    % left before the i-th draw
    J = tril(ones(26));
    
    % MS ... matrix of sums
    MS = [HB; HR] * J;
    
    % shorter strings of uni-color cards are more likely
    % than longer ones, so we begin the search from the end
    
    i = 26;
    while MS(1, i) * MS(2, i) == 0
        i = i - 1;
    end
   
   
   % the money doubles on a winning bet and stays at 1 = 2^0
   % while it is still possible to draw two colors
   
   % P ... powers 
   P = [zeros(1, 26 + i) (1:26-i)];
   
   % G ... gains - the amount of money we have at each step
   G = 2 .^ P; 
    
end