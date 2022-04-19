function col = get_color(C)
% GET_COLOR returns the color of the card C
% C is represented as a string containing: 
% - one of the uppercase letters H, T, C, P 
% which represent the suit of the card
% - a number from 1 to 13

    if C.contains('H') || C.contains('T')
        col = "R";
    else
        col = "B";
        
    end

end