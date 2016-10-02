Y=[1 2; 1 3; 1 4];
theta=[1;1];
theta=[1;1];
z=Y*theta

for i=1:5
for j=1:2
  s(j,1)=s(j,1) - (z'*Y(:,j));
end
s
end
