function [ u ] = ...
    FEM_2DPoissonHomogenousDirichlet( n, k, rhs_function,...
                                    rhs_str ,fig_name)
% A -Laplace u = f [0,1]x[0,1]-en, homog�n Dirichlet-perem, FEM mo.

if  nargin == 2
    rhs_str = @(k) '';
end

% H�l� gener�l�sa
h=1/(n+1);
[X,Y]=meshgrid(h:h:1-h,1-h:-h:h);

% Forr�sf�ggv�ny
f = rhs_function(X,Y,k);

% A tehervektor konstrukci�ja
b=reshape(f,n^2,1)*h^2;

% Merevs�gi m�trix konstrukci�ja
A=gallery('poisson',n);

% Az egyenletrendszer megold�sa
uv=A\b;

% A megold�s �br�zol�sa
um=reshape(uv,n,n);
u=zeros(n+2);
u(2:end-1,2:end-1)=um;

% H�romsz�gek konstrukci�ja
tri = zeros( 2*(n+1)*(n+1), 3 );
l = 1;
for i = 1 : (n+1)*(n+2)
    if mod(i,n+2) ~= 0
        tri(l,:) = [i,i+1,i+n+2];
        tri(l+1,:) = [i+1,i+1+n+2,i+n+2];
        l = l+2;
    end
end

figure
[Xnagy,Ynagy]=meshgrid(0:h:1,0:h:1);
trisurf(tri,Xnagy,Ynagy,u)

title( rhs_str(k),'FontSize', 16)
colorbar
xlabel('x','FontSize', 16)
ylabel('y','FontSize', 16)
zlabel('u','FontSize', 16)

% �bra ment�se file-ba
fig = gcf;
fig.PaperPositionMode = 'auto';
fig_name = [fig_name,int2str(100*k)];
print(fig,fig_name,'-dpng','-r300')

end