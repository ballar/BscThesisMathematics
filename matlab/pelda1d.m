% -u" + u = f FEM, tehervektor közelítése trapéz formulával 

n = 6;
h = 1/(n+1);
x = h:h:1-h;
f = (-x.^4 + x.^3 + 12*x.^2 - 6*x)';

A = gallery('tridiag',n,-1,2,-1)/h + gallery('tridiag',n,1/6,2/3,1/6)*h;
b = f*h;
u = A\b;

figure(3)
set(figure(3), 'Position', [403   246   560   270])
xx = 0:0.01:1;
upontos = -xx.^4+xx.^3;
plot([0,x,1], [0,u',0], '-b', xx, upontos, '.r', 'LineWidth',3)
xlabel('x','FontSize',14)
ylabel('u','FontSize',14)

fig = gcf;
fig.PaperPositionMode = 'auto';
print(fig,'1dpelda','-dpng','-r300')

