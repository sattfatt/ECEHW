%% problem 1
% (i) initialize matrices
A = [2 59 2 5
    41 11 0 4
    18 2 3 9
    6 23 27 10
    5 8 5 1]
B = [0 1 0 1
     0 1 1 1
     0 0 0 1
     1 1 0 1
     0 1 0 0]
 % (ii) pointwise multiply
 C = A.*B
 % (iii)     
 C(2,:)*C(5,:)'
 % (iv) 
 [row,col] = find(C == max(max(C)))
 V = max(max(C))
 [row,col,] = find(C == min(min(C)))
 V = min(C)
 % (v)
 D = [C(1,:)-C(1,:);C(2,:)-C(1,:);C(3,:)-C(1,:);C(4,:)-C(1,:);C(5,:)-C(1,:)]
 % (vi)
 [row,col] = find(D == max(max(D)))
 V = max(max(D))
 [row,col,] = find(D == min(min(D)))
 V = min(min(D))
 
 %% problem 2
 % (i)
 % -loc is the position of the white square
 % -based on adding vector [1,0] the robot should move down by 1
 % -when adding the object the robot cant move past it
 % -not intelligent because it cannot move around obstacles
 
 
 
 
