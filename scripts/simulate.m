
% THIS SCRIPT TAKES A FEW MINUTES TO RUN

% H ... hearts
% T ... tiles
% C ... clubs
% P ... pikes

% the original deck
D = [
    "H1" "H2" "H3" "H4" "H5" "H6" "H7" "H8" "H9" "H10" "H11" "H12" "H13",... 
    "T1" "T2" "T3" "T4" "T5" "T6" "T7" "T8" "T9" "T10" "T11" "T12" "T13",...
    "C1" "C2" "C3" "C4" "C5" "C6" "C7" "C8" "C9" "C10" "C11" "C12" "C13",...
    "P1" "P2" "P3" "P4" "P5" "P6" "P7" "P8" "P9" "P10" "P11" "P12" "P13"
];

% --------------------------------------------------------------------

% we will simulate each strategy 100000 times

N = 1000000;
M = multiple_shuffles(D, N);

% G1 is a 100000 times 52 matrix which contains the records for 
% strategy A
% Each row shows the amount of money we have at each step
% of the game
%
% Similarly G2 for strategy B; G3 for strategy C

G1 = zeros(N, 52);
G2 = zeros(N, 52);
G3 = zeros(N, 52);

i = 1;
while i <= N
    [MS, B, Ga] = apply_strategy_a(M(i, :));
    G1(i, :) = Ga;
    
    [MS, Gb] = apply_strategy_b(M(i, :));
    G2(i, :) = Gb;
    
    [MS, B, Gc] = apply_strategy_c(M(i, :));
    G3(i, :) = Gc;
    
    i = i + 1;
end

% averages
A_avg = sum(G1) / N;
B_avg = sum(G2) / N;
C_avg = sum(G3) / N;


% ------------------------------------------------------------------
% plotting average performance

X = 1:52;
y_upper_avg = max([max(A_avg) max(B_avg) max(C_avg)]);

% strategy A
figure;
scatter(X, A_avg, 'filled');
ylim([0, y_upper_avg + 0.5])
title('Average performance of strategy A')
xlabel('bet') 
ylabel('money') 

% strategy B
figure;
scatter(X, B_avg, 'filled');
ylim([0, y_upper_avg + 0.5])
title('Average performance of strategy B')
xlabel('bet') 
ylabel('money') 

% strategy C
figure;
scatter(X, C_avg, 'filled');
ylim([0, y_upper_avg + 0.1])
title('Average performance of strategy C')
xlabel('bet') 
ylabel('money') 

