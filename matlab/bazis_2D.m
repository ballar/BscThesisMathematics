clear all, close all

n = 3;
% belsõ pontok: i,j = 1,...,n
% perempontok: i értéke 0 vagy n+1, a j=0,...n+1, vagy fordítva
xi = 2;
yj = 2;
n1d = 9;
k = 6;

h=1/(n+1);
h1d = 1/(n1d+1);


% A megoldás ábrázolása
figure(1)
z=zeros(n+2);
z(n+2-yj,xi+1)=1;
tri=[0 0 0];
for i=1:(n+1)*(n+2)
    if mod(i,n+2) ~= 0
        tri(length(tri(:,1))+1,:)=[i,i+1,i+n+3];
        tri(length(tri(:,1))+1,:)=[i,i+n+2,i+n+3];
    end
end
tri(1,:) = [];
[x,y] = meshgrid(0:h:1,1:-h:0);
trisurf(tri,x,y,z,'facealpha',0.7,'FaceColor','green')
% title('\phi_{i,j} sátorfüggvény','FontSize',14)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)

fig = gcf;
fig.PaperPositionMode = 'auto';
print(fig,'satorfv','-dpng','-r300')

figure(2)
set(figure(2), 'Position', [403   246   560   270])
x1d = 0: h1d: 1;
u = zeros(1,n1d+2);
u(k) = 1;
plot(x1d, u, '-b','LineWidth',3 )
% title('\phi_{i} kalapfüggvény','FontSize',14)
xlabel('x','FontSize',14)

fig = gcf;
fig.PaperPositionMode = 'auto';
print(fig,'kalapfv','-dpng','-r300')




