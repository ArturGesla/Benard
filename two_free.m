f=@(K,Ra)(pi^2+K^2)^3/K^2-Ra;
K=1:0.1:8;
K=K';
Ra=100:10:1e3;
z=zeros(length(K),length(Ra));
for i=1:length(K)
    for j=1:length(Ra)
        z(i,j)=f(K(i),Ra(j));
    end
     display(i/length(K)*100);
end
%%
contour(Ra,K,z,[0,0])
grid on;
grid minor;

