function M = multiple_shuffles(D, N)
% MULTIPLE_SHUFFLES takes a deck of cards D and returns
% a N by 52 matrix M whose every row is a shuffled deck obtained
% by calling the function SHUFFLE on the deck D

    M = strings(N, length(D));
    
    i = 1;
    while N > 0
       
        SD = shuffle(D);
        M(i, :) = SD;
        
        N = N - 1;
        i = i + 1;
        
    end


end