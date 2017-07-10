clear all, close all
%% Irányonkénti belsõ osztópontok száma
n = 30;

%% Forrásfsggvények megadása

% k konstansok
k0 = 1/2;
k1 = 1/3;
k2 = 1/5;

% konstans 1 függvény
f_const = @(X,Y,k) ones(size(X,1));
str_const = @(k) 'f \equiv 1';
figname_const = 'const';

% 1, ha x <= k , 
% 0 különben
f_leftside = @(X,Y,k) X <= k;
str_leftside = @(k) ['f = 1, ha x < ', num2str(k,2), ...
                    ', és 0 különben'];
figname_leftside = 'leftside';

% 1, ha x vagy y közelebb van a 0-hoz vagy 1-hez, mint k,
% 0 különben
f_edge = @(X,Y,k) (X <= k) | (X >= 1-k) ...
                | (Y <= k) | (Y >= 1-k);
str_edge = @(k) ['f = 0, ha ', num2str(k,2),'< x,y <',...
                num2str(1-k,2),', 1 különben'];
figname_edge = 'edge';

% 1, ha k < x,y < 1-k  
% 0 különben
f_center = @(X,Y,k) (X >= k) & (X <= 1-k) ...
                  & (Y >= k) & (Y <= 1-k);
str_center = @(k) ['f = 1, ha ', num2str(k,2),'< x,y < ',...
                  num2str(1-k,2),', 0 különben'];
figname_center = 'center';

%% Megoldó futtatása a forrásfüggvényekre

u_const = FEM_2DPoissonHomogenousDirichlet( n, 1,...
                   f_const,str_const,figname_const );

u_leftside0 = FEM_2DPoissonHomogenousDirichlet( n, k0,...
               f_leftside, str_leftside,figname_leftside );
u_leftside1 = FEM_2DPoissonHomogenousDirichlet( n, k1,...
               f_leftside, str_leftside,figname_leftside );
u_leftside2 = FEM_2DPoissonHomogenousDirichlet( n, k2,...
               f_leftside, str_leftside,figname_leftside );

u_edge1 = FEM_2DPoissonHomogenousDirichlet( n, k1,...
                        f_edge,str_edge,figname_edge );
u_edge2 = FEM_2DPoissonHomogenousDirichlet( n, k2,...
                        f_edge,str_edge,figname_edge );

u_center1 = FEM_2DPoissonHomogenousDirichlet( n, k1,...
                    f_center,str_center,figname_center );
u_center2 = FEM_2DPoissonHomogenousDirichlet( n, k2,...
                    f_center,str_center,figname_center );