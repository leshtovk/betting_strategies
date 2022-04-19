function SD = shuffle(D)
% SHUFFLE takes a deck of cards D and returns
% a shuffled deck SD, constructed by selecting
% cards from the deck D at random
%
% The cards in the shuffled deck SD are not represented
% by their suits and numbers, but by their color

    n = 52;
    SD = strings(1, n);
    
    i = 1;
    while n > 0
        
        k = randi(n);
        
        % we place the COLOR of the selected card in SD
        color = get_color(D(k));
        SD(i) = color;

        % we remove the selected card from D
        D = [D(1:k-1) D(k+1:end)];
        n = n - 1;
        i = i + 1;
    
    end

end