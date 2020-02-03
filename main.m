clear all;
clc;
%%
q0=@(K,Ra) K*sqrt((Ra/K^3)^(1/3)-1);
q3=@(K,Ra) K*sqrt(1+1/2*(Ra/K^3)^(1/3)*(1+sqrt(3)*1i));
q5=@(K,Ra) K*sqrt(1+1/2*(Ra/K^3)^(1/3)*(1-sqrt(3)*1i));

BC11=@(K,Ra)cos(q0(K,Ra)/2);
BC21=@(K,Ra)-q0(K,Ra)*sin(q0(K,Ra)/2);
BC31=@(K,Ra)(q0(K,Ra)^2+K^2)^2*cos(q0(K,Ra)/2);

BC12=@(K,Ra)cosh(q3(K,Ra)/2);
BC22=@(K,Ra)q3(K,Ra)*sinh(q3(K,Ra)/2);
BC32=@(K,Ra)(q3(K,Ra)^2-K^2)^2*cosh(q3(K,Ra)/2);

BC13=@(K,Ra)cosh(q5(K,Ra)/2);
BC23=@(K,Ra)q5(K,Ra)*sinh(q5(K,Ra)/2);
BC33=@(K,Ra)(q5(K,Ra)^2-K^2)^2*cosh(q5(K,Ra)/2);


BC=@(K,Ra)[BC11(K,Ra),BC12(K,Ra),BC13(K,Ra);
    BC21(K,Ra),BC22(K,Ra),BC23(K,Ra);
    BC31(K,Ra),BC32(K,Ra),BC33(K,Ra)];
%%
K=0.01:0.1:5;
K=K';
Ra=160:10:8000;
z=zeros(length(K),length(Ra));
for i=1:length(K)
    for j=1:length(Ra)
        z(i,j)=real(det(BC(K(i),Ra(j))));
    end
     display(i/length(K)*100);
end
%%
Z=abs(z);
%%
contour(Ra,K,z)
%%
surf(Ra,K,z)