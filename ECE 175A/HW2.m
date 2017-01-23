b = [1 5 10];
eigen = [0 0 0;0 0 0];
Z = zeros(201,201);
for itr=1:1:3
   A = [5 b(itr);b(itr) 5];
   x1 = -100:100;
   x2 = -100:100;
   for i=1:201
       for j=1:201
           Z(i,j) = [x1(i) x2(j)]*A*[x1(i) x2(j)]';
       end
   end
   figure;
   surf(x1,x2,Z)
   eig(A)
end