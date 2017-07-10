% A -Laplace u + u = f Poisson-egyenlet megoldása az egységnégyzeten,
% homogén Dirichlet-peremfeltétel esetén. Szabályos háromszögrácsot
% alkalmazunk.

n=3;
f=@(x,y)(1 + 2*pi^2)*(sin(pi*x).*sin(pi*y));

% A merevségi mátrix konstrukciója
h=1/(n+1);
a = 2*(1+h^2/12)+4*(1/2+ h^2/12); % a(phi_i,phi_j), ha i=j
b = 2*(-1/2+h^2/24);  % a(phi_i,phi_j), ha i=j+1,j-1,j+n,j-n
c = 2*(0+h^2/24); % a(phi_i,phi_j), ha i=j+n+1,j+n-1,j-n+1,j-n-1
A = gallery('tridiag',n,b,a,b); 
B = gallery('tridiag',n,c,b,c);
Q = gallery('tridiag',n,1,0,1);
K = kron(speye(n),A)+kron(Q,B);

% A terhelési vektor
[X,Y]=meshgrid(h:h:1-h,1-h:-h:h);
b=h^2*reshape(f(X,Y),n^2,1);

% Az egyenletrendszer megoldása 
u=K\b;

% A megoldás ábrázolása
figure(4)
z=zeros(n+2);
z(2:n+1,2:n+1)=reshape(u,n,n);
tri=[0 0 0];
for i=1:(n+1)*(n+2)
    if mod(i,n+2)~=0
        tri(length(tri(:,1))+1,:)=[i,i+1,i+n+3];
        tri(length(tri(:,1))+1,:)=[i,i+n+2,i+n+3];
    end
end
tri(1,:)=[];
[xi,yi]=meshgrid(0:h:1,1:-h:0);
trisurf(tri,xi,yi,z)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
zlabel('u','FontSize',14)

fig = gcf;
fig.PaperPositionMode = 'auto';
print(fig,'2dpelda','-dpng','-r300')
